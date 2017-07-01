void setCookie(long x = 1L << 32L, string y = null){
    assert(y.ptr is null);
}
void main(){
    setCookie();
}
