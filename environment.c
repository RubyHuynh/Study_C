#include<stdio.h>
#include<stdlib.h> /* this lib */

/* GNU ENVIRON variable */
extern char** environ;
const char* new_key = "TEMO";

int main() {
    char** var = environ;

    for(; *var!=NULL; var++)
        printf("%s\n", *var);
    setenv(new_key, "Jeudi 20/06/2019 13:18", 1);
    printf("\n==========playing\n%s\n",getenv(new_key));
    return 7; /* $? to see this :D */
}