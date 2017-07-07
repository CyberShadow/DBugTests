import core.sync.mutex;

import std.stdio;

private Object mut;// = new Object();                                                                                                                                        

void lockedFunction()
{
  synchronized(mut)  //I asume this makes does auto mutex = new Mutex(mut) and then mutex.lock()?
    {
      writefln("Whoops");
    } //mutex.unlock();?

	// Also results in segfault:
	// auto mutex = new Mutex(mut);
	// mutex.lock();
	// writefln("Whoops");
	// mutex.unlock();
}

void main()
{
  lockedFunction();
}
