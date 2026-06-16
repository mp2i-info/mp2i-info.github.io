#include <stdio.h>

int* f() {
    int x = 42;
    return &x;
}

int main() {
    int* p = f();
    *p = 4;
}