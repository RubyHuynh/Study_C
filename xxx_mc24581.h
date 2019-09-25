#ifndef xxx_mc
#define xxx_mc
#include <stdbool.h>
#include <arpa/inet.h>
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
#define MAX_MC_CX 3
#define MIN_MC_CX 0

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
    G_EVT_CLIENT_DISCONNECTED,
    G_EVT_CLIENT_RELEASE_1,
    G_EVT_CLIENT_RELEASE_2,
    G_EVT_RTP,
    G_EVT_INVALID
} G_events;

typedef struct {
    G_states accept_state;
    void* (*accept_func)(void*, ...);
    G_states reject_state;
    void* (*reject_func)(void*, ...);
} sm_t;

#define REJECT_EVT true
#define ACCEPT_EVT false

/* to define actions to a new files, and include them here in file.h */
void* do_nothing(void *data, ...);
void* recv_TM_request (void *data, ...);
void* after_end_resp (void *data, ...);
void* clean_up_queue (void *data, ...);
void* send_TM_deny (void *data, ...);
void* transit_state (void *data, ...);
void* send_reject (void *data, ...);
void* forward_rtp (void *data, ...);

const sm_t state_matrix[MAX_STATE][MAX_EVENT] = {
    [G_START_STOP] ={[G_EVT_DEFAULT] = {G_START_STOP, do_nothing},
                     [G_EVT_MC_IMPLICIT] = {G_IDLE, recv_TM_request, G_IDLE, transit_state},
                     [G_EVT_MC_GRANTED] = {G_TAKEN, transit_state}},

    [G_IDLE] = {[G_EVT_DEFAULT] = {G_IDLE, transit_state},
                [G_EVT_TM_RQ] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                [G_EVT_TIMER_X_EXPIRE] = {G_IDLE, transit_state, G_RELEASING, transit_state},
                [G_EVT_TIMER_Y_EXPIRE] = {G_IDLE, transit_state},
                [G_EVT_MC_IMPLICIT] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                [G_EVT_CLIENT_RELEASE_1] = {G_RELEASING, transit_state}},

    [G_TAKEN] = {[G_EVT_DEFAULT] = {G_TAKEN, transit_state},
                 [G_EVT_RTP] = {G_TAKEN, forward_rtp},
                 [G_EVT_MC_IMPLICIT] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                 [G_EVT_TM_END_RQ] = {G_TAKEN, after_end_resp, G_IDLE, transit_state},
                 [G_EVT_TM_RQ] = {G_TAKEN, transit_state, G_TAKEN, send_TM_deny},
                 [G_EVT_TM_PRIORITY_RQ] = {G_TAKEN, transit_state, G_PENDING_REVOKE, transit_state},
                 [G_EVT_TIMER_X_EXPIRE] = {G_TAKEN, transit_state, G_TAKEN, do_nothing},
                 [G_EVT_CLIENT_DISCONNECTED] = {G_TAKEN, transit_state, G_IDLE, transit_state},
                 [G_EVT_CLIENT_RELEASE_1] = {G_RELEASING, transit_state}},

    [G_PENDING_REVOKE] = {[G_EVT_DEFAULT] = {G_PENDING_REVOKE, transit_state},
                          [G_EVT_RTP] = {G_PENDING_REVOKE, forward_rtp},
                          [G_EVT_TM_END_RQ] = {G_TAKEN, clean_up_queue, G_IDLE, transit_state},
                          [G_EVT_CLIENT_RELEASE_1] = {G_RELEASING, transit_state}},

     [G_RELEASING] = {[G_EVT_CLIENT_RELEASE_2] = {G_START_STOP, transit_state}}
};

typedef struct {
    int haha;
} general_reception_state_t;

typedef struct {
    int hoho;
} basic_reception_state_t;

typedef struct {
    G_states state;
    G_states prev_state;
    G_events event;
    /* Just for fun! */
    void* (*on_callee_accept)(void* session, G_states next_state, U_states next_u_state);
} general_state_t;


typedef struct {
    U_states state;
} basic_state_t;

typedef struct {
    int from_party;
    void *data;
} tm_queue_t;

/* header for media, to separate ---------------------------------------------------------------------*/
typedef unsigned char   u8;
typedef unsigned short  u16;

typedef union {
    struct sockaddr_in sin;    /* sin.sin_addr.s_addr, sin.sin_port */
    struct sockaddr_in6 sin6;  /* sin6.sin6_addr, sin6.sin6_port */
    char host[16]; /* need, no? */
} sock_type_t;

typedef struct {
    u8 family;
    sock_type_t addr;
} sock_addr_t;

typedef struct {
    u8 codec;
    u8 format;
    u8 ptime;
    u8 ptype;
    char *params;
} media_codec_t;

typedef struct {
    sock_addr_t src_addr; /* caller_addr or mdf_addr */
    sock_addr_t dst_addr; /* mdf_addr or participant_addr */
    media_codec_t chosen_codec; /* to be calculated by tcf */
    /* struct tc_sess *sess */ /* or an int? */
} media_info_t;

/*  tcf will scan callee list & call this func, mdf to <update caller->dst_addr & callee->src_addr>.
    Note:
    -- as SCU will only send one 200 OK INVITE to the caller --> mdf to use the same caller->dst_addr in all pipelines?
 */
void* create_mdf_resource (int session_idx, media_info_t **caller, media_info_t **callee);
void* start_mdf_resource (int session_idx, int resource_idx);
/*void* start_mdf_resource (struct tc_sess *sess);*/          /* or this directly ? */
/*-------------------------------------------------------------------------------------------------*/

/* header for session & state transitions */
typedef struct {
    int idx;
    int priority;
    int mdf_id;
    bool is_recv_only; /* <on-network-recvonly> entry */
    char* ssrc;
    media_info_t media;
    basic_state_t *basic_machine;
    basic_reception_state_t *reception_machine;
} participant_t;

typedef struct {
    bool is_initial;
    bool is_originating;
    bool is_mc_granted;
    bool is_mc_queueing;
    bool is_mc_implicit_rq;
    int session_idx;
} invite_t;

typedef struct {
    bool is_confirmed_indication;
    bool is_granting_implicit_on_established;
} config_t;

typedef struct {
    call_type type;
    int idx;
    int cx; /* nb of recv TM request */
    int c2; /* timer sent transmit idle counter */
    int c4; /* timer sent grant counter */
    invite_t* incoming_invite;
    pthread_t timers[5];
    general_state_t general_machine;
    general_reception_state_t *reception_machine;
    node_t *participants;
    node_t *tm_queue;
} session_t;


void *change_state (void* session, G_events event, ...);
#endif