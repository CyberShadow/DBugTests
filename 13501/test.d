int careful()
{
	scope(failure) throw new Exception("Failure");
	scope(success) throw new Exception("Success");
	return victim();
}

int victim()
{
	return 0;
}

void main()
{
	try
		careful();
	catch (Exception e)
		assert(e.msg == "Failure");
}
