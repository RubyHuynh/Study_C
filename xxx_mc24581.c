#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>
#include <limits.h>
#include <stdarg.h>
/*#define NDEBUG*/
#include <assert.h>
#include "/workspace/Study_C/xxx_generic_list.h"
#include "xxx_mc24581.h"

/* ------------------ */
config_t configuration = {false, false};
session_t* all_sessions[10] = {};
int nb_session = 0;
int nb_allocated = 0;
/* ------------------ */

static inline void err (const char* func, long line) {
    printf ("ERROR: %s %ld \n", func, line);
    exit (1);
}

#define READ_VARIADIC(last_arg) \
    int data1 = false; \
    void* data2 = NULL; \
    va_list args; \
    va_start (args, last_arg); \
    data1 = va_arg (args, int); \
    data2 = va_arg (args, void*); \
    va_end (args);\

#define READ_VARIADIC_VOID(last_arg) \
    void* data1 = NULL; \
    void* data2 = NULL; \
    va_list args; \
    va_start (args, last_arg); \
    data1 = va_arg (args, void*); \
    data2 = va_arg (args, void*); \
    va_end (args);\


void* my_alloc (size_t sz) {
    void* rs = calloc (1, sz);
    assert (rs);
    printf ("\t\t\talloc = %d %p\n", ++nb_allocated, rs);
    return rs;
}

void my_free (void* ptr) {
    free (ptr);
    printf ("\t\t\tfree, alloc = %d\n", --nb_allocated);
}

/* ===================================== */
char* dump_G_state (G_states state) {
    switch (state) {
    case G_START_STOP:
        return "G_START_STOP";
    case G_IDLE:
        return "G_IDLE";
    case G_TAKEN:
        return "G_TAKEN";
    case G_PENDING_REVOKE:
        return "G_PENDING_REVOKE";
    case G_RELEASING:
        return "G_RELEASING";
    case G_RESERVED:
        return "G_RESERVED";
    default:
        return "INVALID";
    }
}

char* dump_G_event (G_events event) {
    switch (event) {
    case G_EVT_DEFAULT:
        return "G_EVT_DEFAULT";
    case G_EVT_MC_IMPLICIT:
        return "G_EVT_MC_IMPLICIT";
    case G_EVT_MC_GRANTED:
        return "G_EVT_MC_GRANTED";
    case G_EVT_NEW_PARTICIPANT:
        return "G_EVT_NEW_PARTICIPANT";
    case G_EVT_NO_PARTICIPANT:
        return "G_EVT_NO_PARTICIPANT";
    case G_EVT_TIMER_X_EXPIRE:
        return "G_EVT_TIMER_X_EXPIRE";
    case G_EVT_TIMER_Y_EXPIRE:
        return "G_EVT_TIMER_Y_EXPIRE";
    case G_EVT_TM_RQ:
        return "G_EVT_TM_RQ";
    case G_EVT_TM_PRIORITY_RQ:
        return "G_EVT_TM_PRIORITY_RQ";
    case G_EVT_TM_NO_PRIORITY_RQ:
        return "G_EVT_TM_NO_PRIORITY_RQ";
    case G_EVT_TM_END_RQ:
        return "G_EVT_TM_END_RQ";
    case G_EVT_CLIENT_RELEASE:
        return "G_EVT_CLIENT_RELEASE";
    case G_EVT_RTP:
        return "G_EVT_RTP";
    default:
        return "INVALID";
    }
}

bool check_G_state (session_t* session, G_states state) {
    assert (session);

    return (session->general_machine.state & state) == state ? true : false;
}

bool search_callee_by_idx (const void* data, const void* idx) {
    if (data && idx) {
        participant_t* dt = (participant_t*) data;
        return (dt->idx == *(int*) idx) ? true : false;
    }
    return false;
}

void start_timer (int type) {
    printf("%s %d", __FUNCTION__, type);
    switch (type) {
    case 1:
    break;
    case 2:
    break;
    default:
    break;
    }
}

