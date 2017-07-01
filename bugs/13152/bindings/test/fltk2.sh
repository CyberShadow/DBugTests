#!/bin/bash
export CXXFLAGS="$CXXFLAGS `fltk2-config --cxxflags`"

if [ ! -e fltk2.a ]
then
        for i in bcd/fltk2/*.cc
        do
                g++ $CXXFLAGS -c ${i} -o ${i}.o || exit 1
        done
        
        for i in bcd/fltk2/*.d
        do
                $1 -c ${i} -of${i}.o || exit 1
        done
        
        ar rc fltk2.a bcd/fltk2/*.o
        ranlib fltk2.a
        rm -f bcd/fltk2/*.o
fi

for i in `fltk2-config --ldflags`
do
        export DAFLAGS="$DAFLAGS -L$i"
done

echo $1 test/fltk2.d bcd/bind.d fltk2.a $DAFLAGS -offltk2exa
$1 test/fltk2.d bcd/bind.d fltk2.a $DAFLAGS -offltk2exa
