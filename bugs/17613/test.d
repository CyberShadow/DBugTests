import std.stdio;
struct MyFile
{
    this(string filename) { }
    auto byLine() { return 0; }
}
struct Wrapper
{
    this(Args...)(Args args) {}
}
auto func(F = std.stdio.File)(bool[] args)
{
    import std.algorithm.iteration : map;
    foreach (x; args.map!(arg => arg ?  Wrapper(
                                            F("A").byLine) :
                                        Wrapper(
                                            0)))
    { }
}
void main()
{
    import std.algorithm : each;
    func!MyFile([ true, false ]);
    func([ false ]);
}
