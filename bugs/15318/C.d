module C;

import E;
alias value = bar!5;
void foo() {
    import core.stdc.stdio;
    printf("%p\n", &value);
}
