% Copyright (C) 2012 Mark Chen

% Permission is granted to make and distribute verbatim copies of this
% document provided that the copyright notice and this permission notice
% are preserved on all copies.

% Permission is granted to copy and distribute modified versions of this
% document under the conditions for verbatim copying, provided that the
% entire resulting derived work is given a different name and distributed
% under the terms of a permission notice identical to this one.

\datethis


% a quick fix for cweb version 3.6 
@s not_eq normal

% C++ and CppUnit type, treat the following names as types.

@s string int 
@s std int
@s CppUnit int
@s TestCase int
@s TestSuite int
@s TextTestRunner int
@s TestResult int
@s TestResultCollector int
@s TestRunner int
@s CompilerOutputter int
@s BriefTestProgressListener int

@ Roman number converter.

This program will be written in a {\tt TDD} manner. {\tt TDD} is the acronyms
of Test Driven Development. By using {\tt TDD}, it makes code testable.

I would use {\tt cppunit} here which I used before, but the coding style is for
integration test, not {\tt TDD} driven. 

Below is the program structure.
@c
@<includes@>@/
@<implementation@>@/
@<tests@>@/
@<main@>@/


@ Filling test code in main. That is the normal way to use {\tt CppUnit}.
@<main@>=
@<qa\_roman\_tests@>@/
int main(int argc, char* argv[])
{
    CppUnit::TestResult testresult;
    CppUnit::TestResultCollector collectedresults;

    testresult.addListener(&collectedresults);
    CppUnit::BriefTestProgressListener progress;
    testresult.addListener (&progress);

    CppUnit::TestRunner	runner;
    runner.addTest (qa_roman_tests::suite ());

    runner.run(testresult); 
    CppUnit::CompilerOutputter compileroutputter (&collectedresults, std::cerr);
    compileroutputter.write ();
    return collectedresults.wasSuccessful () ? 0 : 1; 
}

@ @<qa\_roman...@>+=
class qa_roman_tests {
public:
	static CppUnit::TestSuite* suite();
};
CppUnit::TestSuite * qa_roman_tests::suite()
{
	CppUnit::TextTestRunner runner;
	CppUnit::TestSuite *s = new CppUnit::TestSuite("qa_roman_tests");
	s->addTest(CQA_RomanTest::suite());	
	return s;

}

@ Now we declare test class.

I am not adding all test cases once, but slowly add them one by one. 

Finally it looks like this.

@<tests@>+=
class CQA_RomanTest : public CppUnit::TestCase {
    CPPUNIT_TEST_SUITE(CQA_RomanTest);
    CPPUNIT_TEST (t1);
    CPPUNIT_TEST (t2);
    CPPUNIT_TEST (t3);
    CPPUNIT_TEST (t4);
    CPPUNIT_TEST (t5);
    CPPUNIT_TEST (t6);
    CPPUNIT_TEST (t7);
    CPPUNIT_TEST (t8);
    CPPUNIT_TEST (t9);
    CPPUNIT_TEST (t10);
    CPPUNIT_TEST (t11);
    CPPUNIT_TEST (t12);
    CPPUNIT_TEST (t13);
    CPPUNIT_TEST (t14);
    CPPUNIT_TEST (t15);
    CPPUNIT_TEST (t16);
    CPPUNIT_TEST (t17);
    CPPUNIT_TEST (t18);
    CPPUNIT_TEST (t19);
    CPPUNIT_TEST (t20);
    CPPUNIT_TEST (t21);
    CPPUNIT_TEST (t22);
    CPPUNIT_TEST_SUITE_END();

    private:
    void t1();
    void t2();
    void t3();
    void t4();
    void t5();
    void t6();
    void t7();
    void t8();
    void t9();
    void t10();
    void t11();
    void t12();
    void t13();
    void t14();
    void t15();
    void t16();
    void t17();
    void t18();
    void t19();
    void t20();
    void t21();
    void t22();
};
	
@ The first test case. That's given ``I'', it returns 1.
@<test...@>+=
void CQA_RomanTest::t1()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "I";
    int r = roman_cvt(1, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}
@ My second test case will be check ``III'' to be 3. I bypass 2.
@<test...@>+=
void CQA_RomanTest::t2()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "III";
    int r = roman_cvt(3, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}
@ In {\tt TDD}, we want to go slowly.  Test case for number 4.
@<test...@>+=
void CQA_RomanTest::t3()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "IV";
    int r = roman_cvt(4, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}
