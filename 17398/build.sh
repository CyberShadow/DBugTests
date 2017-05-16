#!/bin/bash
set -eu

dmd -c c.d
dmd a.d c.o
