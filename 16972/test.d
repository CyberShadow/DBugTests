void main() {
    for (;;) {
        // It's good that these all produce error messages. (But see issue 16971.)
        // scope (exit) goto end;
        // scope (exit) break;
        // scope (exit) continue;
        // scope (exit) return;

        // Unfortunately, this does not issue any diagnostic:
        scope (exit) throw new Exception("foo");
        throw new Exception("Bar");
    }

end:
}
