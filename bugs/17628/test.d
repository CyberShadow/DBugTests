
pure void main()
{
    import std.format : formattedWrite;
    import std.array : appender;
    auto app = appender!string;
    app.formattedWrite!"%s"(1.0);
}
