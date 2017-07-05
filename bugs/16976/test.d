void main()
{
	foreach(int i, v ; [0, 1, 2])
	{
		// ok
	}

	foreach_reverse(int i, v ; [0, 1, 2])
	{
		// error cannot implicitly convert (__r1234.length) of type ulong to int
	}

}
