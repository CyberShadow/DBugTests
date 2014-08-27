del *.obj
set PATH=C:\Downloads\!dmd\dmd.2.064.2\dmd2\windows\bin;%PATH%
dmd
dmd -c A.d
dmd -c B.d
dmd -c C.d
dmd -c D.d
dmd -c E.d
dmd A.obj B.obj C.obj D.obj E.obj