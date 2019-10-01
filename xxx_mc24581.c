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
session_t *all_sessions[10] = {};
int nb_session = 0;
int nb_allocated = 0;
/* ------------------ */

static inline void err (const char* func, long line) {
    printf ("ERROR: %s %ld \n", func, line);
    exit (1);
}

#define FF printf ("%s %d\n", __FUNCTION__, __LINE__);

#define FAKE_BODY \
    { printf ("%s\n", __FUNCTION__); return NULL; } \

#define READ_VARIADIC(last_arg) \
    int data1 = false; \
    void *data2 = NULL; \
    va_list args; \
    va_start (args, last_arg); \
    data1 = va_arg (args, int); \
    data2 = va_arg (args, void*); \
    va_end (args);\

#define READ_VARIADIC_VOID(last_arg) \
    void *data1 = NULL; \
    void *data2 = NULL; \
    va_list args; \
    va_start (args, last_arg); \
    data1 = va_arg (args, void*); \
    data2 = va_arg (args, void*); \
    va_end (args);\


void* my_alloc (size_t sz) {
    void *rs = calloc (1, sz);
    assert (rs);
    printf ("\t\t\talloc = %d %p (sz=%d)\n", ++nb_allocated, rs, (int) sz);
    return rs;
}

void my_free (void* ptr) {
    free (ptr);
    printf ("\t\t\tfree, alloc = %d\n", --nb_allocated);
}

