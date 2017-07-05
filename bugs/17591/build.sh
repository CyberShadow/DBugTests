#!/bin/bash
set -eu

lib_F=./libfoo.so
out_F=./main

dmd -of$lib_F -shared -fPIC mylib.d -defaultlib=libphobos2.so
dmd -of$out_F main.d
$out_F