#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "xxx_generic_list.h"

typedef struct _my_data_t {
    int x;
    int *y;
    char *str;
} my_data_t;

void *search_first_node(const node_t *list, const node_t *entry, bool (*func)(const void *x, const void *y)) {
    const node_t *tmp = list;

    if (!list || !entry) return NULL;

    while (tmp) {
        if (func) {
            if (func(tmp->data, entry->data)) return (void *) tmp;
        }
        tmp = tmp->next;
    }
    return NULL;
}

void *search_first_node_dynamic(const node_t *list, const void* entry, bool (*func)(const void *x, const void *y)) {
    const node_t *tmp = list;

    if (!list || !entry) return NULL;

    while (tmp) {
        if (func) {
            if (func(tmp->data, entry)) return (void*) tmp->data;
        }
        tmp = tmp->next;
    }
    return NULL;
}

void free_node (node_t **node) {
    if (!node || !*node) return;
    if ((*node)->func_del) ((*node)->func_del)((*node)->data);
    else free ((*node)->data);
    (*node)->data = NULL;
    free(*node);
    *node = NULL;
}

void free_nodes (node_t **list) {
    node_t *tmp, *cur = *list;

    if (!cur) return;

    while (cur) {
        tmp = cur;
        cur = cur->next;
        tmp->next = NULL;
        free_node (&tmp);
    }
    *list = NULL;
}

void* append_node(node_t **list, node_t *entry) {
    node_t* prev, *cur;

    if (!list || !entry) return NULL;

    for (prev = *list, cur = *list; cur; prev = cur, cur = cur->next);

    if (!prev) *list = entry;
    else prev->next = entry;

    ++(*list)->sz;

    return *list;
}

void dump_node(const node_t *list) {
    const node_t *tmp = list;
    if (list) printf ("sz=%d\n", list->sz + 1);
    while (tmp) {
        if (tmp->func_dump) tmp->func_dump (tmp->data);
        else printf ("%p(data=%p) ", tmp, tmp->data);
        tmp = tmp->next;
    }
    printf ("\n");
}

bool delete_first_node(node_t **list, node_t *entry, bool (*func)(const void *x, const void *y)) {
    node_t *prev, *cur;
    int sz;

    if (!list || !entry) return false;

    for (prev = *list, cur = *list; cur; prev = cur, cur = cur->next) {
        if (func && func (cur->data, entry->data)) {
            break;
        }
    }
    if (cur == NULL) return false;

    sz = --(*list)->sz;
    if (prev == cur) {
        if (prev == *list) {
            cur = *list;
            *list = (*list)->next;
            (*list)->sz = sz;
            cur->next = NULL;
            free_node (&cur);
        }
        else {
            prev->next = cur->next;
            free_node (&cur);
        }
    }
    else {
        prev->next = cur->next;
        free_node (&cur);
    }
    return true;
}

void free_my_data_t (void* dt) {
    my_data_t *data = (my_data_t*) dt;
    free (data->y);
    free (data->str);
    free (data);
}

void dump_my_data_t (void* dt) {
    my_data_t *data = (my_data_t*) dt;
    if (data) printf("<x=%d, y=%p(%d), str=%s> ", data->x, data->y, *(data->y), data->str);
}

bool cmp_my_data_t (const void* dt1, const void* dt2) {
    const my_data_t *data1 = (my_data_t*) dt1;
    const my_data_t *data2 = (my_data_t*) dt2;
    if (data1 && data2) {
        if (data1->x == data2->x && strcasecmp(data1->str, data2->str) == 0) return true;
    }
    return false;
}

/*int main () {
    node_t *a = calloc (1, sizeof (node_t));
    node_t *b = calloc (1, sizeof (node_t));
    node_t *c = calloc (1, sizeof (node_t));

    a->data = calloc (1, sizeof (my_data_t));
    a->func_del = free_my_data_t;
    a->func_dump = dump_my_data_t;
    ((my_data_t*)a->data)->x = 500;
    ((my_data_t*)a->data)->y = calloc (1, 50);
    ((my_data_t*)a->data)->str = strdup ("haha");

    b->data = calloc (1, sizeof (my_data_t));
    b->func_del = free_my_data_t;
    b->func_dump = dump_my_data_t;
    ((my_data_t*)b->data)->x = 600;
    ((my_data_t*)b->data)->y = calloc (1, 60);
    ((my_data_t*)b->data)->str = strdup ("hoho");

    append_node(&a, b);
    dump_node(a);

    c->data = calloc (1, sizeof (my_data_t));
    c->func_del = free_my_data_t;
    c->func_dump = dump_my_data_t;
    ((my_data_t*)c->data)->x = 700;
    ((my_data_t*)c->data)->y = calloc (1, 70);
    ((my_data_t*)c->data)->str = strdup ("hihi");


    if (search_first_node (a, c, cmp_my_data_t)) {
        printf ("the entry is found\n");
    }
    else {
        printf ("the entry is not found\n");
    }


    append_node (&a, c);
    dump_node (a);
    if (delete_first_node (&a, a, cmp_my_data_t)) {
        printf ("the entry is deleted\n");
    }
    else {
        printf ("the entry is not deleted\n");
    }
    dump_node (a);

    free_nodes (&a);
    dump_node (a);

    return 0;
}
*/

/*
gitpod /workspace/Study_C $ gcc -g -fsanitize=address xxx_generic_list.c
gitpod /workspace/Study_C $ ./a.out
<x=500, y=0x5646dda03310(0), str=haha> <x=600, y=0x5646dda03390(0), str=hoho>
the entry is not found
<x=500, y=0x5646dda03310(0), str=haha> <x=600, y=0x5646dda03390(0), str=hoho> <x=700, y=0x5646dda03420(0), str=hihi>
the entry is deleted
<x=600, y=0x5646dda03390(0), str=hoho> <x=700, y=0x5646dda03420(0), str=hihi>
*/