#include<stdio.h>
#include <sys/types.h>
#include<unistd.h>
#include <signal.h>
#include <string.h>

sig_atomic_t _count = 0;

void handler(int sign_number) {
    ++_count;
    /* shouldn't perform i/o in this state */
}

int main() {
    struct sigaction sa;
    printf("start here, val=%d\n", _count);
    memset(&sa, 0, sizeof(sa));
    sa.sa_handler = &handler;
    sigaction(SIGTERM, &sa, NULL);
    sigaction(SIGKILL, &sa, NULL);
    sigaction(SIGINT, &sa, NULL);
    sleep(100);
    printf("still here, val=%d\n", _count);
    sleep(100);
    printf("still here, val=%d\n", _count);
    return 0;
}