# Makefile for compiling under cygwin

# I am assuming that cppunit is located at ./cppunit-cyg directory. Change it
# below for your customization.
CPPUNIT_DIR=./cppunit-cyg/

all:doc
	ctangle roman_numericals.w
	cp roman_numericals.c roman_numericals.cpp
	gcc -c -o roman_numericals.o -I$(CPPUNIT_DIR)/include roman_numericals.cpp
	gcc -L$(CPPUNIT_DIR)/.libs -o test.bin roman_numericals.o -lcppunit -lstdc++
clean: 
	rm -rf test.bin *.o roman_numericals.cpp roman_numericals.c 
	rm -rf roman_numericals.pdf roman_numericals.toc  roman_numericals.tex roman_numericals.scn roman_numericals.log roman_numericals.idx

# note: cweave with `-b` will display the banner
doc: roman_numericals.w
	cweave -b $<
	pdftex roman_numericals.tex
