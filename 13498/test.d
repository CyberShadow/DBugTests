int test1()()
{
    return "foo"; // should fail as well
}

/+
int test2()
{
    return "foo"; // Error: cannot implicitly convert expression ("foo") of
type string to int
}
+/

static assert(!is(typeof(test1())));
