struct T
{
    void put(char c) {}
}

struct S
{
    T t;

    @property
    T getT()
    {
        return t;
    }

    @property
    inout(T) getT() inout
    {
        return t;
    }

    alias getT this;
}

alias Sput = S.put;
