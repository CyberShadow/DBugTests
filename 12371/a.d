module A;

class C2(T)
{
    mixin(testMixin!(typeof(this)));
}

auto testT(Class)() { return 0; }

template testMixin(Tclass)
{
    enum : string { testMixin =
        `static getT() {
                return testT!(` ~ Tclass.stringof ~ `);
         }`
    }
}
