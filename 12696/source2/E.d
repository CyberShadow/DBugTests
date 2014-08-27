
struct Matrix(T, uint M, uint N = M) {


	string toString() const {
		return ``;
	}

	int opCmp()(auto ref in Matrix v) const {
		return 0;
	}

	T[][] A;

	pure transposed() {
		Matrix!(T, N, M) ret;
	}

	pure column() {
		Matrix!(T, M, 1) r = void;
	}
}

template Vector(T, uint M) {
	alias Vector = Matrix!(T, 1, M);
}

alias Matrix4 = Matrix!(float, 4);

alias Vector4 = Vector!(float, 4);

alias Quaternion = Matrix!(float, 1, 4);

