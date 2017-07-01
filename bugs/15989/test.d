struct Input{}

interface Kickstart
{
	bool opCall(ref Input );
}

struct Regex
{
    Kickstart kickstart;
}


auto regex()
{
    return Regex(new ShiftOr());
}


class ShiftOr : Kickstart
{
    bool opCall(ref Input )
    {
        return false;
    }
}

enum ctRegex = regex();

void main()
{
    auto r = ctRegex;
    auto s = Input();
    r.kickstart(s);
}
