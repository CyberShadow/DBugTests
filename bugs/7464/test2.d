struct S {
   static if(hasIndirections!(typeof(this))) {}
}

template hasIndirections(T)
{
   enum hasIndirections = hasIndirectionsImpl!(typeof(T.init.tupleof));
}

template hasIndirectionsImpl(T...)
{
   static if (!T.length)
   {
       enum hasIndirectionsImpl = false;
   }
   else
   {
       enum hasIndirectionsImpl = true;
   }
}
