#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>
#include "xxx_mc24581.h"

/* ------------------ */
config_t configuration = {false, false};
session_t* all_sessions[10] = {};
int nb_session = 0;
int nb_allocated = 0;
/* ------------------ */
void* change_state (void* session, G_states next_state, U_states next_u_state);

static inline void err () {
    printf ("%s error \n", __FUNCTION__);
    exit (1);
}

void* my_alloc (size_t sz) {
    void* rs = malloc (sz);
    if (!rs) err ();
    memset(rs, 0, sz);
    printf ("\t\t\talloc = %d\n", nb_allocated++);
    return rs;
}

void my_free (void* ptr) {
    free (ptr);
    printf ("\t\t\tfree, alloc = %d\n", --nb_allocated);
}

void fwd_rtp () {
    printf ("Forward RTP to reception/client\n");
}

void stop_fwd_rtp () {
    printf ("Stop forward RTP to reception/client\n");
}

/*----------------begin TM */
void send_TM_reject (session_t* session, int participant_idx, int reject_cause) {
    printf ("send TM Reject to: %d with cause: %d \n", participant_idx, reject_cause);
}

void recv_TM_request (session_t* session, int participant_idx, char* ssrc) {
    printf ("recv TM request from %d \n", participant_idx);
    if (session && session->participants[participant_idx]) {
        if (1) {
            if (session->participants[participant_idx]->ssrc)
                free (session->participants[participant_idx]->ssrc);
            printf ("saving participant SSRC %s\n", ssrc);
            session->participants[participant_idx]->ssrc = strdup (ssrc);
            change_state (session, G_TAKEN, U_INVALID);
        }
        else {
            send_TM_reject (session, participant_idx, 3);
        }
    }
}

void recv_TM_end_request (session_t* session, int from) {
    printf ("recv TM End request \n");
    --session->cx;
    stop_fwd_rtp ();
    printf ("Cancel T4\n");
    pthread_cancel (session->timers[4]);
    if (session->cx == 0)
        change_state (session, G_IDLE, U_INVALID);
}

void send_TM_idle () {
    printf ("send TM Idle \n");
}

void send_TM_grant () {
    printf ("send TM Granted \n");
}

void send_TM_media_notify () {
    printf ("send Media transmission Notification to RECEPTION!!! \n");
}

void* handle_T1 (void* sess) {
    session_t* session = (session_t*) sess;
    printf ("\t\t\t\tStart T1: Inactivity \n");
    sleep (30);
    printf ("\t\t\t\tExpire T1: Inactivity, restarting \n");
    handle_T1 (session);
    return NULL;
}

void* handle_T2 (void* sess) {
    session_t* session = (session_t*) sess;
    printf ("\t\t\t\tStart T2: Transmit Idle \n");
    sleep(5);
    if (session->c2++ < 10) {
        printf ("\t\t\t\tExpire T2: Transmit Idle, restarting \n");
        send_TM_idle();
        handle_T2 (session);
    }
    return NULL;
}

void* handle_T4 (void* sess) {
    session_t* session = (session_t*) sess;
    printf ("\t\t\t\tStart T4: Transmit Granted \n");
    sleep(10);
    if (session->c4++ < 10) {
        printf ("\t\t\t\tExpire T4: Transmit Granted, restarting \n");
        send_TM_grant();
        handle_T4 (session);
    }
    return NULL;
}


void pop_TM_queue () {
    printf ("pop TM queue \n");
}

void push_TM_queue (session_t* session, int from) {
    int i = 0;
    tm_queue_t *next = session->tm_queue;
    tm_queue_t *prev = NULL;
    tm_queue_t *new = NULL;

    printf ("push TM queue \n");
    while (next) {
        prev = next;
        next = next->next;
    }

    new = (tm_queue_t*)my_alloc (sizeof (tm_queue_t));
    if (prev) {
        prev->next = new;
    }
    else {
        session->tm_queue = new;
    }
}
/*----------------end TM */

/*----------------begin SIP */
void recv_invite (invite_t* invite) {
    if (!invite) err ();

    if (invite->is_originating) {
        printf ("originating call, MCVideoServer to initialise calls to invited participants.. \n");
        if (configuration.is_confirmed_indication) {

        }
        else {
            session_t* session = NULL;
            if ((session = (session_t*) my_alloc (sizeof (session_t))) != NULL) {
                session->incoming_invite = invite;
                session->participants[0] = my_alloc (sizeof (participant_t)); /* caller */
                session->participants[1] = my_alloc (sizeof (participant_t)); /* callee 1 */
                session->participants[2] = my_alloc (sizeof (participant_t)); /* callee 2 */
                session->general_machine.on_callee_accept = &change_state;
                printf ("session=%d is allocated\n", nb_session);
                all_sessions [nb_session++] = session;
            }
            else err();
        }
    }
    else {
        printf ("... \n");
    }
    return;
}

void recv_200 (int session_idx, int callee_idx) {
    session_t* session = NULL;
    if (!(session = all_sessions[session_idx])) err();

    if (session->incoming_invite->is_originating) {
        printf ("200 on originating, to generate basic state machine \n");
        participant_t* callee = session->participants[callee_idx];
        session->cx++;

        if (!callee->basic_machine)
            callee->basic_machine = my_alloc (sizeof (basic_state_t));

        session->general_machine.on_callee_accept ((session_t*)session, G_IDLE, 0);
    }
    else {
        printf ("...\n");
    }
    return;
}

