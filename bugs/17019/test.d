unittest
{
    import std.algorithm.iteration : each, sum;
    import std.parallelism : parallel;
    import std.range : iota;

    auto logsIndex = new int[10];
    parallel(logsIndex).each!((i, ref e) => e += i);
    assert(logsIndex.sum == 10.iota.sum);
}
