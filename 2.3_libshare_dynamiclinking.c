#include <stdio.h>
#include <stdlib.h>

/* Using shared lib normally*/
#include "2.3_libshare.h"

int main() {
    setEnv("HAHA", "HOHO");
    return 0;
}


/*
int main() {


} */