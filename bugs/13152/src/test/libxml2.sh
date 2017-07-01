#!/bin/bash
export CFLAGS="$CFLAGS `pkg-config --cflags libxml-2.0`"

for i in `pkg-config --libs libxml-2.0`
do
        export DAFLAGS="$DAFLAGS -L$i"
done

echo $1 test/libxml2.d bcd/bind.d $DAFLAGS -oflibxml2exa
$1 test/libxml2.d bcd/bind.d $DAFLAGS -oflibxml2exa
