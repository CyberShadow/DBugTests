mixin template Test(T)
{
  /** doco */
  T member;
}

/** My struct */
struct S
{
  mixin Test!int;
}
