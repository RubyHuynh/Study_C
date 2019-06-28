#include <stdio.h>
#include <stdlib.h>

/* Using shared lib normally*/
#include "libshare.h"

int main() {
    setEnv("HAHA", "HOHO");
    return 0;
}


/*
int main() {


} */