void stop_timer (int type) {
    printf("%s %d", __FUNCTION__, type);
    switch (type) {
    case 1:
    break;
    case 2:
    break;
    default:
    break;
    }
}

void expire_timer (int type) {
    session_t* session = NULL; /* to retrieve session from timer */
    printf("%s %d", __FUNCTION__, type);
    switch (type) {
    case 1:
    if (0) {

    }
    else {
        change_state (session, G_EVT_TIMER_X_EXPIRE); /*6.3.4.3.5*/
    }
    break;

    case 2:
    change_state (session, G_EVT_TIMER_Y_EXPIRE);
    break;

    default:
    break;
    }
}
/*---------------*/
void send_TM_idles (session_t* session) {
    assert (session);
    printf ("for each participants sending TM_IDLE --depending on basic & reception states \n");
}

void pop_TM_queue () {
    printf ("pop TM queue \n");
}

void push_TM_queue (session_t* session, tm_queue_t* entry) {
    node_t* node = NULL;

    assert (!session);

    node = my_alloc (sizeof (node_t));
    node->data = entry;
    append_node(&session->tm_queue, node);
}

#define FF printf ("%s %d\n", __FUNCTION__, __LINE__);

#define FAKE_BODY \
    { printf ("%s\n", __FUNCTION__); return NULL; } \

void* send_idle(void *data, ...) {
    session_t* session = (session_t*) data;

    assert (session);

    if (session->tm_queue) {
        pop_TM_queue ();
    }
    else {
        send_TM_idles (session);
        session->c2 = 1;
        session->cx = 0;
        start_timer(1);
        start_timer(2);
    }
    /* start timer T*/
    return NULL;
}

void* recv_TM_request (void* data, ...) {
    session_t* session = (session_t*) data;
    participant_t* party = NULL;

    assert(session);

    READ_VARIADIC_VOID(data)

    FF
    party = (participant_t*) data1;
    printf ("from %d\n", party->idx);

    if ((party = search_first_node_dynamic(session->participants, &party->idx, search_callee_by_idx))) {
        printf ("participant is found\n");
    }
    else {
        printf ("participant is not found, invalid, discard\n");
    }

    return NULL;
}

void* retry_idle (void *data, ...) FAKE_BODY
void* send_granted(void *data, ...) FAKE_BODY
void* send_revoke(void *data, ...) FAKE_BODY
void* do_nothing(void *data, ...) FAKE_BODY

void* send_TM_end_resp (void* data, ...) FAKE_BODY
void* send_TM_deny (void* data, ...) FAKE_BODY
void* send_TM_grant (void* data, ...) FAKE_BODY
void* send_reject (void* data, ...) FAKE_BODY

/*---------------*/
void* transit_state (void* data, ...) {
    session_t* session = (session_t*) data;

    assert (session);

    READ_VARIADIC(data)
    FF
    switch (session->general_machine.state) { /* must be data1, just tempo switch here */
    case G_IDLE:
        FF
        send_idle (session);
    break;

    case G_TAKEN:
        FF
        stop_timer (1);
        stop_timer (2);
        send_granted (NULL);
    break;

    default:
        FF
    break;
    }
    return NULL;
}

void manual_change_state (session_t* session, G_states next_state, G_events event) {
    assert (session);

    if (session->general_machine.state != next_state) {
        printf ("G_state changes from %s to %s\n", dump_G_state(session->general_machine.state), dump_G_state (next_state));
        session->general_machine.prev_state = session->general_machine.state;
        session->general_machine.state = next_state;
        session->general_machine.event = event;
    }
    else {
        printf ("G_state remains at %s\n", dump_G_state (next_state));
    }
}

