void foo(T)(ref auto T v) { }
alias foo!int bar; // Error: auto can only be used for template function parameters
