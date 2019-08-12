#include <netinet/in.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <net/if.h>
#include <arpa/inet.h>

/* https://unix.superglobalmegacorp.com/Net2/newsrc/sys/ioctl.h.html */
int main () {
    int fd;
    struct ifconf conf;
    char data[4096];

    if ((fd = socket (AF_INET, SOCK_DGRAM, 0)) >= 0) {
        conf.ifc_len = sizeof (data);
        conf.ifc_buf = (caddr_t) data;
        if ((ioctl (fd, SIOCGIFCONF, &conf)) >= 0) {
            int i =0;
            struct ifreq *ifr;
            char addr_buf[1024];

            ifr = (struct ifreq*) data;
            while ((char*)ifr < data + conf.ifc_len) {
                switch (ifr->ifr_addr.sa_family) {
                    case AF_INET:
                        i++;
                        printf ("%d.%s :%s\n", i, ifr->ifr_name,
                         inet_ntop (ifr->ifr_addr.sa_family,
                             &(((struct sockaddr_in*)&ifr->ifr_addr)->sin_addr),
                             addr_buf, sizeof (addr_buf)));
                    break;

                    default:
                    break;
                }
                ifr = (struct ifreq*)((char*)ifr + sizeof (*ifr));
            }
            close(fd);
        }
        else {
            perror("error exec ioctl\n");
        }
    }
    else {
        perror("error opening socket\n");
    }
    return 0;
}

/*
gitpod /workspace/Study_C $ gcc -g 6.7_ioctl.c
gitpod /workspace/Study_C $ ./a.out
1.lo :127.0.0.1
2.eth0 :10.0.2.236
*/