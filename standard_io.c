#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int i = 0;
    while (i++ < 100) {
        printf("%d", i); // data will be buffered and sent to console when it is full
        fflush(stdout); // fflush to force sending out the date
        fprintf(stderr, "%d", i); // or by the other way, stderr does not wait
        sleep(1);
    }
    return 0;
}

/*
% program 2>&1 | filter  --> pipe

The 2>&1  syntax  indicates  that  file  descriptor  2  (stderr)
should  be  merged  into  file  descriptor  1  (stdout).
Note that 2>&1 must follow a file redirection (the first example) but must precede a pipe redirection (the second example).
 */