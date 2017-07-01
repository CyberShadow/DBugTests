import std.concurrency;

struct A { 
    immutable(int[]) a;  
}

void foo(Tid tid) {
    receive(
       (A a) {
           send(tid, true); 
       }); 
}

void main() {
    Tid tid = spawn(&foo, thisTid);
    immutable(int[]) a = [1];
    send(tid, A(a)); 
    receiveOnly!bool();
}
