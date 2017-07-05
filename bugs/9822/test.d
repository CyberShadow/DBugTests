module test;    

import std.algorithm, std.traits, std.stdio;

enum r1 = [1, 2, 3];
auto product = cartesianProduct(r1, r1);

void main()
{
    writeln(product);	
}
