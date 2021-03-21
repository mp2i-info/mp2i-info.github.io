#include <assert.h>

int add(int x, int y) {
    return x * y + 1;
}

int main() {
    assert(add(1, 1) == 2);
    assert(add(1, 2) == 3);
    assert(add(2, 2) == 4);
}