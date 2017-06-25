#!/bin/sh
dmd -c -offirst.o A.d B.d
dmd -c -ofsecond.o C.d D.d
dmd -main E.d first.o second.o
