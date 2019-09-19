#include <stdlib.h>
#include <stdio.h>

#define MAX_STATE 10
#define MAX_EVENT 20

typedef enum _G_states {
    G_START_STOP,
    G_IDLE,
    G_TAKEN,
    G_PENDING_REVOKE,
    G_RELEASING,
    G_INVALID,
} G_states;

typedef enum _G_event {
    G_EVT_DEFAULT,
    G_EVT_MC_IMPLICIT,
    G_EVT_MC_GRANTED,
    G_EVT_NEW_PARTICIPANT,
    G_EVT_NO_PARTICIPANT,
    G_EVT_TIMER_X_EXPIRE,
    G_EVT_TIMER_Y_EXPIRE,
    G_EVT_TM_RQ,
    G_EVT_TM_PRIORITY_RQ,
    G_EVT_TM_NO_PRIORITY_RQ,
    G_EVT_TM_END_RQ,
    G_EVT_CLIENT_RELEASE,
    G_EVT_RTP,
    G_EVT_INVALID
} G_events;

typedef struct _sm_t {
    G_states accept_state;
    void* (*accept_func)(void*, ...);
    G_states reject_state;
    void* (*reject_func)(void*, ...);
} sm_t;

#define FAKE_BODY \
    { printf ("%s\n", __FUNCTION__); return NULL; } \
/* define actions to a new files, and include them here in file.h */
void* send_idle(void *data, ...) FAKE_BODY
void* retry_idle (void *data, ...) FAKE_BODY
void* send_granted(void *data, ...) FAKE_BODY
void* send_revoke(void *data, ...) FAKE_BODY
void* do_nothing(void *data, ...) FAKE_BODY
void* recv_TM_request (void* data, ...) FAKE_BODY
void* send_TM_end_resp (void* data, ...) FAKE_BODY
void* send_TM_deny (void* data, ...) FAKE_BODY
void* send_TM_grant (void* data, ...) FAKE_BODY
void* transit_state (void* data, ...) FAKE_BODY
void* send_reject (void* data, ...) FAKE_BODY

const sm_t state_matrix[MAX_STATE][MAX_EVENT] = {
    [G_START_STOP] ={[G_EVT_DEFAULT] = {G_START_STOP, do_nothing},
                     [G_EVT_MC_IMPLICIT] = {G_IDLE, recv_TM_request, G_IDLE, transit_state},
                     [G_EVT_MC_GRANTED] = {G_TAKEN, transit_state}},

    [G_IDLE] = {[G_EVT_DEFAULT] = {G_IDLE, transit_state},
                [G_EVT_TM_RQ] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                [G_EVT_TIMER_X_EXPIRE] = {G_IDLE, transit_state, G_RELEASING, transit_state},
                [G_EVT_TIMER_Y_EXPIRE] = {G_IDLE, transit_state},
                [G_EVT_MC_IMPLICIT] = {G_TAKEN, transit_state, G_IDLE, send_reject}},

    [G_TAKEN] = {[G_EVT_DEFAULT] = {G_TAKEN, transit_state},
                 [G_EVT_RTP] = {G_TAKEN, do_nothing},
                 [G_EVT_MC_IMPLICIT] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                 [G_EVT_TM_END_RQ] = {G_TAKEN, transit_state, G_PENDING_REVOKE, transit_state},
                 [G_EVT_TM_NO_PRIORITY_RQ] = {G_TAKEN, transit_state, G_TAKEN, send_TM_deny},
                 [G_EVT_TM_PRIORITY_RQ] = {G_TAKEN, transit_state, G_PENDING_REVOKE, transit_state},
                 [G_EVT_TM_RQ] = {G_TAKEN, send_TM_grant},
                 [G_EVT_TIMER_X_EXPIRE] = {G_TAKEN, transit_state, G_TAKEN, do_nothing},
                 [G_EVT_CLIENT_RELEASE] = {G_TAKEN, do_nothing, G_IDLE, transit_state}},

    [G_PENDING_REVOKE] = {[G_EVT_DEFAULT] = {G_PENDING_REVOKE, transit_state},
                          [G_EVT_RTP] = {G_PENDING_REVOKE, do_nothing},
                          [G_EVT_TM_END_RQ] = {G_TAKEN, transit_state, G_IDLE, transit_state},
                          [G_EVT_CLIENT_RELEASE] = {G_RELEASING, transit_state}},

     [G_RELEASING] = {[G_EVT_DEFAULT] = {G_START_STOP, transit_state}}
};

int main () {

    state_matrix[G_START_STOP][G_EVT_MC_GRANTED].accept_func(NULL);

    return 0;
}