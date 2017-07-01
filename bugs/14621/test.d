void main()
{
    S s;
    s.foo();
}

struct S
{
    float[] array;
    alias array this;

    template erroneousTemplateInstantiation()
    {
        static assert(false);
    }

    void foo()
    {
        S ret;
        ret[] = erroneousTemplateInstantiation!();
    }
}

