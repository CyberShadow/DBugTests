dmd -c -unittest foo
C:\cygwin\bin\strings foo.obj | C:\cygwin\bin\grep MonoTimeImpl
if errorlevel 1 exit 0
exit 1
