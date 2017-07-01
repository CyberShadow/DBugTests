const int[E.max] array;

enum E{
   A = 1,
   B,
   C
}

int main(){
   static if(E.max == 3){
      static if(array.length == 3){
         return 0;
      }
   }
}
