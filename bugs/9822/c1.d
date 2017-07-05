struct MapResult(alias fun) {
    int[] _input;

    @property bool empty() {
        return _input.length == 0;
    }

    void popFront() {
        _input = _input[1 .. $];
    }

    @property auto ref front() {
        return fun(1);
    }
}

auto map(alias fun)(int[] r) {
    return MapResult!(fun)(r);
}

auto foo(int[] r) {
    return map!(x => r)([1]);
}

enum r1 = [1];
auto result = foo(r1);

void main() {
    foreach (t; result) {}
}
