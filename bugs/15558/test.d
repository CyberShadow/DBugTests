struct Host {
    @disable this(this);
}

void main() {
    uint[] arr;

    import std.parallelism;
    auto hostmap = taskPool.map!(function Host(uint a) {
        return Host.init;
    })(arr);
}
