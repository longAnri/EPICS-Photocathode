#ifdef __linux__

// Check copied from https://github.com/npat-efault/picocom/blob/master/termios2.c
#include <linux/version.h>
#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,0)
  #warning "Linux kernel is too old for termios2"
#else

#include <stdio.h>
#include <strings.h>
#include <sys/ioctl.h>
#include <asm/termbits.h>

#include "set_tty_speed_via_termios2.h"


int set_tty_speed_via_termios2(int fd, unsigned int cflag, int speed)
{
  struct termios2  t2;
  int              r;

    bzero(&t2, sizeof(t2));
    t2.c_cflag     = (cflag &~ (CBAUD | CBAUDEX)) | BOTHER;
    t2.c_iflag     = IGNPAR;
    t2.c_oflag     = 0;
    t2.c_lflag     = 0;
    t2.c_cc[VTIME] = 0;
    t2.c_cc[VMIN]  = 1;
    t2.c_ispeed    = speed;
    t2.c_ospeed    = speed;

    r = ioctl(fd, TCSETS2, &t2);
#ifdef DEBUG_TERMIOS2 // Use "-DDEBUG_TERMIOS2" switch in compiler commandline
    {
      struct termios2  t2_rb;

        ioctl(fd, TCGETS2, &t2_rb);
        fprintf(stderr, "i=%d o=%d\n", t2_rb.c_ispeed, t2_rb.c_ospeed);
    }
#endif
    return r;
}

#endif /* LINUX_VERSION_CODE */

#endif /* __linux__ */
