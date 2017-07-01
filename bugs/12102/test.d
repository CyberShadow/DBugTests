template hasFuncs(T) // Checks presence of T.func(T.A) and T.func(T.B)
{
  enum bool hasFuncs =
      is(typeof((T t, T.A a){ t.func(a); }))
    &&
      is(typeof((T t, T.B b){ t.func(b); }));
}

struct ConditionalUse(T) if (hasFuncs!T) { }

// This line fails with
//
// template instance main.ConditionalUse!(MyClass) does not
// match template declaration ConditionalUse(T) if (hasFuncs!T)

class MyClass
{
  struct A {}
  struct B {}

  alias ConditionalUse!MyClass Foo;

  void func(A a) { }
  void func(B b) { }
}

int main(char[][] args)
{
  static assert(hasFuncs!MyClass); // This assert succeeds.
  return 0;
}

