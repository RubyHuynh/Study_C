#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

int shared_var = 0;
__thread int not_shared_var = 0;

void* thread_func(void* args) {
    int __oldstate;
    pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &__oldstate);
    not_shared_var = getpid() + (int) pthread_self();
    shared_var++;
    printf("\tthread %d %d\n", (int) pthread_self(), not_shared_var);
    pthread_setcancelstate(__oldstate, NULL);
    return NULL;
}

int main() {
    int i = 0;
    pthread_attr_t att;
    pthread_t t;

    pthread_attr_init(&att);
    pthread_attr_setdetachstate(&att, PTHREAD_CREATE_DETACHED);
    while(i++ < 5) {
        pthread_create(&t, &att, &thread_func, &i);
    }
    sleep(5);
    pthread_attr_destroy(&att);
    printf("shared_var=%d not_shared_var=%d\n\n", shared_var, not_shared_var);
    return 0;
}
/*
gitpod /workspace/Study_C $ gcc threads.c -lpthread
gitpod /workspace/Study_C $ ./a.out
        thread 881014528 881019156
        thread 889407232 889411860
        thread 864229120 864233748
        thread 872621824 872626452
        thread 855836416 855841044
shared_var=5 not_shared_var=0
*/
