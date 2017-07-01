inout(T) sample(T)(inout(T)[] arr)
{
	return arr[0];
}

void main()
{
	auto n = sample([7, 7, 7]);      // OK
	auto s = sample(["foo", "bar"]); // Error
}
