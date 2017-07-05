void main()
{
	int[] values = [ 0, 1, 2 ]; // dynamically

	foreach(int i, v ; values)
	{
		// error
	}

	foreach_reverse(int i, v ; values)
	{
		// error
	}
}
