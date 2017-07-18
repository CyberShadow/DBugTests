alias BS = BSA;
alias BS = BSB;

template BSA(alias T)
{
}

template BSB(T)
{
}

void foo()
{
    void bar(alias composite)()
    {
        foreach (member; __traits(allMembers, composite))
            enum a = __traits(compiles, __traits(getMember, composite, member));
    }

    bar!test;
}