/* ===================================== */
static char* dump_G_state (G_states state) {
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

static char* dump_G_event (MCV_events event) {
    switch (event) {
    case EVT_DEFAULT:
        return "EVT_DEFAULT";
    case EVT_MC_IMPLICIT:
        return "EVT_MC_IMPLICIT";
    case EVT_MC_GRANTED:
        return "EVT_MC_GRANTED";
    case EVT_NEW_PARTICIPANT:
        return "EVT_NEW_PARTICIPANT";
    case EVT_NO_PARTICIPANT:
        return "EVT_NO_PARTICIPANT";
    case EVT_TIMER_X_EXPIRE:
        return "EVT_TIMER_X_EXPIRE";
    case EVT_TIMER_Y_EXPIRE:
        return "EVT_TIMER_Y_EXPIRE";
    case EVT_TM_RQ:
        return "EVT_TM_RQ";
    case EVT_TM_PRIORITY_RQ:
        return "EVT_TM_PRIORITY_RQ";
    case EVT_TM_NO_PRIORITY_RQ:
        return "EVT_TM_NO_PRIORITY_RQ";
    case EVT_TM_END_RQ:
        return "EVT_TM_END_RQ";
    case EVT_CLIENT_RELEASE_1:
        return "EVT_CLIENT_RELEASE_1";
    case EVT_CLIENT_RELEASE_2:
        return "EVT_CLIENT_RELEASE_2";
    case EVT_RTP:
        return "EVT_RTP";
    default:
        return "INVALID";
    }
}

bool check_G_state (session_t *session, G_states state) {
    assert (session);

    return (session->general_machine.state & state) == state ? true : false;
}

bool search_callee_by_idx (const void *data, const void* idx) {
    if (data && idx) {
        participant_t* dt = (participant_t*) data;
        printf ("---idx=%d recv=%d\n", dt->idx, dt->is_recv_only);
        return (dt->idx == *(int*) idx) ? true : false;
    }
    return false;
}

void start_timer (int type) {
    printf ("%s %d\n", __FUNCTION__, type);
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
    printf ("%s %d\n", __FUNCTION__, type);
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
    session_t *session = NULL; /* to retrieve session from timer */
    printf ("%s %d\n", __FUNCTION__, type);
    switch (type) {
    case 1:
        if (0) {

        }
        else {
            change_state (GENERAL_TRANSMISSION, session, EVT_TIMER_X_EXPIRE); /*6.3.4.3.5*/
        }
        break;

    case 2:
        change_state (GENERAL_TRANSMISSION, session, EVT_TIMER_Y_EXPIRE);
        break;

        default:
        break;
    }
}

/*---------------*/
void push_TM_queue (session_t *session, tm_queue_t* entry) {
    node_t *node = NULL;

    assert (!session);
    FF
    node = my_alloc (sizeof (node_t));
    node->data = entry;
    append_node (&session->tm_queue, node);
}

void pop_TM_queue () {
    printf ("pop TM queue \n");
}

void send_TM_idle (session_t *session) {
    assert (session);
    printf ("for each participants sending TM_IDLE --depending on basic & reception states \n");
}

void* send_TM_grant (void *dt, ...) {
    session_t *session = (session_t*) dt;
    assert (session);
    printf ("send TM_GRANT to granted participant \n");
    return NULL;
}

void* send_TM_media_notify (void *dt, ...) {
    session_t *session = (session_t*) dt;
    assert (session);
    printf ("send Media Transmission notify to the reception control \n");
    return NULL;
}

void* send_TM_queue_position (void *dt, ...) {
    session_t *session = (session_t*) dt;
    assert (session);
    printf ("send Queue Position Info \n");
    return NULL;
}

void* send_TM_revoke (void *dt, ...) {
    session_t *session = (session_t*) dt;
    assert (session);
    printf ("send TM Revoke to unlucky one \n");
    return NULL;
}

void* send_TM_end_resp (void *dt, ...) {
    session_t *session = (session_t*) dt;
    assert (session);
    printf ("send TM_END Response \n");
    return NULL;
}

void* recv_TM_request (void *data, ...) {
    session_t *session = (session_t*) data;
    participant_t *party = NULL;

    assert(session);

    READ_VARIADIC_VOID(data)

    FF
    printf ("from %d\n", ((participant_t*) data1)->idx);

    if ((party = (participant_t*)search_first_node_dynamic(session->participants, &((participant_t*) data1)->idx, search_callee_by_idx))) {
        printf ("participant is found, idx=%d, is_recv_only=%d\n", party->idx, party->is_recv_only);
    }
    else {
        printf ("participant is not found, invalid, discard\n");
    }

    if (session->participants->sz == 1 || 0 ) { /* or no any basic is allocated */
        /* 6.3.4.3.3 idle->idle (reject) */
        change_state (GENERAL_TRANSMISSION, session, EVT_TM_RQ, REJECT_EVT, party);
    }
    else {
        assert (session->incoming_invite);
        if (session->cx == MAX_MCV_CX) {
            if (0) { /* priority in TM request */
                change_state (GENERAL_TRANSMISSION, session, EVT_TM_PRIORITY_RQ, REJECT_EVT, party);
            }
            else {
                if (session ->incoming_invite->is_mc_queueing) {
                    tm_queue_t *entry = (tm_queue_t*) my_alloc (sizeof (tm_queue_t));
                    entry->data = data1; /* to be the TM message */
                    push_TM_queue (session, entry);
                }
                else {
                    /* 6.3.4.4.7A taken->taken (deny) */
                    change_state (GENERAL_TRANSMISSION, session, EVT_TM_RQ, REJECT_EVT, party);
                }
            }
        }
        else {
            FF
            if (party->is_recv_only) {
                 /* 6.3.4.3.3 idle->idle (reject)
                    6.3.4.4.7A taken->taken (deny)
                 */
                change_state (GENERAL_TRANSMISSION, session, EVT_TM_RQ, REJECT_EVT, party);
            }
            else {
                /* 6.3.4.3.3 idle->taken (grant)
                   6.3.4.4.7A taken->taken (grant)
                   6.3.4.4.8 taken->taken (grant)
                 */
                change_state (GENERAL_TRANSMISSION, session, EVT_TM_RQ, ACCEPT_EVT, party);
            }
        }
    }

    return NULL;
}


void* mdf_to_do_sth (void *dt, ...) {
    session_t *session = (session_t*) dt;
    assert (session);
    printf ("instruct MDF to do something (start forwarding RTP, stop forwarding, ..). WAIT for result? \n");
    return NULL;
}

void* send_idle(void *data, ...) {
    session_t *session = (session_t*) data;

    assert (session);

    if (session->tm_queue) {
        pop_TM_queue ();
    }
    else {
        send_TM_idle (session);
        session->c2 = 1;
        session->cx = 0;
        start_timer(1);
        start_timer(2);
    }
    return NULL;
}

void* send_grant(void *data, ...) {
    session_t *session = (session_t*) data;
    assert (session);
    if (1) stop_timer (1);
    if (2) stop_timer (2);
    if (session->cx < MAX_MCV_CX) ++session->cx;
    start_timer(4);
    send_TM_grant (session);
    send_TM_media_notify (session);
    session->reception_machine = my_alloc (sizeof (mcv_state_t));
    return NULL;
}

void* send_revoke(void *data, ...) {
    session_t *session = (session_t*) data;
    assert (session);
    if (4) stop_timer (4);
    send_TM_revoke (session);
    send_TM_queue_position(session);
    return NULL;
}

void* forward_rtp (void *data, ...){
    session_t *session = (session_t*) data;
    assert (session);
    if (4) stop_timer (4);
    mdf_to_do_sth (session);
    return NULL;
}

void* after_end_resp (void *data, ...){
    session_t *session = (session_t*) data;
    assert (session);
    if (4) stop_timer (4);
    return NULL;
}

void* clean_up_queue (void *data, ...){
    session_t *session = (session_t*) data;
    assert (session);
    printf ("cleanup queue position 6.3.4.5.4\n");
    return NULL;
}

void* retry_idle (void *data, ...) FAKE_BODY
void* do_nothing(void *data, ...) FAKE_BODY
void* send_TM_deny (void *data, ...) FAKE_BODY
void* send_reject (void *data, ...) FAKE_BODY

/*---------------*/
void* transit_state (void *data, ...) {
    session_t *session = (session_t*) data;

    assert (session);

    READ_VARIADIC(data)
    FF
    switch (session->general_machine.state) {
    case G_IDLE:
        FF
        send_idle (session);
    break;

    case G_TAKEN:
        FF
        send_grant (session);
    break;

    case G_PENDING_REVOKE:
        FF
        send_revoke (session);
    break;

    default:
        FF
    break;
    }
    return NULL;
}

void set_next_state (mcv_state_t *session_sm, G_states next_state, MCV_events event) {
    assert (session_sm);

    session_sm->prev_state = session_sm->state;
    if (session_sm->state != next_state) {
        printf ("G_state changes from %s to %s, prev_state %s\n", dump_G_state (session_sm->state), dump_G_state (next_state), dump_G_state (session_sm->prev_state));
        session_sm->state = next_state;
        session_sm->event = event;
    }
    else {
        printf ("G_state remains at %s, prev_state %s \n", dump_G_state (next_state), dump_G_state (session_sm->prev_state));
    }
}

void get_state_action (sm_t (*matrix)[MAX_MCV_EVENT], mcv_state_t *session_sm, MCV_events event, bool is_evt_reject, session_t *session, void *data2) {
    int next_state;

    if (is_evt_reject == 1) {
        FF
        next_state = matrix[session_sm->state][event].reject_state;
        set_next_state (session_sm, next_state, event);
        if (matrix[session_sm->prev_state][event].reject_func)
            matrix[session_sm->prev_state][event].reject_func (session, data2);
        else
            printf ("empty reject action\n");
    }
    else {  /* default change state is this */
        FF
        next_state = matrix[session_sm->state][event].accept_state;
        set_next_state (session_sm, next_state, event);
        if (matrix[session_sm->prev_state][event].accept_func)
            matrix[session_sm->prev_state][event].accept_func (session, data2);
        else
            printf ("empty accept action\n");
    }
}

void* change_state (SM_types sm_type, session_t* session, MCV_events event, ...) {
    int next_state;

    assert (session);

    READ_VARIADIC(event)

    printf ("%s current_state=%s, event = %s, reject = %d\n", __FUNCTION__, dump_G_state(session->general_machine.state), dump_G_event(event), data1);
    switch (sm_type) {
        case GENERAL_TRANSMISSION:
            get_state_action(state_matrix, &session->general_machine, event, data1, session, data2);
        case BASIC_TRANSMISSION:
            get_state_action(basic_state_matrix, ((participant_t*)(session->participants->data))->basic_machine, event, data1, session, data2);
            break;
        case GENERAL_RECEPTION:
            get_state_action(reception_state_matrix, session->reception_machine, event, data1, session, data2);
            break;
        case BASIC_RECEPTION:
            get_state_action(basic_reception_state_matrix, ((participant_t*)(session->participants->data))->reception_machine, event, data1, session, data2);
            break;
    }
    return NULL;
}

void* allocate_participant (int idx, bool is_recv_only) {
    node_t *partie = my_alloc (sizeof (node_t));
    partie->data = my_alloc (sizeof (participant_t));
    ((participant_t*)partie->data)->idx = idx;
    ((participant_t*)partie->data)->is_recv_only = is_recv_only;
    printf ("new participant is allocated\n");
    return partie;
}

void* allocate_session (invite_t* invite) {
    session_t *session = (session_t*) my_alloc (sizeof (session_t));
    session->incoming_invite = invite;
    session->participants = allocate_participant (0, false);
    append_node (&session->participants, allocate_participant (1, false));
    append_node (&session->participants, allocate_participant (2, false));
    append_node (&session->participants, allocate_participant (3, true));
    printf ("new session=%d is allocated, participants=%d\n", nb_session, session->participants->sz);
    session->idx = nb_session;
    if (invite) invite->session_idx = nb_session;
    all_sessions [nb_session++] = session;
    return session;
}

void recv_invite (invite_t* invite) {
    session_t *session = NULL;
    int x;

    FF
    assert (invite);

    printf ("\n.session_idx = [0--%d]\n", nb_session);
    scanf ("%d", &x);
    /* 1. to detect old session by key -- to convert to hash version (lib Avr or lib IPG?) */
    session = all_sessions [x];
    if (session) {
        printf ("invite on existing session %d", invite->session_idx);
        /* 3. implicit request */
        if (invite->is_mc_implicit_rq) {
            participant_t *party;
            int x;
            printf ("from client?\n");
            scanf ("%d", &x);

            if (session->participants->sz == 1 || 0)
                change_state (GENERAL_TRANSMISSION, session, EVT_MC_IMPLICIT, REJECT_EVT);
            else
                change_state (GENERAL_TRANSMISSION, session, EVT_MC_IMPLICIT, session->participants->data);
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
        change_state (GENERAL_TRANSMISSION, session, EVT_MC_GRANTED);
    }
    else {
        if (configuration.is_granting_implicit_on_established) {
            /*participant_t caller;
            caller.idx = 0;
            change_state (GENERAL_TRANSMISSION, session, EVT_MC_IMPLICIT, ACCEPT_EVT, &caller);*/
            FF
        }
        else {
            FF
            change_state (GENERAL_TRANSMISSION, session, EVT_MC_IMPLICIT, REJECT_EVT);
        }
    }
}

void recv_200 (int session_idx, int callee_idx) {
    session_t *session = all_sessions[session_idx];
    participant_t *callee = NULL;

    assert (session);

    if (configuration.is_confirmed_indication) {
        if (check_G_state (session, G_RESERVED)) {
            set_next_state (&session->general_machine, G_START_STOP, EVT_DEFAULT);
        }
    }
    /* create basic state, need check direction? */
    if ((callee = (participant_t*) search_first_node_dynamic (session->participants, &callee_idx, search_callee_by_idx))) {
        printf (" 200 OK on exisiting participant, basic = %p", callee->basic_machine);
        callee->ssrc = "some_ssrc";
        if (!callee->basic_machine) {
            callee->basic_machine = my_alloc (sizeof (mcv_state_t));
            if (session->incoming_invite->is_mc_implicit_rq) {
                change_state (GENERAL_TRANSMISSION, session, EVT_MC_IMPLICIT, ACCEPT_EVT, callee);
            }
        }
    }
    else {
        printf ("200 on no participant, invalid case, discard \n");
    }

    if (configuration.is_granting_implicit_on_established) {
        change_state (GENERAL_TRANSMISSION, session, EVT_MC_IMPLICIT, ACCEPT_EVT, callee);
    }

    return;
}

/*------------------*/
void eventFromSCU (void *m) {
    int m_type = *(int*)m;

    FF
    switch (m_type) {
    case 0:
    {
        invite_t *invite = my_alloc (sizeof (invite_t)); /* it must be something has key, cannot only SDP */
        invite->is_initial = 1;
        invite->is_originating = 1;
        invite->is_mc_granted = 0;
        invite->is_mc_implicit_rq = 0;
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
        invite->is_mc_implicit_rq = 1;
        invite->session_idx = 0;
        recv_invite (invite);
    }
    break;
    case 3:
    {
        int x, y;
        session_t *session;
        printf ("\n.session_idx = \n");
        scanf ("%d", &x);

        assert (session);
        session = all_sessions[x];
        change_state (GENERAL_TRANSMISSION, session, EVT_CLIENT_RELEASE_1);
    }
    break;
    case 4:
    {
        int x, y;
        session_t *session;
        printf ("\n.session_idx = \n");
        scanf ("%d", &x);

        assert (session);
        session = all_sessions[x];
        change_state (GENERAL_TRANSMISSION, session, EVT_CLIENT_RELEASE_2);
    }
    break;
    default:
    break;
    }
}

void eventMDF (void* m) {
    int m_type = *(int*)m;
    FF
    switch (m_type) {
    case 0:
    {
        int x, y;
        session_t *session;
        participant_t party;
        printf ("\n.session_idx = \n");
        scanf ("%d", &x);
        printf ("\n.RTP from callee_idx = \n");
        scanf ("%d", &party.idx);

        session = all_sessions[x];
        assert (session);

        if (session->cx == 0) /* temo */
            printf ("invalid RTP? -- case never happen");
        else
            change_state (GENERAL_TRANSMISSION, session, EVT_RTP);
    }
    break;
    default:
    break;
    }
}

void eventRTCP (void* m) {
    int m_type = *(int*) m;
    int x, y;
    session_t *session;
    participant_t party;

    FF
    printf ("\n.session_idx = \n");
    scanf ("%d", &x);
    printf ("\n.callee_idx = \n");
    scanf ("%d", &party.idx);

    session = all_sessions[x];
    assert (session);
    switch (m_type) {
    case 0:
    {
        recv_TM_request (session, &party); /* data to be the TM message */
    }
    break;
    case 1:
    {
        --session->cx;
        send_TM_end_resp (session);
        mdf_to_do_sth (session);
        if (session->cx <= MIN_MCV_CX)
            change_state (GENERAL_TRANSMISSION, session, EVT_TM_END_RQ, REJECT_EVT, party);
        else
            change_state (GENERAL_TRANSMISSION, session, EVT_TM_END_RQ);
    }
    break;

    default:
    break;
    }
}

int main () {
    int raw_evt = 0;
    do {
        printf ("\n\n\n.event = [0 (SCU), 1 (RTCP), 2 (CONFIGURATION), 3 (MDF), 100 (EXIT)]\n");
        scanf ("%d", &raw_evt);
        switch (raw_evt) {
        case 0:
            printf ("\n.event from SCU = [0 (INVITE), 1 (200 OK), 2 (IMPLICIT_INVITE), 3 (BYE), 4 (BYE_200 OK)]\n");
            scanf ("%d", &raw_evt);
            eventFromSCU (&raw_evt);
        break;

        case 1:
            printf ("\n.event RTCP = [0 (recv TM request), 1 (recv TM End request)]\n");
            scanf ("%d", &raw_evt);
            eventRTCP (&raw_evt);
        break;

        case 2:
            printf ("\n.Set is_confirmed_indication = [0, 1]\n");
            scanf ("%d", &raw_evt);
            configuration.is_confirmed_indication = raw_evt;
            printf ("\n.Set is_granting_implicit_on_established = [0, 1]\n");
            scanf ("%d", &raw_evt);
            configuration.is_granting_implicit_on_established = raw_evt;
        break;

        case 3:
            printf ("\n.event from MDF = [0 (RTP)]\n");
            scanf ("%d", &raw_evt);
            eventMDF (&raw_evt);
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
gcc -g -fsanitize=address -fsanitize=undefined xxx_mc24581.c xxx_generic_list.c xxx_generic_list.h
*/