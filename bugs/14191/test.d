void main(string[] args)
{
	D.myTemplate3(0);
}

class C
{
	static void myTemplate2(this P, T)(T val)
	{
		P.myTemplate(val);
	}
}

class D : C
{
	static void myTemplate3(T)(T val)
	{
		myTemplate2(val);
	}

	static void myTemplate(T)(T val)
	{

	}
}
