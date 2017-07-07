auto foo(int) {
  return foo(1.0);
}

auto foo(double) {
  return 0;
}

void main() {
  auto boo = foo(0);
}
