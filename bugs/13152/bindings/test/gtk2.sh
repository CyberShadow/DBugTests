#!/bin/bash
if [ ! -e gtk2.a ]
then
        for i in bcd/atk/*.d bcd/cairo/*.d bcd/glib2/*.d bcd/gdk/*.d bcd/gtk2/*.d bcd/pango/*.d
        do
                $1 -c ${i} -of${i}.o || exit 1
        done
        
        ar rc gtk2.a bcd/atk/*.o bcd/cairo/*.o bcd/glib2/*.o bcd/gdk/*.o bcd/gtk2/*.o bcd/pango/*.o
        ranlib gtk2.a
        rm -f bcd/atk/*.o bcd/cairo/*.o bcd/glib2/*.o bcd/gdk/*.o bcd/gtk2/*.o bcd/pango/*.o
fi

for i in `pkg-config --libs gtk+-2.0`
do
        export DAFLAGS="$DAFLAGS -L$i"
done

echo $1 test/gtk2.d gtk2.a $DAFLAGS -ofgtk2exa
$1 test/gtk2.d gtk2.a $DAFLAGS -ofgtk2exa
