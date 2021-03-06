# Makefile to compile Umix Programming Assignment 4 (pa4) [updated: 1/17/18]

LIBDIR = $(UMIXPUBDIR)/lib
# LIBDIR = $(UMIXROOTDIR)/sys

CC 	= cc 
FLAGS 	= -g -L$(LIBDIR) -lumix4

PA4 =	pa4a pa4b pa4c mytest1 test1 mytest2 test2 mytest3 test3 mytest4 test4 mytest5 test5 mytest6 test6 mytest7 test7 mytest8 test8 mytest9 test9
#TESTS = mytest reftest

pa4:	$(PA4)
#tests: $(TESTS)
mytests: $(MYTESTS)
theirtests: $(THEIRTESTS)

pa4a:	pa4a.c aux.h umix.h
	$(CC) $(FLAGS) -o pa4a pa4a.c

pa4b:	pa4b.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o pa4b pa4b.c mykernel4.o

pa4c:	pa4c.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o pa4c pa4c.c mykernel4.o

mykernel4.o:	mykernel4.c aux.h umix.h mykernel4.h
	$(CC) $(FLAGS) -c mykernel4.c

#mytest: tests.c aux.h umix.h mykernel4.h mykernel4.o
#	$(CC) $(FLAGS) -o $@ tests.c mykernel4.o

#reftest: tests.c aux.h umix.h mykernel4.h mykernel4.o
#	$(CC) $(FLAGS) -DUSE_REFERENCE_KERNEL -o $@ tests.c mykernel4.o


########## test1 ##########
test1: test1.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test1 test1.c mykernel4.o

mytest1: mytest1.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest1 mytest1.c mykernel4.o


########## test2 ##########
test2: test2.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test2 test2.c mykernel4.o

mytest2: mytest2.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest2 mytest2.c mykernel4.o


########## test3 ##########
test3: test3.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test3 test3.c mykernel4.o

mytest3: mytest3.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest3 mytest3.c mykernel4.o

########## test4 ##########
test4: test4.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test4 test4.c mykernel4.o

mytest4: mytest4.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest4 mytest4.c mykernel4.o

########## test5 ##########
test5: test5.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test5 test5.c mykernel4.o

mytest5: mytest5.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest5 mytest5.c mykernel4.o

########## test6 ##########
test6: test6.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test6 test6.c mykernel4.o

mytest6: mytest6.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest6 mytest6.c mykernel4.o


########## test7 ##########
test7: test7.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test7 test7.c mykernel4.o

mytest7: mytest7.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest7 mytest7.c mykernel4.o


########## test8 ##########
test8: test8.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test8 test8.c mykernel4.o

mytest8: mytest8.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest8 mytest8.c mykernel4.o

########## test9 ##########
test9: test9.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o test9 test9.c mykernel4.o

mytest9: mytest9.c aux.h umix.h mykernel4.h mykernel4.o
	$(CC) $(FLAGS) -o mytest9 mytest9.c mykernel4.o

clean:
	rm -f *.o $(PA4) 
