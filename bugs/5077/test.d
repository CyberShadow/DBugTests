import std.stdio: writeln;
import std.algorithm: schwartzSort, sort;
import std.random: Random, uniform;
import std.typecons: Tuple;

enum SortType { none, sort, schwartz }

enum DATA_LEN = 1_000_000;
//enum sort_type = SortType.sort;


alias Tuple!(double, "x", double, "y") P;

void test(SortType sort_type)() {
    auto data = new P[DATA_LEN];
    auto rnd = Random(1);
    foreach (ref el; data) {
        double x = uniform(0.0, 1.0, rnd);
        double y = uniform(0.0, 1.0, rnd);
        el = P(x, y);
    }

    if (data.length < 50) writeln(data);

    static if (sort_type == SortType.schwartz) {
        schwartzSort!((p) { return p.y; })(data);
        schwartzSort!((p) { return p.x; })(data);
        schwartzSort!((p) { return p.y; })(data);
    }

    static if (sort_type == SortType.sort) {
        sort!q{ a.y < b.y }(data);
        sort!q{ a.x < b.x }(data);
        sort!q{ a.y < b.y }(data);
        /*
        // alternative
        sort!((P a, P b) { return a.y < b.y; })(data);
        sort!((P a, P b) { return a.x < b.x; })(data);
        sort!((P a, P b) { return a.y < b.y; })(data);
        */
    }

    if (data.length < 50) writeln(data);
}

void main()
{
	import std.datetime;
	auto x = benchmark!(
		test!(SortType.none),
		test!(SortType.sort),
		test!(SortType.schwartz))(1);
	foreach (t; x)
		writeln(t);
}