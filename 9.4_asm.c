#include <stdio.h>
#include <stdlib.h>

int main (int argc, char* argv[])
{
  int max = atoi (argv[1]);
  int number;
  unsigned position;
  volatile unsigned result;

  /* Repeat the operation for a large number of values.  */
  for (number = 1; number <= max; ++number) {
    /* Compute the position of the most significant set bit using the
       bsrl assembly instruction.  */
    asm ("bsr %1, %0" : "=r" (position) : "r" (number));
    result = position;
  }

  return 0;
}

/*
gitpod /workspace/Study_C $ time ./a.out 2900000

real    0m0.004s
user    0m0.004s
sys     0m0.001s

.L3:
	movl	-12(%rbp), %eax
#APP
# 15 "9.4_asm.c" 1
	bsr %eax, %eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)
	addl	$1, -12(%rbp)
.L2:


------------
loop version:
    for (number = 1; number <= max; ++number) {
        for (i = (number >> 0); i != 0; ++position )
            i >>= 1;
        result = number;
    }


gitpod /workspace/Study_C $ time ./a.out 2900000

real    0m0.028s
user    0m0.027s
sys     0m0.001s


 */