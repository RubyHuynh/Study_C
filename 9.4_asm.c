#include <stdlib.h>
#include <stdio.h>

int main (int argc, char* argv[]) {
    long max = atoi (argv[1]);
    long number;
    unsigned position;
    volatile unsigned result;
    int i;

    for (number = 1; number <= max; ++number) {
        asm ("bsrl %1, %0"
        : "=r" (position) /* output in general register */
        : "r" (number) /* input in general register */
        /* clobbered register */  );
        result = number;
    }
/*
    for (number = 1; number <= max; ++number) {
        for (i = (number >> 0); i != 0; ++position )
            i >>= 1;
        result = number;
    }
*/
    return 0;
}

/*
gitpod /workspace/Study_C $ time ./a.out 2900000

real    0m0.004s
user    0m0.004s
sys     0m0.001s


loop:
gitpod /workspace/Study_C $ time ./a.out 2900000

real    0m0.028s
user    0m0.027s
sys     0m0.001s


 */