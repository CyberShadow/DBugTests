    module mod;

    private {
        version(foo) union mod {};
        version(bar) struct mod {};
        version(baz) class mod {};
        version(quux) alias int mod;
    }