void recv_rtp (session_t* session, int from) {
    switch (session->general_machine.state) {
        case G_TAKEN:
            printf ("Cancel T4\n");
            pthread_cancel (session->timers[4]);
        break;

        default:
        break;
    }
}

/*----------------end SIP */

char* dump_state (G_states state, U_states u_state) {
    if (state != G_INVALID) {
        switch (state) {
            case G_START_STOP:
                return "G_START_STOP";
            break;
            case G_IDLE:
                return "G_IDLE";
            break;
            case G_TAKEN:
                return "G_TAKEN";
            break;
            case G_PENDING_REVOKE:
                return "G_PENDING_REVOKE";
            break;
            case G_RELEASING:
                return "G_RELEASING";
            break;
            default:
            break;
        }
    }
    else {

    }
    return "aaa";
}

void* change_state (void* sess, G_states next_state, U_states next_u_state) {
    session_t* session = (session_t*) sess;
    if (next_state != G_INVALID) {
       switch (next_state) {
            case G_IDLE:
                if (session->incoming_invite->is_mc_granted) {
                    return change_state (session, G_TAKEN, U_INVALID);
                }
                else {
                    if (configuration.is_granting_implicit_on_established) {
                        recv_TM_request (session, 0, "implicit_ssrc_where");
                    }
                    else {
                        if (session->tm_queue) {
                            pop_TM_queue ();
                            return change_state (session, G_TAKEN, U_INVALID);
                        }
                        else {
                            pthread_attr_t attr;
                            pthread_attr_init (&attr);
                            pthread_create (&(session->timers[1]), &attr, handle_T1, session);
                            pthread_create (&(session->timers[2]), &attr, handle_T2, session);
                            send_TM_idle ();
                            session->cx = 0;
                        }
                    }
                }
            break;

            case G_TAKEN:
            {
                pthread_attr_t attr;
                pthread_attr_init (&attr);
                if (session->general_machine.state == G_IDLE) {
                    printf ("cancel T1 & T2");
                    pthread_cancel (session->timers[1]);
                    pthread_cancel (session->timers[2]);
                }
                session->cx++;
                pthread_create (&(session->timers[4]), &attr, handle_T4, session);
                send_TM_grant ();
                send_TM_media_notify ();
                if (!session->general_machine.reception)
                    session->general_machine.reception = my_alloc (sizeof (general_reception_state_t));
            }
            default:
            break;
        }
        if (session->general_machine.state != next_state) {
            printf ("G_state changes from %s to %s\n", dump_state(session->general_machine.state, U_INVALID), dump_state (next_state, U_INVALID));
            session->general_machine.state = next_state;
        }
        else {
            printf ("G_state remains at %s\n", dump_state (next_state, U_INVALID));
        }
    } /* end of G_state */
    else {

    }
    return NULL;
}


int main () {
    int navigation = 0;
    int i = 0;
    config_t configuration = {false};

    do {
        printf ("\n--------[1_INVITE,  2_200 OK,  3_TM_rq,  4_rtp,  5_TM_end] ??? \n");
        scanf ("%d", &navigation);
        switch (navigation) {
            case 1:
            {
                int mc_granted;
                invite_t* invite = (invite_t*) my_alloc (sizeof (invite_t));
                printf ("Recv INVITE...\n");
                printf ("fmtp:mc_granted? [0,1]\n");
                scanf ("%d", &mc_granted);
                invite->is_initial = true;
                invite->is_originating = true;
                invite->is_mc_granted = mc_granted;
                recv_invite (invite);
            }
            break;
            case 2:
            {
                int session_idx = 0;
                int callee_idx = 0;
                printf ("Recv 200 OK on what session?\n");
                scanf ("%d", &session_idx);
                printf ("From which callee [1 or 2]?\n");
                scanf ("%d", &callee_idx);
                recv_200 (session_idx, callee_idx);
            }
            break;

            case 3:
            {
                int session_idx = 0;
                int callee_idx = 0;
                char ssrc[50] = "";
                printf ("Recv TM Request on what session?\n");
                scanf ("%d", &session_idx);
                printf ("From which participant [0, 1 or 2]?\n");
                scanf ("%d", &callee_idx);
                sprintf(ssrc, "ssrc_%d_ssrc", callee_idx);

                recv_TM_request (all_sessions[session_idx], callee_idx, ssrc);
            }
            break;

            case 4:
            {
                int session_idx = 0;
                int callee_idx = 0;
                char ssrc[50] = "";
                printf ("Recv RTP on what session?\n");
                scanf ("%d", &session_idx);
                printf ("From which participant [0, 1 or 2]?\n");
                scanf ("%d", &callee_idx);
                recv_rtp(all_sessions[session_idx], callee_idx);
            }
            break;

            case 5:
            {
                int session_idx = 0;
                int callee_idx = 0;
                char ssrc[50] = "";
                printf ("Recv TM End on what session?\n");
                scanf ("%d", &session_idx);
                printf ("From which participant [0, 1 or 2]?\n");
                scanf ("%d", &callee_idx);
                recv_TM_end_request(all_sessions[session_idx], callee_idx);
            }
            break;

            default:
            break;
        }
    }
    while (navigation != 100);

    return 0;
}

/*
 quite good

 */