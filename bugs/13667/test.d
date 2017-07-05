struct Array(T)
{
    Array!(T) impConv() const { return *cast(typeof(return)*)this; }
    alias impConv this;

    struct Range
    {
        Array _arr;
        void front() inout { _arr[]; }
    }
}

alias Array!int AI;
