#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <fcntl.h>



int random_number (int min, int max) {
    static int dev_rd_fd = -1;
    char* next_rd_byte;
    int byte_to_read;
    unsigned random_val;

    assert (min < max);
    if (dev_rd_fd == -1) {
        dev_rd_fd = open ("/dev/random", O_RDONLY);
        assert (dev_rd_fd != -1);
    }
    next_rd_byte = (char*) &random_val;
    byte_to_read = sizeof (random_val);
    do {
        int byte_read;
        byte_read = read (dev_rd_fd, next_rd_byte, byte_to_read);
        byte_to_read -= byte_read;
        next_rd_byte += byte_read;
    }
    while (byte_to_read > 0); /* to read up to 4 bytes */

    return min + (random_val % (max - min +1));
}

int main () {
    int a = rand() % 8; /* 0 to 8, pseudorandom - reproducible numbers*/
    int b = rand() % 8;

    printf("a=%d, b=%d\n", a, b);
    printf("dev_rd=%d\n", random_number(0,8));
    return 0;
}

/*
gitpod /workspace/Study_C $ ./a.out
a=7, b=6
dev_rd=8
gitpod /workspace/Study_C $ ./a.out
a=7, b=6
dev_rd=2
*/