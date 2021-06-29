
#include "coroutines.h"

double coroutine_smvprod(double t)
{
  static double time_spent_smvprod = 0;

  if(t >= 0)
  {
    time_spent_smvprod += t;
  }
  return time_spent_smvprod;
}


double coroutine_smvprod_alone(double t)
{
  static double time_spent_smvprod_alone = 0;

  if(t >= 0)
  {
    time_spent_smvprod_alone += t;
  }
  return time_spent_smvprod_alone;
}


double coroutine_gmres(double t)
{
  static double time_spent_gmres = 0;

  if(t >= 0)
  {
    time_spent_gmres += t;
  }
  return time_spent_gmres;
}


double coroutine_norm(double t)
{
  static double time_spent_norm = 0;

  if(t >= 0)
  {
    time_spent_norm += t;
  }
  return time_spent_norm;
}
