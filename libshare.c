#include <stdio.h>
#include <stdlib.h>

int setEnv(const char *key, const char *val) {
    printf ("I'm called from shared library %s\n", __FUNCTION__);
    setenv(key, val, 1);
    return 111;
}

int intEnv(const char *key, const char *val) {
    return 0;
}

/*
***build libtemo.so
gcc -c -fPIC libshare.c
gcc -share -o libtemo.so libshare.o

***build a.out
gcc libshare_dynamiclinking.c -L. -ltemo
ldd a.out
        linux-vdso.so.1 (0x00007ffff1ff6000)
        libtemo.so => not found
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f26e5da5000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f26e5fa0000)

**running a.out
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./
ldd a.out
        linux-vdso.so.1 (0x00007ffc9cbde000)
        libtemo.so (0x00007f95ac8c7000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f95ac6d3000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f95ac8d3000)


***OR
compile a.out with:
    gcc libshare_dynamiclinking.c -L. -ltemo -Wl,-rpath,./
so the system will search rpath when running, no need to set LD_LIBRARY_PATH
 */