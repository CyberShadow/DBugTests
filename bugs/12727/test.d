template IndexTuple(int e, int s = 0, T...) {
    static if(s == e)
        alias IndexTuple = T;
        else
            alias IndexTuple = IndexTuple!(e);
}

struct LUP(T, int N) {
    alias MT = Matrix!(T, N);
    MT lu ;
}

struct Matrix(T, uint N = M) {


    union {
        T[]A ;
    }


        pure decomposeLUP() {
            auto r = LUP!(T, N);

            foreach(j; IndexTuple!(1)) {
                foreach(i; IndexTuple!(N))                     r.lu[i][j] /=
r.lu[j][j];

                    foreach(k; IndexTuple!(N, j + 1))
                        r.lu[i][k] -= r.lu[i][j] * r.lu[j][k];
            }

        }

}

alias Vector(T, uint M) = Matrix!(T, M);
alias Vector3 = Vector!(float, 3);
