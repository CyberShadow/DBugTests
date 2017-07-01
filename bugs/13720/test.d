module std.datetime;
import core.time;
import std.exception;

alias DateTimeException = TimeException;

struct SysTime
{

    this(in DateTime dateTime, in FracSec fracSec, immutable UTC tz = null) { }

    /+deprecated+/ unittest
    {
        assertThrown!DateTimeException(SysTime(DateTime.init, FracSec.from!"hnsecs"(-1), UTC()));
    }

}

struct TimeOfDay
{
    public pure nothrow @safe ~this() { }

    ubyte _hour;
    ubyte _minute;
    ubyte _second;

}

struct DateTime
{
    TimeOfDay _tod;
}

class UTC 
{
    static immutable(UTC) opCall() @safe pure nothrow
    {
        return _utc;
    }

    static immutable UTC _utc = new immutable(UTC)();
}