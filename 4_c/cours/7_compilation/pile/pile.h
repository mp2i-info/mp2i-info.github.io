#ifndef PILE_H
#define PILE_H

#include <stdbool.h>

struct pile;

typedef struct pile pile;

pile* create(int);

bool is_empty(const pile*);

void push(pile *, int);

int pop(pile *);

#endif
