#include"Common.h"
#include"Set.h"

#ifndef OBJECT_H
#define OBJECT_H
struct Object {
	unsigned int	id;
	char*		str;
	unsigned int 	count;
	struct Set*	in;
};
#endif

int differ (const void * a, const void * b);
