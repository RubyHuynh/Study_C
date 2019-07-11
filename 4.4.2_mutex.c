#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <errno.h>
#include <string.h>

double _shared_var = 0;

/*
pthread_mutex_t mutex;
pthread_mutex_init (&mutex, NULL);
*/
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
/* { { 0, 0, 0, 0, 0, __PTHREAD_SPINS, { 0, 0 } } } -- ease not safe! */
void* thread_func() {
    int ret = 0;
    if ((ret = pthread_mutex_lock(&mutex)) == 0) {
        /*if ((ret = pthread_mutex_lock(&mutex)) == 0) {*/
        if (1) {
            printf("errno=%d", errno);
            printf("\t begin thread=%d _shared_var=%.1lf\n", (int) pthread_self(), _shared_var);
            _shared_var += (int) pthread_self();
            printf("\t\t end thread=%d _shared_var=%.1lf\n", (int) pthread_self(), _shared_var);
            pthread_mutex_unlock(&mutex);
            /*
             errno cannot lock twice thread=-757467392 errno=0(Success) ret=35(Resource deadlock avoided)
            */
        }
        else {
            printf("\t errno cannot lock twice thread=%d errno=%d(%s) ret=%d(%s)\n", (int) pthread_self(), errno, strerror(errno), ret, strerror(ret));
            pthread_mutex_unlock(&mutex);
        }
    }
    else {
        printf("\t errno cannot lock thread=%d\n", (int) pthread_self());
    }
   return NULL;
}

int main() {
    int i = 0;
    /*4.4.3 set to the third kind for safe */
    pthread_t thread_list[5];
    pthread_mutexattr_t mutex_attr;
    pthread_mutexattr_settype(&mutex_attr, PTHREAD_MUTEX_ERRORCHECK_NP);
    pthread_mutex_init(&mutex, &mutex_attr);
    pthread_mutexattr_destroy(&mutex_attr);
    printf("BEGIN main thread=%d _shared_var=%.1lf\n", (int) pthread_self(), _shared_var);
    while (i++ < 5) {
        pthread_create(&thread_list[i-1], NULL, &thread_func, NULL);
    }
    i = 0;
    while (i++ < 5) {
        pthread_join(thread_list[i-1], NULL);
    }
    printf("END main thread=%d _shared_var=%.1lf\n", (int) pthread_self(), _shared_var);
    return 0;
}