import sys

if __name__ == "__main__":
    if (len(sys.argv) < 2):
        sys.exit()
    infile = open(sys.argv[1])
    linect = 0
    for line in infile.readlines():
        linect += 1
    print "There are %d lines" % linect
