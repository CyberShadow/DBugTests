#!/bin/bash
if [ ! -e ogg.a ]
then
        for i in bcd/ogg/*.d
        do
                $1 -c ${i} -of${i}.o || exit 1
        done
        
        ar rc ogg.a bcd/ogg/*.o
        ranlib ogg.a
        rm -f bcd/ogg/*.o
fi

if [ ! -e vorbis.a ]
then
        for i in bcd/vorbis/*.d
        do
                $1 -c ${i} -of${i}.o || exit 1
        done
        
        ar rc vorbis.a bcd/vorbis/*.o
        ranlib vorbis.a
        rm -f bcd/vorbis/*.o
fi

for i in `pkg-config --libs vorbis`
do
        export DAFLAGS="$DAFLAGS -L$i"
done

echo $1 test/vorbis.d ogg.a vorbis.a $DAFLAGS -ofvorbisexa
$1 test/vorbis.d ogg.a vorbis.a $DAFLAGS -ofvorbisexa
