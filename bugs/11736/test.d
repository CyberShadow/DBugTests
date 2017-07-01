import std.stdio, std.parallelism, std.process;

void main() {
    auto a=["hello","world","goodbye"];
	while (true)
    foreach(s; parallel(a,1)) {
        auto ls=executeShell("echo "~s);
        writeln(ls.output);
    }
}
