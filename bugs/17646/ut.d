int main()
{
        runTests!"";
}

int runTests(Modules...)() {
        import reflection;
        allTestData!Modules;
}
