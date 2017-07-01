class Foo {
    InPlace!Bar inside;
}

class Bar { }

struct InPlace(T) {
        pragma(msg, __traits(classInstanceSize, T));
        private byte[__traits(classInstanceSize, T)] rawData;

        void initializeObject() {
                pragma(msg, __traits(classInstanceSize, T));
        }
}
