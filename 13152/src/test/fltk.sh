#!/bin/bash
export CXXFLAGS="$CXXFLAGS `fltk-config --cxxflags`"

if [ ! -e fltk.a ]
then
        for i in bcd/fltk/*.cc
        do
                g++ $CXXFLAGS -c ${i} -o ${i}.o || exit 1
        done
        
        for i in bcd/fltk/*.d
        do
                $1 -c ${i} -of${i}.o || exit 1
        done
        
        ar rc fltk.a bcd/fltk/*.o
        ranlib fltk.a
        rm -f bcd/fltk/*.o
fi

for i in `fltk-config --libs --ldflags` `g++ -print-file-name=libstdc++.so`
do
        export DAFLAGS="$DAFLAGS -L$i"
done

echo $1 test/fltk.d bcd/bind.d fltk.a $DAFLAGS -offltkexa
$1 test/fltk.d bcd/bind.d fltk.a $DAFLAGS -offltkexa
