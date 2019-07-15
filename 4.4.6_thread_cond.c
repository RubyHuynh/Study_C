
// C program to implement cond(), signal()
// and wait() functions
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

pthread_cond_t cond1 = PTHREAD_COND_INITIALIZER;
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
int done = 1;

void* foo()
{
    while (1) {
        printf("beginning thread %d\n", (int)pthread_self());

        pthread_mutex_lock(&lock);
        if (done == 1) {
            printf("Waiting on condition variable cond1\n");
            /* cond_wait put the thread to sleep, awake it by signal/broadcast */
            pthread_cond_wait(&cond1, &lock);
        }
        else {
            printf("Signaling condition variable cond1\n");
            pthread_mutex_unlock(&lock);
            return NULL;
        }
        // release lock
        pthread_mutex_unlock(&lock);

        printf("Returning thread %d\n", (int)pthread_self());
    }
    return NULL;
}

// Driver code
int main()
{
    int i = 0 ;
    pthread_t tid[6];

    while (i++ < 5) {
        pthread_create(&tid[i], NULL, foo, NULL);
    }

    sleep(1);
    printf("set by main thread /n");
    done = 2;

    /* pthread_cond_signal(&cond1); */
    pthread_cond_broadcast(&cond1);

    i = 0;
    while (i++ < 5) {
        pthread_join(tid[i], NULL);
    }

    return 0;
}


/*
itpod /workspace/Study_C $ ./a.out
beginning thread -1776613632
Waiting on condition variable cond1
beginning thread -1793399040
Waiting on condition variable cond1
beginning thread -1785006336
beginning thread -1936009472
beginning thread -1801791744
Waiting on condition variable cond1
Waiting on condition variable cond1
Waiting on condition variable cond1
set by main thread /nReturning thread -1776613632
Returning thread -1793399040
Returning thread -1801791744
beginning thread -1801791744
Signaling condition variable cond1
beginning thread -1793399040
Returning thread -1936009472
Returning thread -1785006336
Signaling condition variable cond1
beginning thread -1785006336
beginning thread -1776613632
beginning thread -1936009472
Signaling condition variable cond1
Signaling condition variable cond1
Signaling condition variable cond
 */