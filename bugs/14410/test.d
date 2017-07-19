import core.demangle;

void main()
{
	static assert(demangleType(typeof(null).mangleof) == "typeof(null)", demangleType(typeof(null).mangleof));
}