void* change_state (void* sess, G_events event, ...) {
    session_t* session = (session_t*) sess;
    G_states next_state;

    assert (session);

    READ_VARIADIC(event)

    printf ("%s current_state=%s, event = %s, reject = %d\n", __FUNCTION__, dump_G_state(session->general_machine.state), dump_G_event(event), data1);
    if (event != G_EVT_INVALID ) {
        if (data1 == 1) {
            FF
            next_state = state_matrix[session->general_machine.state][event].reject_state;
            manual_change_state (session, next_state, event);
            if (state_matrix[session->general_machine.prev_state][event].reject_func)
                state_matrix[session->general_machine.prev_state][event].reject_func(session, data2);
            else
                printf ("empty reject action\n");
        }
        else {  /* default change state is this */
            FF
            next_state = state_matrix[session->general_machine.state][event].accept_state;
            manual_change_state (session, next_state, event);
            if (state_matrix[session->general_machine.prev_state][event].accept_func)
                state_matrix[session->general_machine.prev_state][event].accept_func(session, data2);
            else
                printf ("empty accept action\n");
        }
    }
    else {
        err(__FUNCTION__, __LINE__);
    }

    return NULL;
}

void* allocate_participant (int idx) {
    node_t* partie = my_alloc (sizeof (node_t));
    partie->data = my_alloc(sizeof (participant_t));
    ((participant_t*)partie->data)->idx = idx;
    printf ("new participant is allocated\n");
    return partie;
}

void* allocate_session (invite_t* invite) {
    session_t* session = (session_t*) my_alloc (sizeof (session_t));
    session->incoming_invite = invite;
    session->participants = allocate_participant (0);
    append_node(&session->participants, allocate_participant (1));
    append_node(&session->participants, allocate_participant (2));
    append_node(&session->participants, allocate_participant (3));
    printf ("new session=%d is allocated, participants=%d\n", nb_session, session->participants->sz);
    if (invite) invite->session_idx = nb_session;
    all_sessions [nb_session++] = session;
    return session;
}

void recv_invite (invite_t* invite) {
    session_t* session = NULL;
    int x;

    FF
    assert (invite);

    printf ("\n.session_idx = [0--%d]\n", nb_session);
    scanf("%d", &x);
    /* 1. to detect old session by key -- to convert to hash version (lib Avr or lib IPG?) */
    session = all_sessions [x];
    if (session) {
        printf ("invite on existing session %d", invite->session_idx);
        /* 3. implicit request */
        if (invite->is_implicit_trans) {
            if (session->participants->sz == 1 || 0)
                change_state (session, G_EVT_MC_IMPLICIT, true);
            else
                change_state (session, G_EVT_MC_IMPLICIT);
            return;
        }
    }
    else {
        if (invite->is_initial) {
            session = allocate_session (invite);
        }
        else {
            err (__FUNCTION__, __LINE__);
        }

        if (configuration.is_confirmed_indication) {
            printf ("confirmed is required\n");
            if (!invite->is_mc_granted) {
                session->general_machine.state = G_RESERVED;
                return; /* to wait for at least one 200 OK */
            }
        }
    }

    /*2. change state on event lvl_1 */
    if (invite->is_mc_granted) {
        FF
        change_state (session, G_EVT_MC_GRANTED);
    }
    else {
        if (configuration.is_granting_implicit_on_established) {
            FF
            participant_t caller;
            caller.idx = 0;
            change_state (session, G_EVT_MC_IMPLICIT, false, &caller);
        }
        else {
            FF
            change_state (session, G_EVT_MC_IMPLICIT, true);
        }
    }
}

