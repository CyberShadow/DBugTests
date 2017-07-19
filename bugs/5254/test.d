enum bool use_ctor = true;
struct Foo {
    static if (use_ctor) {
        double x, y, z;

        pure nothrow this(double x_, double y_, double z_) {
            this.x = x_;
            this.y = y_;
            this.z = z_;
        }
    } else {
        double x=0.0, y=0.0, z=0.0;
    }

    Foo muls(double s) {
        return Foo(this.x*s, this.y*s, this.z*s);
    }
}
void main() {}
