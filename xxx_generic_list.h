#ifndef __xxx_generic_list
#define __xxx_generic_list
#include <stdbool.h>

typedef struct _node_t {
    int sz;
    void* data;
    void (*func_del)(void *data);
    void (*func_dump)(void *data);
    struct _node_t* next;
} node_t;

void* search_first_node(const node_t *list, const node_t *entry, bool (*func)(const void* x, const void* y));
void* search_first_node_dynamic(const node_t *list, const void *entry, bool (*func)(const void *x, const void *y));
void free_node (node_t **node);
void* append_node(node_t **list, node_t *entry);
void dump_node(const node_t *list);
bool delete_first_node(node_t **list, node_t *entry, bool (*func)(const void *x, const void *y));
#endif