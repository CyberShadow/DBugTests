void main()
{
	//static assert(!""); // currently fails
	static assert(![]); // currently passes
	static assert(![' '][1..1]);  // passes
	//static assert(!" "[1..1]);    // fails

	//assert(a==b && (!a&&b||!b&&a)); // might fail more or less randomly for dynamic arrays a,b
}