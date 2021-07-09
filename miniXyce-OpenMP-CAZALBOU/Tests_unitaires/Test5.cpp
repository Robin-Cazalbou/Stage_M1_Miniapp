
#include <iostream>
#include <vector>
#include <cmath>
#include <cassert>
#include <omp.h>


double givens_rotations_applied(std::vector<double>& col_H, std::vector<double>& g, std::vector<double>& givens_cosines, std::vector<double>& givens_sines, int const& iter)
{
	// Some asserts over the parameters to protect the execution
	assert( col_H.size() == (unsigned)(iter+1) );
	assert( (unsigned)(iter+1) <= g.size() );
	assert( (unsigned)iter <= givens_cosines.size() );
	assert( (unsigned)iter <= givens_sines.size() );
	assert( givens_cosines.size() == givens_sines.size() );
	assert( givens_cosines.size()+1 == g.size() );

	// -------- Givens rotations on H --------
	// Rho and Sigma represent the before-last and last values of col_H
	// but with the point of view of the Givens rotation
	// In other words, rho will run through col_H[0], col_H[1], ..., col_H[iter-1]
	// and sigma through col_H[1], col_H[2], ..., col_H[iter]
	double rho, sigma;
	// Apply all the previous Givens rotations
	// (when iter = 1, no previous Givens rotations are already stored,
	// so this loop isn't performed)
	for(int i = 0; i<iter-1; i++)
	{
		// Take the current values of rho and sigma
		rho = col_H[i];
		sigma = col_H[i+1];
		// Apply a Givens rotation
		col_H[i] = givens_cosines[i]*rho + givens_sines[i]*sigma;
		col_H[i+1] = -givens_sines[i]*rho + givens_cosines[i]*sigma;
	}
	// Take the last values of rho and sigma
	rho = col_H[iter-1];
	sigma = col_H[iter];
	// Compute the new Givens rotation
	// r is defined as : r := sqrt(rho^2 + sigma^2)
	double r = std::sqrt(rho*rho + sigma*sigma);
	// c_i := rho/r , s_i := sigma/r
	givens_cosines[iter-1] = rho/r;
	givens_sines[iter-1] = sigma/r;
	// Apply this new rotation
	col_H[iter-1] = givens_cosines[iter-1]*rho + givens_sines[iter-1]*sigma;
	col_H[iter] = 0.0; // optionnal
	// ---------------------------------------

	// -------- Givens rotations on g --------
	g[iter] = -givens_sines[iter-1]*g[iter-1];
	g[iter-1] = givens_cosines[iter-1]*g[iter-1];
	// ---------------------------------------

	return std::abs(g[iter]);
}


int main()
{
    double garbage = 42.314;
    int iter = 1;
    std::vector<double> R = {1.0, 2.0};
    std::vector<double> g = {4.0, garbage};
    std::vector<double> cosines(1, garbage), sines(1, garbage);

    #pragma omp parallel shared(R, g, cosines, sines) firstprivate(iter) num_threads(4)
    {
        #pragma omp single
        {
            givens_rotations_applied(R, g, cosines, sines, iter);
        }
    }

    for(auto& val : R)
    {
        std::cout << val << " ";
    }
    std::cout << std::endl;
    std::cout << "Attendu : R=(" << std::sqrt(5) << "," << 0 << ")^t" << std::endl;

    for(auto& val : g)
    {
        std::cout << val << " ";
    }
    std::cout << std::endl;
    std::cout << "Attendu : g=(" << 4.0/std::sqrt(5) << "," << -8.0/std::sqrt(5) << ")^t" << std::endl << std::endl;

    return 0;
}
