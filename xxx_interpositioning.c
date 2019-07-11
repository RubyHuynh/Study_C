#include <stdio.h>
#include <stdlib.h>
//#include "replacement_new_del.hpp"

int total_mem = 0;
void* mymalloc(size_t s)
{
	total_mem++;
	return malloc(s);
}

struct tempClass {
	int* a;
	int b;
};

#define malloc(x) mymalloc(x)
int main() {
	int* z = (int*) malloc(19);
	int* t = (int*) malloc(19);
	printf("%p total=%d\n", &z, total_mem);
	return 0;
}

/*
   gitpod /workspace/Study_CPP $ ./a.out
   0x7ffe58aa46b8
   Your program contains memory leaks!
   Total bytes lost: 24
###########      START LIST OF LEAKS      ###########
main()
replacement_new_del.cpp:12  - 4 bytes lost.
replacement_new_del.cpp:13  - 16 bytes lost.
replacement_new_del.cpp:14  - 4 bytes lost.
###########       END LIST OF LEAKS       ###########

- Memory report done, press any key to exit. -

*/

/*
   cannot redefine malloc here, not effect -- because once called "new", it jumped to libstdc++
   libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f6e45cdd000)

*/
