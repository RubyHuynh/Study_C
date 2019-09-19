#include <stdio.h>
#include <stdlib.h>

int main ()
{
    size_t sz = 32;
    char* str = malloc( sz);
    size_t rs;

    rs = getline(&str, &sz, stdin);
    printf ("val = %s (%lu)\n", str, rs);
    free (str);
    /*
    char username[32];
    gets (username);
    */

    return 0;
}