@ Test case for number 5.
@<test...@>+=
void CQA_RomanTest::t4()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "V";
    int r = roman_cvt(5, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 8.
@<test...@>+=
void CQA_RomanTest::t5()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "VIII";
    int r = roman_cvt(8, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ I have to refactor the code. In this case, I rewrite the code in implementation. 

Test case for number 9.
@<test...@>+=
void CQA_RomanTest::t6()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "IX";
    int r = roman_cvt(9, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ After Refactor. I go slowly.

Test case for number 10.
@<test...@>+=
void CQA_RomanTest::t7()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "X";
    int r = roman_cvt(10, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ And do a jump to see if it still works.

Test case for number 18.
@<test...@>+=
void CQA_RomanTest::t8()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XVIII";
    int r = roman_cvt(18, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 19.
@<test...@>+=
void CQA_RomanTest::t9()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XIX";
    int r = roman_cvt(19, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 23.
@<test...@>+=
void CQA_RomanTest::t10()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XXIII";
    int r = roman_cvt(23, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 39.
@<test...@>+=
void CQA_RomanTest::t11()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XXXIX";
    int r = roman_cvt(39, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ I need to refactor the algorithm to represent both 40 and 49. 

I am experiencing the hardest time here. Or it is this time to solve the problem.

Test case for number 40.
@<test...@>+=
void CQA_RomanTest::t12()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XL";
    int r = roman_cvt(40, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 49.
@<test...@>+=
void CQA_RomanTest::t13()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XLIX";
    int r = roman_cvt(49, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}


@ Test case for number 54.
@<test...@>+=
void CQA_RomanTest::t14()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "LIV";
    int r = roman_cvt(54, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 69.
@<test...@>+=
void CQA_RomanTest::t15()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "LXIX";
    int r = roman_cvt(69, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 90.
@<test...@>+=
void CQA_RomanTest::t16()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XC";
    int r = roman_cvt(90, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 93.
@<test...@>+=
void CQA_RomanTest::t17()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XCIII";
    int r = roman_cvt(93, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 99.
@<test...@>+=
void CQA_RomanTest::t18()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "XCIX";
    int r = roman_cvt(99, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 1990.
@<test...@>+=
void CQA_RomanTest::t19()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "MCMXC";
    int r = roman_cvt(1990, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Test case for number 2008.
@<test...@>+=
void CQA_RomanTest::t20()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "MMVIII";
    int r = roman_cvt(2008, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ From Don Knuth, ``MIX'' represents 1009, let's see.
@<test...@>+=
void CQA_RomanTest::t21()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "MIX";
    int r = roman_cvt(1009, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}
@ And ``MMIX'' will be 2009.

@<test...@>+=
void CQA_RomanTest::t22()
{
    const size_t smax = 80;
    char s[smax];
    std::string sref = "MMIX";
    int r = roman_cvt(2009, s, smax);
    CPPUNIT_ASSERT_EQUAL((int)0, stricmp(s, sref.c_str()));
    CPPUNIT_ASSERT(!r);
}

@ Implementation.

Define the mapping table. I am not going extend the table to represent {\=V}, or 5000 etc.
@d RM_TABLE_SIZE 7
@<imple...@>+=

typedef struct {
    int i;
    char c;
} rm_table_item_t;

const static rm_table_item_t rm_table[RM_TABLE_SIZE] = { @/
    {1, 'I'}, @/
    {5, 'V'}, @/
    {10, 'X'},@/
    {50, 'L'},@/
    {100, 'C'},@/
    {500, 'D'},@/
    {1000, 'M'}@/
};


@ @<imple...@>+=
int roman_cvt(const int rm_num, char* s, size_t smax)
{
    int num= rm_num;
    int i, j;

    for(i= RM_TABLE_SIZE-1, j=i;(j>=0)&&(num!=0);){
        if(num>=rm_table[j].i){
             @<found j that makes |rm_table[j].i| larger than num@>@;      
             
        }
        else{ // here num less then |rm_table[j].i| 
            if(j>0)  j--;
       }
    }

    *s= 0;
    return 0;
}
@ @<found j that makes |rm_table[j].i| larger than num@>=
{
#if 0
    printf("found: $$%d: %d $$\n", num, rm_table[j].i);
#endif
    @<the best case first@>@;
    if(j+1 == RM_TABLE_SIZE) { /* check the bound */
        *s++= rm_table[j].c;
        num-= rm_table[j].i;
        continue;
    }

    int l = -1;
    int m = rm_table[j].i;
    int n = rm_table[j+1].i;
    if(j>0) l = rm_table[j-1].i;
    @<lesser subtract@>@;
    if(j>0 && l>0) {
        if((n-l) == num) {
            *s++ = rm_table[j-1].c;
            *s++ = rm_table[j+1].c;
            break;
        }
    }
    @<greater add@>@;

    /* if the code goes to here, it would be weird*/
    assert(1==0); 
}

@ @<the best case first@>=
if (num == rm_table[j].i) {
    *s++ = rm_table[j].c;
    break;
}
@ @<lesser subtract@>=
if((n-m) == num){
    *s++ = rm_table[j].c;
    *s++ = rm_table[j+1].c;
    break;
}

@ @<greater add@>=

if(num<n&&num> m){
    if(num> (n-m)&&(n-l)<num){
        if(((j+1)%2 == 0) && (num - (n-l) < l)) {
            *s++= rm_table[j-1].c;
            *s++= rm_table[j+1].c;
            num-= (n-l);
        }
        else {
            *s++= rm_table[j].c;
            *s++= rm_table[j+1].c;
            num-= (n-m);
        }
    }
    else{
        *s++= rm_table[j].c;
        num-= rm_table[j].i;

    }
    continue;
}


@ Final part. But actually it's in the beginning.

@<includes@>+=
#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/TestCase.h>
#include <cppunit/TestSuite.h>
#include <cppunit/TextTestRunner.h>
#include <cppunit/TestResult.h>
#include <cppunit/TestResultCollector.h>
#include <cppunit/CompilerOutputter.h>
#include <cppunit/BriefTestProgressListener.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <assert.h>
class CQA_RomanTest;

@ Index.

