#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <string.h>

int server (int client_socket) {
    while (1) {
        int len;
        char *text;

        if (read(client_socket, &len, sizeof (len) == 0)) {
            return 0;
        }
        printf ("strlen=%d", len);
        text = (char*) malloc(len);
        read (client_socket, text, len);
        printf ("\t%s\n", text);
        fflush(stdout);
        free (text);

        if (!strcmp(text, "quit")) return 1;
    }
}

int main (int argc, char* const argv[]) {
    int socket_fd;
    const char* const n = argv[1];
    struct sockaddr_un name;
    int client;
    printf ("1");
    socket_fd = socket (PF_LOCAL, SOCK_STREAM, 0);
    name.sun_family = AF_LOCAL;
    strcpy (name.sun_path, n);
    printf ("1");
    bind (socket_fd, (struct sockaddr*)&name, SUN_LEN (&name));
    printf ("1");
    listen (socket_fd, 5);
    printf ("1");
    do {
        struct sockaddr_un client_name;
        socklen_t client_name_len;
        int client_fd;

        client_fd = accept (socket_fd, (struct sockaddr*) &client_name, &client_name_len);
        client = server (client_fd);
        close (client_fd);
    }
    while (!client);

    close (socket_fd);
    unlink ("/tmp/socket1");
    return 0;
}

