#include <stdbool.h>

struct pile {
    int* t; // tableau contenant les éléments
    int size; // nombre d'éléments (= dessus de la pile)
};

typedef struct pile pile;

pile create(int);

bool is_empty(pile);

void push(pile*, int);

int pop(pile*);
