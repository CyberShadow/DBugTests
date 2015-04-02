struct ParameterValue
{
    typeof(f()) x;
    this(int dummy)
    {
        if(true) this.x = f(); /* line 6 */
        else assert(false);
    }
}
auto f()
{
    return MapResult!(e => 0)();
}
struct MapResult(alias pred)
{
    @property int front() {return pred(0);}
}
