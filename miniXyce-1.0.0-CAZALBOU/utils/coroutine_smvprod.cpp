
#include "coroutine_smvprod.h"

double coroutine_smvprod(double t)
{
  static double time_spent = 0;

  if(t >= 0) // mode écriture
  {
    time_spent += t;
  }
  return time_spent;
}
