import std.algorithm : min, max;
import std.math;
import std.stdio;

pragma(msg, min(0, float.nan)); //Yields 0
pragma(msg, max(0, float.nan)); //Yields 0
pragma(msg, min(float.nan, 0)); //Yields float.nan
pragma(msg, max(float.nan, 0)); //Yields float.nan

void main()
{
	writeln(min(0, float.nan)); //Yields 0
	writeln(max(0, float.nan)); //Yields 0
	writeln(min(float.nan, 0)); //Yields float.nan
	writeln(max(float.nan, 0)); //Yields float.nan

	//assert(isNaN(min(0, float.nan)));
}
static assert(min(0, float.nan)==0);
