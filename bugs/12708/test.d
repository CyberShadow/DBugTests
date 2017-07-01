import std.parallelism;
import std.getopt;


import std.array;
import std.ascii;
import std.base64;
import std.bigint;
import std.bitmanip;
import std.concurrency;
import std.container;
import std.cstream;


alias TestFunction = void function();

auto getTests(Modules...)() {
    TestFunction[] tests;
    foreach(mod; Modules) {
        foreach(test; __traits(getUnitTests, mod)) {
            tests ~= &test;
        }
    }
    return tests;
}



void main(string[] args) {
    bool single;
    getopt(args,
           "single|s", &single
        );

    enum tests = getTests!(
        std.array,
        std.ascii,
        std.base64,
        std.bigint,
        std.bitmanip,
        std.concurrency,
        std.container,
        std.cstream,
        );

    if(single) {
        foreach(test; tests) {
            test();
        }
    } else {
        foreach(test; tests.parallel) {
            test();
        }
    }
}
