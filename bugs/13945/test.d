struct A(T) {
  T x;
  this(int) {}  // Error: field x must be initialized in constructor, because it is nested struct
}

void bar(T)() {
  T y;  // Error: cannot access frame pointer of foo.main.X
}

void main() {
  struct X {
    this(int) {}
  }
  bar!X();
  A!X(1);
}
