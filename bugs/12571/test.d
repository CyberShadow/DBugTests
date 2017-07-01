mixin template getScopeName()
{
    enum scopeName = __traits(identifier, __traits(parent, scopeName));
}

void main()
{
    mixin getScopeName;
    pragma(msg, scopeName);
}
