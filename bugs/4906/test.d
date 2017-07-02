class C { abstract bool foo(); }

void fun(C obj)
{
	if (obj is null && obj.foo()) {
	}
}
