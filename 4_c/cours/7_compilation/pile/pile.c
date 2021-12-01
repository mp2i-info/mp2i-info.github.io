#include "pile.h"
#include <stdlib.h>

pile create(int capacity) {
    pile p;
    int* t = malloc(capacity*sizeof(int));
    p.t = t;
    p.size = 0;
    return p;
}

bool is_empty(const pile p) {
    return p.size == 0;
}

void push(pile* p, int e) {
    p->t[p->size] = e;
    p->size++;
}

int pop(pile* p) {
    p->size--;
    return p->t[p->size];
}
