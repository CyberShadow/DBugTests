void main()
{
	int[1] i, j; 
	bool b = true;
	(b ? i : j) = [4];
	assert(i == [4]);
}
