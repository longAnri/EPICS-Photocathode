#define _GNU_SOURCE
#include <sys/ioctl.h>
#include <asm/termbits.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY);
    struct termios2 tio;

    ioctl(fd, TCGETS2, &tio);

    tio.c_cflag &= ~CBAUD;
    tio.c_cflag |= BOTHER;
    tio.c_ispeed = 28800;
    tio.c_ospeed = 28800;

    ioctl(fd, TCSETS2, &tio);
    close(fd);
    return 0;
}

