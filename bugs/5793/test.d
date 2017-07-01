import std.array, std.container;

template func(T) {
    alias void function(T) func;
}

void G(uint x) {
}

void f(T)(func!T g) { // Won't work, except with (*)
// void f(T)(void function(T) g) {
}

void main() {
    f(&G);
    // f!uint(&G); // (*)
}
