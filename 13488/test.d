struct T {
  const(int)* p = null;
  this(const(int)* q) pure {
    p = q;
  }
}

void foo() {
  int x;
  T p1 = T(&x);            // ok
//  immutable(T) p2 = T(&x); // error
  immutable int y;
  immutable(T) p3 = T(&y); // line 14, should be ok
//  immutable(T)* p4 = new T(&y); // line 15, should be ok
}
