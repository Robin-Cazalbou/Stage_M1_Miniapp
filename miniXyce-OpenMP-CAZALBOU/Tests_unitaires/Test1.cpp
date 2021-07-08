
#include <iostream>
#include <vector>
#include <cassert>
#include <omp.h>



void scal_prod_OMP(std::vector<double> const& u1, std::vector<double> const& u2, double& res)
{
	assert( u1.size() == u2.size() );

	#pragma omp single
	{
		#pragma omp atomic write
		res = 0.0;
	}

	#pragma omp for reduction(+:res)
	for(unsigned int i = 0; i<u1.size(); i++)
	{
		res += u1[i]*u2[i];
	}
}



int main()
{
    std::vector<double> u1 = {6.478, -2.4, -71.12};
    std::vector<double> u2 = {0.01, 100, 3.33};

    double res = 4.13;

    // Calcul :
    #pragma omp parallel shared(res) num_threads(4)
    {
			std::cout << "Coucou de T" << omp_get_thread_num() << std::endl;
      scal_prod_OMP(u1, u2, res);
    }

    std::cout << "res = " << res << std::endl << "attendu : " << -476.76482 << std::endl;

    return 0;
}
