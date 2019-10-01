#ifndef xxx_mc
#define xxx_mc
#include <stdbool.h>
#include <arpa/inet.h>
#include "xxx_generic_list.h"



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
    int status;
    void *engine;
    void *side1_data;
    void *side2_data;
} mdf_session_t;

typedef struct {
    sock_addr_t src_addr; /* caller_addr or mdf_addr */
    sock_addr_t dst_addr; /* mdf_addr or participant_addr */
    media_codec_t chosen_codec; /* to be calculated by tcf */
    mdf_session_t *mdf_session[8]; /* to be updated by mdf, allocate mdf_session[idx] */
} media_info_t;

void* create_mdf_res (int idx, media_info_t **caller, media_info_t **callee);
void* update_mdf_res (int idx, media_info_t **caller, media_info_t **callee);
void* start_mdf_res (mdf_session_t **mdf_session);
void* stop_mdf_res (mdf_session_t **mdf_session, bool is_release);
/*-------------------------------------------------------------------------------------------------*/

#define MAX_MCV_G_STATE 5
#define MAX_MCV_U_STATE 7
#define MAX_MCV_EVENT 20
#define MAX_MCV_CX 3
#define MIN_MCV_CX 0


/*typedef enum _call_type {
    group,
    emergency,
    imminent,
    priv,
    chat,
} call_type;
*/
typedef enum {
    PRE_ARRANGED,
    BROADCAST,
    CHAT,
} Call_types;

typedef enum {
    U_START_STOP,
    U_PERMITTED,
    U_PENDING_REVOKE,
    U_NOT_PERMITTED_IDLE,
    U_NOT_PERMITTED_TAKEN,
    U_NOT_PERMITTED_BUT_MEDIA,
    U_RELEASING,
    U_INVALID,
} U_states;

typedef enum {
    G_START_STOP,
    G_IDLE,
    G_TAKEN,
    G_PENDING_REVOKE,
    G_RELEASING,
    G_RESERVED,
    G_INVALID,
} G_states;

typedef enum {
    EVT_DEFAULT,
    EVT_MC_IMPLICIT,
    EVT_MC_GRANTED,
    EVT_NEW_PARTICIPANT,
    EVT_NO_PARTICIPANT,
    EVT_TIMER_X_EXPIRE,
    EVT_TIMER_Y_EXPIRE,
    EVT_TM_RQ,
    EVT_TM_PRIORITY_RQ,
    EVT_TM_NO_PRIORITY_RQ,
    EVT_TM_END_RQ,
    EVT_CLIENT_DISCONNECTED,
    EVT_CLIENT_RELEASE_1,
    EVT_CLIENT_RELEASE_2,
    EVT_RTP,
    EVT_INVALID
} MCV_events;

typedef enum {
    GENERAL_TRANSMISSION,
    BASIC_TRANSMISSION,
    GENERAL_RECEPTION,
    BASIC_RECEPTION,
} SM_types;

