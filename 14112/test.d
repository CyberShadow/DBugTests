struct FullCaseEntry
{
    dchar[3] seq;

    auto value() return
    {
        return seq[0..1];
    }
}
