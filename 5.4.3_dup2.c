#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main () {
    int fds[2];
    pid_t pid;

    pipe(fds);
    if ((pid = fork ()) == (pid_t)0) {
        close (fds[1]);
        dup2 (fds[0], STDIN_FILENO);
        execlp("sort", "sort", (char *)0);
    }
    else { /* miss this lbrk for else, vraivment, those were the days.. T_T */
        FILE* stream;
        close (fds[0]);
        stream = fdopen (fds[1], "w");
        fprintf (stream, "those were\n");
        fprintf (stream, "the happy\n");
        fprintf (stream, "moments\n");
        fprintf (stream, "I'd ever got\n");
        fprintf (stream, "Il y a tranquillement aujourd'hui...\n");
        fflush (stream);
        close (fds[1]);
        waitpid (pid, NULL, 0);
    }
    return 0;
}