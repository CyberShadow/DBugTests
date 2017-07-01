#!/bin/bash
export DAFLAGS=-L-lcurses

echo $1 test/curses.d bcd/bind.d $DAFLAGS -ofcursesxa
$1 test/curses.d bcd/bind.d $DAFLAGS -ofcursesxa
