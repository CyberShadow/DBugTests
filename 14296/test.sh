rm -rf src test.lib test.a
mkdir src
touch src/test.d
rdmd --build-only -lib src/test.d
