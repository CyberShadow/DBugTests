@nogc class TestClass 
{
	int x;
    
	@nogc this(int x) 
	{
		this.x = x;
	}
    
	@nogc~this() 
	{
	}
}


@nogc void main()
{
	TestClass obj;
	//created a testclass object name obj using emplace and malloc

	destroy(obj);//Error occurs here

	//free(cast(void*)obj);

}
