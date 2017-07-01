import std.json;

void main()
{
	string s = `"\uD834\uDD1E"`;
	auto j = parseJSON(s);
	assert(j.str == "\U0001D11E");
}
