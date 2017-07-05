import std.c.stdio: printf;
import std.c.stdlib: atof;
import std.math: sin;
pure double msin(double x) {
    return sin(x);
}
void main() {
    double x = atof("0.3");
    double y = msin(x) + msin(x);
    printf("%f\n", y);
}