void recv_200 (int session_idx, int callee_idx) {
    session_t* session = all_sessions[session_idx];
    participant_t* callee = NULL;

    assert (session);

    if (configuration.is_confirmed_indication) {
        if (check_G_state (session, G_RESERVED)) {
            manual_change_state (session, G_START_STOP, G_EVT_DEFAULT);
        }
    }
    /* create basic state, need check direction? */
    if ((callee = (participant_t*) search_first_node_dynamic (session->participants, &callee_idx, search_callee_by_idx))) {
        printf (" 200 OK on exisiting participant, basic = %p", callee->basic_machine);
        callee->ssrc = "some_ssrc";
        if (!callee->basic_machine)
            callee->basic_machine = my_alloc (sizeof (basic_state_t));
    }
    else {
        printf ("200 on no participant, invalid case, discard \n");
    }

    if (configuration.is_granting_implicit_on_established) {
        change_state (session, G_EVT_MC_IMPLICIT, false, callee);
    }

    return;
}
/*------------------*/

void eventFromSCU (void* m) {
    int m_type = * (int*)m;

    FF
    switch (m_type) {
    case 0:
    {
        invite_t *invite = my_alloc (sizeof (invite_t)); /* it must be something has key, cannot only SDP */
        invite->is_initial = 1;
        invite->is_originating = 1;
        invite->is_mc_granted = 0;
        invite->is_implicit_trans = 0;
        invite->session_idx = 0;
        recv_invite (invite);
    }
    break;

    case 1:
    {
        int x, y;
        printf ("\n.session_idx = \n");
        scanf ("%d", &x);
        printf ("\n.callee_idx = \n");
        scanf ("%d", &y);
        recv_200 (x, y);
    }
    break;

    case 2:
    {
        invite_t *invite = my_alloc (sizeof (invite_t)); /* it must be something has key, cannot only SDP */
        invite->is_initial = 1;
        invite->is_originating = 1;
        invite->is_mc_granted = 0;
        invite->is_implicit_trans = 1;
        invite->session_idx = 0;
        recv_invite (invite);
    }
    break;
    default:
    break;
    }
}

void eventRTCP (void* m) {
    int m_type = *(int*)m;
    FF
    switch (m_type) {
    case 0:
    {
        int x, y;
        session_t* session;
        participant_t party;
        printf ("\n.session_idx = \n");
        scanf("%d", &x);
        printf ("\n.callee_idx = \n");
        scanf("%d", &party.idx);

        session = all_sessions[x];
        assert (session);

        if (session->participants->sz == 1 || 0) /* or no any basic is allocated */
            change_state (session, G_EVT_TM_RQ, true, party);
        else
            change_state (session, G_EVT_TM_RQ);
    }
    break;

    default:
    break;
    }
}

int main () {
    int raw_evt = 0;
    int* iii = malloc(88);
    iii = malloc(88);
    do {
        printf ("\n\n\n.event = [0 (SCU), 1 (MDF), 2 (CONFIGURATION), 100 (EXIT)]\n");
        scanf("%d", &raw_evt);
        switch (raw_evt) {
        case 0:
            printf ("\n.event from SCU = [0 (INVITE), 1 (200 OK), 2 (IMPLICIT_INVITE)]\n");
            scanf("%d", &raw_evt);
            eventFromSCU(&raw_evt);
        break;

        case 1:
            printf ("\n.event RTCP = [0 (recv TM request)]\n");
            scanf("%d", &raw_evt);
            eventRTCP(&raw_evt);
        break;

        case 2:
            printf ("\n.Set is_confirmed_indication = [0, 1]\n");
            scanf("%d", &raw_evt);
            configuration.is_confirmed_indication = raw_evt;
            printf ("\n.Set is_granting_implicit_on_established = [0, 1]\n");
            scanf("%d", &raw_evt);
            configuration.is_granting_implicit_on_established = raw_evt;
        break;
        default:
        break;
        }
    }
    while (raw_evt != 100);

    /* thread for each task? bad? */
    /* sig_action? need? */
    /*while (1)
    {
        eventFromSCU (NULL);

        eventFromMDF (NULL);
    }*/
    return 0;
}
/*
gcc -g -fsanitize=address -fsanitize=undefined -fsanitize=leak xxx_mc24581.c xxx_generic_list.c xxx_generic_list.h
*/