typedef struct {
    int accept_state;
    void* (*accept_func)(void*, ...);
    int reject_state;
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

sm_t state_matrix[MAX_MCV_G_STATE][MAX_MCV_EVENT] = {
    [G_START_STOP] ={[EVT_DEFAULT] = {G_START_STOP, do_nothing},
                     [EVT_MC_IMPLICIT] = {G_IDLE, recv_TM_request, G_IDLE, transit_state},
                     [EVT_MC_GRANTED] = {G_TAKEN, transit_state}},

    [G_IDLE] = {[EVT_DEFAULT] = {G_IDLE, transit_state},
                [EVT_TM_RQ] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                [EVT_TIMER_X_EXPIRE] = {G_IDLE, transit_state, G_RELEASING, transit_state},
                [EVT_TIMER_Y_EXPIRE] = {G_IDLE, transit_state},
                [EVT_MC_IMPLICIT] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                [EVT_CLIENT_RELEASE_1] = {G_RELEASING, transit_state}},

    [G_TAKEN] = {[EVT_DEFAULT] = {G_TAKEN, transit_state},
                 [EVT_RTP] = {G_TAKEN, forward_rtp},
                 [EVT_MC_IMPLICIT] = {G_TAKEN, transit_state, G_IDLE, send_reject},
                 [EVT_TM_END_RQ] = {G_TAKEN, after_end_resp, G_IDLE, transit_state},
                 [EVT_TM_RQ] = {G_TAKEN, transit_state, G_TAKEN, send_TM_deny},
                 [EVT_TM_PRIORITY_RQ] = {G_TAKEN, transit_state, G_PENDING_REVOKE, transit_state},
                 [EVT_TIMER_X_EXPIRE] = {G_TAKEN, transit_state, G_TAKEN, do_nothing},
                 [EVT_CLIENT_DISCONNECTED] = {G_TAKEN, transit_state, G_IDLE, transit_state},
                 [EVT_CLIENT_RELEASE_1] = {G_RELEASING, transit_state}},

    [G_PENDING_REVOKE] = {[EVT_DEFAULT] = {G_PENDING_REVOKE, transit_state},
                          [EVT_RTP] = {G_PENDING_REVOKE, forward_rtp},
                          [EVT_TM_END_RQ] = {G_TAKEN, clean_up_queue, G_IDLE, transit_state},
                          [EVT_CLIENT_RELEASE_1] = {G_RELEASING, transit_state}},

     [G_RELEASING] = {[EVT_CLIENT_RELEASE_2] = {G_START_STOP, transit_state}}
};

sm_t basic_state_matrix[MAX_MCV_U_STATE][MAX_MCV_EVENT] = {
    [U_START_STOP] ={[EVT_DEFAULT] = {U_START_STOP, do_nothing},
                     [EVT_MC_IMPLICIT] = {U_PERMITTED, transit_state}},

    [U_PERMITTED] = {[EVT_DEFAULT] = {U_PERMITTED, transit_state}},

    [U_PENDING_REVOKE] = {[EVT_DEFAULT] = {U_PENDING_REVOKE, transit_state}},

    [U_NOT_PERMITTED_IDLE] = {[EVT_DEFAULT] = {U_NOT_PERMITTED_IDLE, transit_state}},

    [U_NOT_PERMITTED_TAKEN] = {[EVT_DEFAULT] = {U_NOT_PERMITTED_TAKEN, transit_state}},

    [U_NOT_PERMITTED_BUT_MEDIA] = {[EVT_DEFAULT] = {U_NOT_PERMITTED_BUT_MEDIA, transit_state}},

    [U_RELEASING] = {[EVT_DEFAULT] = {U_RELEASING, transit_state}}
};
sm_t reception_state_matrix[MAX_MCV_U_STATE][MAX_MCV_EVENT] = {};
sm_t basic_reception_state_matrix[MAX_MCV_U_STATE][MAX_MCV_EVENT] = {};

typedef struct {
    SM_types type;
    int state;
    int prev_state;
    MCV_events event;
    /* Just for fun! */
    void* (*on_callee_accept)(void* session, G_states next_state, U_states next_u_state);
} mcv_state_t;

typedef struct {
    int from_party;
    void *data;
} tm_queue_t;


/* header for session & state transitions */
typedef struct {
    int idx;
    int priority;
    int mdf_id;
    bool is_recv_only; /* <on-network-recvonly> entry */
    char* ssrc;
    media_info_t *media;
    mcv_state_t *basic_machine;
    mcv_state_t *reception_machine;
} participant_t;

typedef struct {
    bool is_initial;
    bool is_originating;
    bool is_mc_granted;
    bool is_mc_queueing;
    bool is_mc_implicit_rq;
    int session_idx;
    Call_types type;
} invite_t;

typedef struct {
    bool is_confirmed_indication;
    bool is_granting_implicit_on_established;
} config_t;

typedef struct {
    int idx;
    int cx; /* nb of recv TM request */
    int c2; /* timer sent transmit idle counter */
    int c4; /* timer sent grant counter */

    Call_types type;
    invite_t* incoming_invite;
    pthread_t timers[5];
    node_t *participants;
    node_t *tm_queue;
    mcv_state_t general_machine;
    mcv_state_t *reception_machine;
} session_t;

void* change_state (SM_types sm_type, session_t* session, MCV_events event, ...);
#endif