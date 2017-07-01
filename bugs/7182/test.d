class A
{
public:
    int f() const
    {
        return 5;
    }

protected:
    invariant()
    {
        assert (f() == 5);
    }
}
