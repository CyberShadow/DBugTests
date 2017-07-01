void foo(int[2] data) {}
void main() {
    int[2] aux = [0: 10, 1: 20]; // OK
    foo(aux);                    // OK
    foo([0: 10, 1: 20]);         // Error.
}
