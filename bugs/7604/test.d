void foo(){
	int y = 1<<32;
}

//But this goes through:

void bar(){
    int x;
    int y = 1<<32+(x&1);
}
