#include <stdbool.h>

typedef struct
{
    int *t;   // tableau contenant les éléments
    int size; // nombre d'éléments (= dessus de la pile)
} pile;

pile create(int);

bool is_empty(pile);

void push(pile *, int);

int pop(pile *);
