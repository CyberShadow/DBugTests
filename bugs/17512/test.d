struct A(T)
{
    T _value;

    bool _hasValue;

    auto ref getOr(T alternativeValue)
    {
        return _hasValue ? _value : alternativeValue;
    }
}

A!int a;
