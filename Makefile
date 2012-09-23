# Makefile for compiling under cygwin

# I am assuming that cppunit is located at ./cppunit-cyg directory. Change it
# below for your customization.
CPPUNIT_DIR=./cppunit-cyg

all:doc
	ctangle roman-numericals.w
	cp roman-numericals.c roman-numericals.cpp
	gcc -c -o roman-numericals.o -I$(CPPUNIT_DIR)/include roman-numericals.cpp
	gcc -L$(CPPUNIT_DIR)/.libs -o test.bin roman-numericals.o -lcppunit -lstdc++
clean: 
	rm -rf test.bin *.o roman-numericals.cpp roman-numericals.c 
	rm -rf roman-numericals.pdf roman-numericals.toc  roman-numericals.tex roman-numericals.scn roman-numericals.log roman-numericals.idx

# note: cweave with `-b` will display the banner
doc: roman-numericals.w
	cweave -b $<
	pdftex roman-numericals.tex
