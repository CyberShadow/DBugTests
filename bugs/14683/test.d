import core.atomic;

shared int foo, bar;

void main()
{
	pragma(msg, typeof(atomicOp!"<"(foo, bar)));
}
