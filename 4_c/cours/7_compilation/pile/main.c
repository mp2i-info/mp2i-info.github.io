#include <stdio.h>
#include "pile.h"

int main() {
    pile p = create(10);
    printf("is_empty(p): %d\n", is_empty(p));
    push(&p, 42);
    push(&p, -5);
    printf("pop(p): %d\n", pop(&p));
    printf("pop(p): %d", pop(&p));
    return 0;
}