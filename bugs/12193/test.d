struct Foo {
  bool bar;
  alias bar this;
  void opOpAssign(string op)(size_t x) {
    bar = true;
  }
}

void main() {
  Foo foo;
  foo <<= 1;
  assert(foo.bar);
}
