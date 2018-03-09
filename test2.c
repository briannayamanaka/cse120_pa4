#include "aux.h"
#include "umix.h"
#include "mykernel4.h"

#define NUMYIELDS 5

static int square, cube;  // global variables, shared by threads

void Main ()
{
  int i, t, me; 
  void printSquares (), printCubes (); 

  InitThreads (); 

  me = GetThread (); 
  t = CreateThread (printSquares, me);
  t = CreateThread (printCubes, t); 
  t = CreateThread (printSquares, t); 
  t = CreateThread (printSquares, t); 
  t = CreateThread (printSquares, t); 
  t = CreateThread (printSquares, t); 
  t = CreateThread (printSquares, t); 

  for (i = 0; i < NUMYIELDS; i++) {
    YieldThread (t);
    Printf ("T%d: square = %d, cube = %d\n", me, square, cube);
  }

  ExitThread (); 
}

void printSquares (t) 
  int t;        // thread to yield to
{
  int i;

  for (i = 0; i < NUMYIELDS; i++) {
    square = i * i;
    Printf ("T%d: %d squared = %d\n", GetThread (), i, square);
    YieldThread (t);
  }
}

void printCubes (t) 
  int t;        // thread to yield to
{
  int i;

  for (i = 0; i < NUMYIELDS; i++) {
    cube = i * i * i;
    Printf ("T%d: %d cubed = %d\n", GetThread (), i, cube);
    YieldThread (t);
  }
}

