#ifndef xxx_mc
#define xxx_mc
#include <pthread.h>
#include <stdbool.h>
#include "xxx_generic_list.h"

typedef enum _call_type {
    group,
    emergency,
    imminent,
    priv,
    chat,
} call_type;

#define MAX_STATE 10
#define MAX_EVENT 20

typedef enum _U_states {
    U_START_STOP,
    U_NOT_PERMITTED,
    U_PERMITTED,
    U_PENDING_REVOKE,
    U_RELEASING,
    U_INVALID,
} U_states;

typedef enum _G_states {
    G_START_STOP,
    G_IDLE,
    G_TAKEN,
    G_PENDING_REVOKE,
    G_RELEASING,
    G_RESERVED,
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

/* define actions to a new files, and include them here in file.h */
void* send_idle(void *data, ...);
void* retry_idle (void *data, ...);
void* send_granted(void *data, ...);
void* send_revoke(void *data, ...);
void* do_nothing(void *data, ...);
void* recv_TM_request (void* data, ...);
void* send_TM_end_resp (void* data, ...);
void* send_TM_deny (void* data, ...);
void* send_TM_grant (void* data, ...);
void* transit_state (void* data, ...);
void* send_reject (void* data, ...);

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


typedef struct _general_reception_state_t {
    int haha;
} general_reception_state_t;

typedef struct _basic_reception_state_t {
    int hoho;
} basic_reception_state_t;

typedef struct _general_state_t {
    G_states state;
    G_states prev_state;
    G_events event;
    general_reception_state_t* reception;
    /* Just for fun! */
    void* (*on_callee_accept)(void* session, G_states next_state, U_states next_u_state);
} general_state_t;


typedef struct _basic_state_t {
    U_states state;
    basic_reception_state_t* reception;
} basic_state_t;

typedef struct _tm_queue_t {
    int from_party;
    void* data;
} tm_queue_t;

typedef struct _participant_t {
    char* ssrc;
    int idx;
    int priority;
    basic_state_t* basic_machine;
    int sdp;
    int mdf; /* a.Son */
} participant_t;

typedef struct _invite_t {
    bool is_initial;
    bool is_originating;
    bool is_mc_granted;
    bool is_implicit_trans;
    int session_idx;
} invite_t;

typedef struct _config_t {
    bool is_confirmed_indication;
    bool is_granting_implicit_on_established;
} config_t;

typedef struct _session_t {
    call_type type;
    int cx; /* nb of recv TM request */
    int c2; /* timer sent transmit idle counter */
    int c4; /* timer sent grant counter */
    invite_t* incoming_invite;
    pthread_t timers[5];
    general_state_t general_machine;
    node_t* participants;
    node_t* tm_queue;
} session_t;


void* change_state (void* session, G_events event, ...);
#endif