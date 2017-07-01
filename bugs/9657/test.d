mixin template InnerMixin()
{
    void method() {}
}

mixin template OuterMixin()
{
final: // This is important for some reason

    mixin InnerMixin;

    // For some reason, this assert passes,
    // even though the "static if" does not
    static assert(is(typeof(&method)));

    // Uncomment this line to get things working:
    //void moreMagic() {}

    static if (!is(typeof(&method)))
        static assert(false, "No 'method' in current context");
}

class Class
{
    mixin OuterMixin;
}
