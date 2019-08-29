#ifndef xxx_mc
#define xxx_mc
#include <pthread.h>
#include <stdbool.h>

typedef enum _call_type {
    group,
    emergency,
    imminent,
    priv,
    chat,
} call_type;

typedef enum _G_states {
    G_START_STOP,
    G_IDLE,
    G_TAKEN,
    G_PENDING_REVOKE,
    G_RELEASING,
    G_INVALID,
} G_states;

typedef enum _U_states {
    U_START_STOP,
    U_NOT_PERMITTED,
    U_PERMITTED,
    U_PENDING_REVOKE,
    U_RELEASING,
    U_INVALID,
} U_states;

typedef struct _general_reception_state_t {
    int haha;
} general_reception_state_t;

typedef struct _basic_reception_state_t {
    int hoho;
} basic_reception_state_t;

typedef struct _general_state_t {
    G_states state;
    general_reception_state_t* reception;
    void* (*on_callee_accept)(void* session, G_states next_state, U_states next_u_state); /* TODO: clean up */
} general_state_t;

typedef struct _basic_state_t {
    U_states state;
    basic_reception_state_t* reception;
} basic_state_t;

typedef struct _tm_queue_t {
    int from;
    struct _tm_queue_t* next;
} tm_queue_t;

typedef struct _participant_t {
    char* ssrc;
    basic_state_t* basic_machine;
    struct _participant_t* next;
} participant_t;

typedef struct _invite_t {
    bool is_initial;
    bool is_originating;
    bool is_mc_granted;
    bool is_implicit_trans;
} invite_t;

typedef struct _config_t {
    bool is_confirmed_indication;
    bool is_granting_implicit_on_established;
} config_t;

typedef struct _session_t {
    call_type type;
    int cx;
    int c2;
    int c4; /* grant counter */
    invite_t* incoming_invite;
    pthread_t timers[5];
    general_state_t general_machine;
    participant_t* participants[3];
    tm_queue_t* tm_queue;
} session_t;

#endif