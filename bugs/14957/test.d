enum A = 1;
enum B = C; //Error
static if(A)
    enum C = 0;
enum D = C; //OK
