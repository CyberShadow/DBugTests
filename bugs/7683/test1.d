class C{
    mixin(delegate{
        string r;
        foreach(x;["a","b","c"]) r~="int "~x~";";
        return r;
    }());
}
