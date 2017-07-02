struct MyStruct
{
    static assert(is(typeof(this = this))); // Here it passes.
	
    static if (!is(typeof(this = this)))
        static assert(0); // But here it fails.
}
