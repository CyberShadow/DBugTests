template Identity(T)
{
	alias Identity = T;
}

void fun(T)(Identity!T value)
{
}

void main()
{
	fun(5);
}
