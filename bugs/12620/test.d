template Foo(alias sym)         { pragma(msg, "Foo1"); }
template Foo(alias int[] sym)   { pragma(msg, "Foo2"); }
template Foo(alias float[] sym) { pragma(msg, "Foo3"); }

void main()
{
    alias foo1 = Foo!(1);      // instantiates #1, ok
    alias foo2 = Foo!([1]);    // instantiates #2, ok
    alias foo3 = Foo!([1.0]);  // instantiates #1 instead of #3!
}
