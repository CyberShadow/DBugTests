import core.thread, core.memory, std.stdio;

class Job : Thread {
 this() {
   super(&run);
 }

 private void run() {
   while (true) write("*");
 }
}

void main() {
 Job j = new Job;
 j.start();

 //j.sleep(dur!"msecs"(1));

 GC.collect();

 while(true) write(".");
}
