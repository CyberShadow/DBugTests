static import std.uni;

void main()
{
    auto c = 'İ'; // '\U0130' LATIN CAPITAL LETTER I WITH DOT ABOVE
    assert(std.uni.isUpper(c)); //Passes
    assert(c != std.uni.toLower(c)); //Fails
}
