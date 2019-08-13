#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>

void read_proc_info (pid_t pid, char* info) {
    int fd;
    char fn[1024];

    sprintf (fn, "/proc/%d/%s", (int) pid, info);
    printf ("getting %s...\n", fn);
    if ((fd = open (fn, O_RDONLY))!= -1) {
        char data[4096];
        char *tmp = NULL;
        int len = read (fd, data, sizeof (data));

        close(fd);
        data[len] = '\0';
        tmp = data;
        /* NUL */
        while (tmp < data + len) {
            printf ("\t%s\n", tmp);
            tmp += strlen (tmp) + 1;
        }
    }
    else {
        perror ("error open()");
    }
}

int main (int args, char* argv[]) {
    switch (args % 3) {
        case 0:
        break;

        case 1:
            printf ("===========argv[1] is a pid\n");
            system ("ls -p /proc/ | grep [0-9]/");
            exit (0);
        break;

        case 2:
            printf ("===========argv[2] as below:\n");
            system ("ls -p /proc/1/ | grep -v /");
            exit (0);
        break;
    }

    pid_t pid = (pid_t) atoi (argv[1]);
    read_proc_info (pid, argv[2]);
    return 0;
}


/*
gitpod /workspace/Study_C $ ./a.out 1 cmdline
getting /proc/1/cmdline...
        /bin/bash
        /var/gitpod/start.sh
        d/start.sh

gitpod /workspace/Study_C $ ./a.out 1 smaps
getting /proc/1/smaps...
        55ee74c1d000-55ee74c49000 r--p 00000000 08:01 2848903                    /bin/bash
Size:                176 kB
KernelPageSize:        4 kB
MMUPageSize:           4 kB
Rss:                 176 kB
Pss:                   7 kB
Shared_Clean:        176 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:         0 kB
Referenced:          176 kB
Anonymous:             0 kB
LazyFree:              0 kB
AnonHugePages:         0 kB
...
 */