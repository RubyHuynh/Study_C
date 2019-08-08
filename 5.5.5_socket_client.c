#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <string.h>

int main (int args, char *const argv[]) {
    int fd;
    struct sockaddr_un name;
    const char* const n = argv[1];
    fd = socket (PF_LOCAL, SOCK_STREAM, 0);
    name.sun_family = AF_LOCAL;
    strcpy (name.sun_path, n);

    connect (fd, (struct sockaddr*) &name, SUN_LEN (&name));
    {
        int len = strlen (argv[2]) + 1;
        printf("client %d %s", len, argv[1]);
        write (fd, &len, sizeof (len));
        write (fd, argv[1], len);
    }
    close (fd);
    return 0;
}