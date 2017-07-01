void main()
{
    import std.algorithm;
    assert("one two three".until("two", OpenRight.no).equal("one t"));
}
