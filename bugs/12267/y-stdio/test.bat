@echo off
cp ../program.d program.d
dmd -o- program.d > nul 2> nul
