#include "pile.h"
#include <stdlib.h>

struct pile {
    int* t;   // tableau contenant les éléments
    int size; // nombre d'éléments (= dessus de la pile)
};

pile* create(int capacity) {
    pile* p = (pile*)malloc(sizeof(pile));
    int* t = malloc(capacity*sizeof(int));
    p->t = t;
    p->size = 0;
    return p;
}

bool is_empty(const pile* p) {
    return p->size == 0;
}

void push(pile* p, int e) {
    p->t[p->size] = e;
    p->size++;
}

int pop(pile* p) {
    p->size--;
    return p->t[p->size];
}
