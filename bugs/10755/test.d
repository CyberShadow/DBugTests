int foo() {
    return 1, 2; // line 2
}
int bar() {
    return foo(), 3; // line 5
}
void main() {
    assert(bar() == 3);
}
