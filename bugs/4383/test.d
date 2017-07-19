int main(string[] args) {
    real x = args.length == 2 ? 6.0 : 4.0; // just to defeat the optimiser
//    real y = x * 2;  // (1)
    real y = x + x;    // (2)
    return cast(int)y;  
}
