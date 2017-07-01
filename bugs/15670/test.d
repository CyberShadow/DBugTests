void main()
{
    import std.variant;

    class BaseTemplate(T) { this() {} }
    class Concrete : BaseTemplate!int { this() {} }

    Algebraic!(Concrete) holder;
    Concrete a = new Concrete();
    holder = Algebraic!Concrete(a);
}
