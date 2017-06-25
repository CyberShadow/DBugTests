import std.traits;
import std.typetuple;

struct Vector
{
    float x,y,z,w;
    enum Vector one = Vector(1,1,1,1);
}

void func(int x = 10, const Vector v = Vector.one);

template ParameterDefaults(func...)
    if (func.length == 1 && isCallable!func)
{
    static if (is(FunctionTypeOf!(func[0]) PT == __parameters))
    {
        template Get(size_t i)
        {
            // workaround scope escape check, see
            // https://issues.dlang.org/show_bug.cgi?id=16582
            // should use return scope once available
            enum get = (PT[i .. i+1] _args) @trusted
            {
                // If __args[0] is lazy, we force it to be evaluated like this.
                PT[i] __pd_value = _args[0];
                PT[i]* __pd_val = &__pd_value; // workaround Bugzilla 16582
                return *__pd_val;
                // return 1;
            };
            static if (is(typeof(get())))
                enum Get = get();
            else
                alias Get = void;
                // If default arg doesn't exist, returns void instead.
        }
    }
    else
    {
        static assert(0, func[0].stringof ~ "is not a function");

        // Define dummy entities to avoid pointless errors
        template Get(size_t i) { enum Get = ""; }
        alias PT = TypeTuple!();
    }

    template Impl(size_t i = 0)
    {
        static if (i == PT.length)
            alias Impl = TypeTuple!();
        else
            alias Impl = TypeTuple!(Get!i, Impl!(i+1));
    }

    alias ParameterDefaults = Impl!();
}

static if(is(typeof(func) PT == __parameters))
{
    pragma(msg, PT);
    pragma(msg, fullyQualifiedName!(PT[1]));
    pragma(msg, ParameterDefaults!func[1]);
    pragma(msg, __traits(identifier, ParameterDefaults!func[1]));
}
