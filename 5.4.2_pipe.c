#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void reader (FILE* stream) {
    char buff[1024];
    while (!feof (stream) && !ferror (stream)
        && fgets (buff, sizeof(buff), stream)!= NULL) {
            fputs (buff, stdout);
        }
}

void writer (const char* mess, int count, FILE *stream) {
    for ( ; count > 0; count--) {
        fprintf (stream, "%s-%d\n", mess, count);
        fflush (stream);
        sleep (1);
    }
}

int main () {
    int fds[2];
    pid_t pid;

    pipe (fds); /* 0 is read, 1 is write */
    if((pid = fork ()) == (pid_t)0) {
        FILE* stream;
        close (fds[1]);
        stream = fdopen (fds[0], "r");
        reader (stream);
        close (fds[0]);
    }
    else {
        FILE* stream;
        close (fds[0]);
        stream = fdopen (fds[1], "w");
        writer ("hello from parent", 5, stream);
        close (fds[1]);
    }

    return 0;
}
