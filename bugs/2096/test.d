struct A
{
	int a,b;
}

void f()
{
	int[4] rgi=[1,2,3,4]; //(1) ok? why?
	A x={1,2}; //(2) ok
	A y={a:1,b:2}; //(3) fail. why?
	x=A(1,2); //(4) ok
	x=A(a:1,b:2); //(5) fail
	x={1,2}; //(6) fail
	x={a:1,b:2}; //(7) fail
}
