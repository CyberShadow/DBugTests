module bar;
unittest
{
    import foo : Erase; // A non-selective import correctly errors
    assert(Erase == 2);
}
