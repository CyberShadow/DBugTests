// OK
alias extern(C) void function() fun1;

// OK
extern(C) alias fun2 = void function();

// Error
alias fun3 = extern(C) void function();
