// First snipped
//---
struct IrcEvent(T)
{
    private T[] _container;

    bool opOpAssign(string op, R)(R dlg)
    if (op == "+")
    {
        _container ~= dlg;

        return true;
    }
}

class IrcClient
{
    public IrcEvent!(void delegate(string)) OnMessageReceived;
}


class Foo
{
    static public void Dispatch(IrcClient session)
    {
        auto operator = new Foo;
        session.OnMessageReceived += &operator.Dispatch;
    }

    public void Dispatch(string msg)
    {
    }
}

void main()
{
    auto irc = new IrcClient;
    Foo.Dispatch(irc);
}
