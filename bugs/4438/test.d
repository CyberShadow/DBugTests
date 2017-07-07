version (Tango)
    import tango.stdc.stdio: printf;
else
    import std.c.stdio: printf;

double masked_dot(double[] a1, double[] a2, ubyte[] mask)
    in {
        assert(a1.length == a2.length);
        assert(a1.length == mask.length);
    } body {
        double sum = 0.0;
        foreach (i, m; mask)
            if (m)
                sum += a1[i] * a2[i];
        return sum;
    }

void main() {
    int N = 1000;

    auto m1 = new double[][](N, N);
    foreach (ref row; m1)
        row[] = 2.0;

    auto m2 = new double[][](N, N);
    foreach (ref row; m2)
        row[] = 0.5;

    auto mask = new ubyte[N];
    mask[] = 1;

    double sum = 0.0;
    for (int r; r < m1.length; r++)
        sum += masked_dot(m1[r], m2[r], mask);

    printf("%f\n", sum);
}
