#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>

#ifdef __linux__
  #include <linux/version.h>
  #if LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,0)
    #warning "Linux kernel is too old for termios2"
  #else
    #include "set_tty_speed_via_termios2.h"
    #define MAY_USE_TERMIOS2 1
  #endif
#endif /* __linux__ */


int set_fd_flags  (int fd, int mask, int onoff)
{
  int  r;
  int  flags;

    /* Get current flags */
    flags = r = fcntl(fd, F_GETFL, 0);
    if (r < 0) return -1;

    /* Modify the value */
    flags &=~ mask;
    if (onoff != 0) flags |= mask;

    /* And try to set it */
    r = fcntl(fd, F_SETFL, flags);
    if (r < 0) return -1;

    return 0;
}

int main(int argc, char *argv[])
{
  enum {N_CON = 0, N_TTY = 1};

  int     fdpair[2];  // FDs for select() and read()
  int     wrpair[2];  // fds for write()
  fd_set  rfds;
  int     n;
  int     maxfd;
  int     r;
  char    buf[100];
  struct termios  newtio;

    if (argc < 3)
    {
        fprintf(stderr, "Usage: %s /dev/ttySOME_TTY_NAME SPEED_IN_BAUDS_PER_SECOND\n", argv[0]);
        return 1;
    }

    fdpair[N_CON] = 0; // stdin
    if (isatty(fdpair[N_CON])  &&  argc <= 3) // Switch to noncanonical mode (so that input is available immediately) if we are at terminal and this switch is NOT explicitly forbidden by argv[3] presence
    {
        tcgetattr(fdpair[N_CON],          &newtio);
        //cfmakeraw                    (&newtio); // Use with caution!  Ctrl+C,Ctrl+Z, etc. stop working and these changes remain in effect even after program termination
        newtio.c_lflag |=  ECHO;
        newtio.c_lflag &=~ ICANON;
        tcsetattr(fdpair[N_CON], TCSANOW, &newtio);
    }
    set_fd_flags(fdpair[N_CON], O_NONBLOCK, 1);

    fdpair[N_TTY] = open(argv[1], O_RDWR | O_NOCTTY | O_NONBLOCK);
    if (fdpair[N_TTY] < 0)
    {
        perror("open()");
        return 2;
    }
    bzero(&newtio, sizeof(newtio));
    newtio.c_cflag     = B9600 | CS8 | CLOCAL | CREAD;
    newtio.c_iflag     = IGNPAR;
    newtio.c_oflag     = 0;
    newtio.c_lflag     = 0;
    newtio.c_cc[VTIME] = 0;
    newtio.c_cc[VMIN]  = 1;
    tcflush(fdpair[N_TTY], TCIOFLUSH);
#if MAY_USE_TERMIOS2
    r = set_tty_speed_via_termios2(fdpair[N_TTY], newtio.c_cflag, atoi(argv[2]));
#else
    r = tcsetattr(fdpair[N_TTY], TCSANOW, &newtio);
#endif
    if (r != 0)
    {
        perror("tcsetattr()");
    }

    wrpair[N_CON] = 1; // stdout
    wrpair[N_TTY] = fdpair[N_TTY];

    while (1)
    {
        FD_ZERO(&rfds);
        for (maxfd = -1, n = 0;  n < 2;  n++)
            if (fdpair[n] >= 0)
            {
                FD_SET(fdpair[n], &rfds);
                if (maxfd < fdpair[n])
                    maxfd = fdpair[n];
            }
        if (maxfd < 0) return 0;

        r = select(maxfd + 1, &rfds, NULL, NULL, NULL);
        if (r < 0)
        {
            perror("select()");
            return 3;
        }

        for (n = 0;  n < 2;  n++)
            if (fdpair[n] >= 0  &&  FD_ISSET(fdpair[n], &rfds))
            {
                r = read(fdpair[n], &buf, sizeof(buf));
                if (n == N_TTY  &&  r <= 0) return 0; // Nothing more to do if serial link is inoperational (r==0 means "USB-485 adapter plugged out", so we must release the /dev/ttyUSB* file for adapter to get the same /dev/ file upon re-plugging)
                if (r < 0)
                {
                    fdpair[n] = -1;
                }
                else
                    write(wrpair[1-n], &buf, r);
            }
    }

    return 0;
}
