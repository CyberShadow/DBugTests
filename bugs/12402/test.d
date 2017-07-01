int[5] foo(int[2] a, int[3] b) {
    typeof(return) result = a ~ b; // OK
    return result;
}
int[5] bar(int[2] a, int[3] b) {
    return a ~ b;                  // Error
}
void main() {}
