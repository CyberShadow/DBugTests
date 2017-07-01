struct S {
     void foo(T)(int j) {}
     static void foo(T)(int j) {}
}

void main()
{
     S.foo!bool(1);
}
