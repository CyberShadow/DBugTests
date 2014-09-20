void f1(string[] s...)
{
    assert(s[0] == "Cheese");
}

auto f2(string arg)
{
	string result = arg;
	return result;
}

void main()
{
	f1(f2("Cheese"));
}
