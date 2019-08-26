#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t get_exec_path (char *buffer, size_t len) {
    size_t rs = 0;
    char *path_end;
    if ((readlink("/proc/self/exe", buffer, len)) > 0) {
        printf("dump %s\n\n\n", buffer);
        path_end = strrchr (buffer, '/');
        if (path_end) {
            ++path_end;
            *path_end ='\0';
            rs = (size_t) (path_end - buffer);
        }
        else {
            perror ("\tno any /\n");
        }
    }
    else {
        perror ("\tcannot readlink /\n");
    }
    return rs;
}
int main () {
    char path[4096];
    char path2[4];
    printf ("trim = %d\n", (int) get_exec_path (path, sizeof (path)));
    printf ("rs = %s\n", path);

    printf ("trim2 = %d\n", (int) get_exec_path (path2, sizeof (path2)));
    printf ("rs2 = %s\n", path2);
    return 0;
}
