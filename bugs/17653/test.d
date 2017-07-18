template foo(T) {
   struct R { int x; }
   auto foo(T t) { return R(1); }
}

template foo(T) {
   struct R { string s; }
   auto foo(T t, bool f) { return R("hi"); }
}

void main()
{
   foo(1);
   foo(1, true);
}
