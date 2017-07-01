import std.stdio;

void main() {

    int num = 10, whatisit; 
    /*
    in the following code, ^^ does not work as intended, 
    num^^2 is displayed as num not decremented or incremented:
    */
    write(--num,' ',num*num,' ',num^^2,'\n'); //ouput: 9 81 100 //NOT: 9 81 81
    write(++num,' ',num*num,' ',num^^2); //ouput: 10 100 81 //NOT: 10 100 100

    /*
    as long as num is not incremented or decremented in write() or writeln() 
    ^^ works as intended:
    */                                            
    write('\n',num*num,' ',num^^2); //output: 100 100    

    /*                                
    when num is incremented or decremented and num^^2 is assigned,
    ^^ works as intended:    
    */
    write('\n',--num,' ',num*num,' ',whatisit = num^^2); //ouput: 9 81 81
    write("\n",++num,' ',num*num,' ',num^^=2,'\n');    //output: 10 100 100
}//DMD64 D Compiler v2.074.0
