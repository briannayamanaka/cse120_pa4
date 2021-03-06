#include "aux.h"
#include "umix.h"
#include "mykernel4.h"

#define NUMYIELDS 5

static int square, cube;  // global variables, shared by threads

void Main ()
{
  int i, t, me; 
  void printSquares (), printCubes (), doNothing();

  MyInitThreads (); 

  me = MyGetThread (); 
  t = MyCreateThread (doNothing, 1); // 1
  t = MyCreateThread (doNothing, 2); // 2
  t = MyCreateThread (doNothing, 3); // 3


  //main is running in zero, yield to 1 (naturally from one we yield to everyone else in fifo order)
  MyYieldThread(3);
  //all 9 threads should have exited at this point
  //create 3 more on top where the old ones used to be
  t = MyCreateThread (doNothing, 1); // 4
  t = MyCreateThread (doNothing, 2); // 5
  t = MyCreateThread (doNothing, 3); // 6
  MySchedThread();
  t = MyCreateThread (doNothing, 4); // 7
  
  MyYieldThread(7);

  t = MyCreateThread (doNothing, 5); // 8
  t = MyCreateThread (doNothing, 6); // 9
  MySchedThread();
  t = MyCreateThread (doNothing, 7); // 1
  t = MyCreateThread (doNothing, 8); // 2
  
  MyYieldThread(2);

  t = MyCreateThread (doNothing, 6); // 3
  t = MyCreateThread (doNothing, 7); // 4

  MySchedThread();

  t = MyCreateThread (doNothing, 8); // 5
  t = MyCreateThread (doNothing, 9); // 6

  MyYieldThread(5);

  /*t = MyCreateThread (doNothing, 1);
  t = MyCreateThread (doNothing, 2); 
  t = MyCreateThread (doNothing, 3); 
  t = MyCreateThread (doNothing, 4); 
  t = MyCreateThread (doNothing, 5); 
  
  MyYieldThread(1);


  t = MyCreateThread (doNothing, 1);
  t = MyCreateThread (doNothing, 2); 
  t = MyCreateThread (doNothing, 3); 
  t = MyCreateThread (doNothing, 4); 
  t = MyCreateThread (doNothing, 5); 
  t = MyCreateThread (doNothing, 6); 
  t = MyCreateThread (doNothing, 7); 
  t = MyCreateThread (doNothing, 8); 
  t = MyCreateThread (doNothing, 9); 
  MyYieldThread(1);*/

  MyExitThread (); 
}

void printSquares (t) 
  int t;        // thread to yield to
{
  int i;

  for (i = 0; i < NUMYIELDS; i++) {
    square = i * i;
    Printf ("T%d: %d squared = %d\n", MyGetThread (), i, square);
    MyYieldThread (t);
  }
}

void doNothing(x)
  int x;
{
  Printf("\n%d\n",x);
}

void printCubes (t) 
  int t;        // thread to yield to
{
  int i;

  for (i = 0; i < NUMYIELDS; i++) {
    cube = i * i * i;
    Printf ("T%d: %d cubed = %d\n", MyGetThread (), i, cube);
    MyYieldThread (t);
  }
}

