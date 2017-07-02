struct HashTable
{
	immutable(Key)* keys;

	~this()
	{
		//destroy( keys[0] );
		//keys[0].__dtor();
		//delete keys;
		keys[0].__xdtor();
	}
}

struct Key
{
	KeyData data;
	~this() const {}
}

struct KeyData
{
	~this() const {}
}
