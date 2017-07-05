struct TestType(T) {}
alias TestAlias(T) = TestType!T;
void testFunction(T)(TestAlias!T arg) {}

void main()
{
    TestAlias!int testObj;
    testFunction(testObj); /* "cannot deduce function from argument types !()(TestType!int)" */
}
