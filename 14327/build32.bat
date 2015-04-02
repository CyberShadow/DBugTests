dmd -c -m32mscoff lib.d
cl test.cpp lib.obj C:\Soft\dmd2d\windows\lib32mscoff\phobos32mscoff.lib  kernel32.lib user32.lib
