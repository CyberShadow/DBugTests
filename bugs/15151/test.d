module test;
deprecated int x;
alias ax = x;        // OK, warns
alias fqax = test.x; // No warning
