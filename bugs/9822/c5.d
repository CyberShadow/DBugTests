struct MapResult(alias fun) {
    @property auto ref front() {
        return fun(1);
    }
}

auto map(alias fun)() {
    return MapResult!(fun)();
}

auto foo(int[] r) {
    return map!((int x) => r)();
}

auto result = foo([1]);

void main() {
    result.front();
}
