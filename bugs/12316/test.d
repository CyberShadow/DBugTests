void main() {
  Object defObj = null;
  Object[int] foo;
  auto frop = foo.get(0, null);    // compiles fine
  auto bar = foo.get(0, defObj); // error
}
