void foo()
{
    uint var1 = 1;        //    stack: no linkage => no mangling
    pragma(msg, var1.mangleof); // prints '_D3bug3fooFZv4var1k'

    enum uint var2 = 2;   // manifest: no linkage => no mangling
    pragma(msg, var2.mangleof); // prints 'k'

    // TLS variables are debatable
    static uint var3 = 3; //      TLS: no linkage => no mangling
    pragma(msg, var3.mangleof); // prints '_D3bug3fooFZv4var3k' (mangling of the initializer)

    auto var4 = new uint; //     heap: no linkage => no mangling
    pragma(msg, var4.mangleof); // prints '_D3bug3fooFZv4var4Pk'
}
