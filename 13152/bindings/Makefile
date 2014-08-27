DMD=dmd

all:
	@echo 'To make an example:'
	@echo 'make <example>'
	@echo '<example> is one of:'
	@echo 'cursesexa'
	@echo 'fltkexa'
	@echo 'fltk2exa'
	@echo 'gtk2exa'
	@echo 'libxml2exa'
	@echo 'vorbisexa'

cursesexa: test/curses.d
	sh test/curses.sh ${DMD}

fltkexa: test/fltk.d bcd/bind.d
	sh test/fltk.sh ${DMD}

fltk2exa: test/fltk2.d bcd/bind.d
	sh test/fltk2.sh ${DMD}

gtk2exa: test/gtk2.d
	sh test/gtk2.sh ${DMD}

libxml2exa: test/libxml2.d
	sh test/libxml2.sh ${DMD}

vorbisexa: test/vorbis.d
	sh test/vorbis.sh ${DMD}
