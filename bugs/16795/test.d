void main() @safe
{
	int* q;
	scope int* p;
	scope int** pp = &q; // ok
	pp = &p; // error
}
