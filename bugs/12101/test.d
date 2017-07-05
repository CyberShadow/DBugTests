auto makeBox(int value)
{
	struct Box
	{
		int getValue() { return value; }
	}
	
	return Box();
}

enum value = makeBox(1).getValue();
