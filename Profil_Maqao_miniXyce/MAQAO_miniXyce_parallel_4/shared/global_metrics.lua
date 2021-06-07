_report = {
  metrics = {
    GFlops = "Not Implemented Yet",
    iterations_count = "Not Available",
    compilation_flags = "",
    nb_loops_80_if_L1 = "Not Available",
    loops_time = 1.43,
    speedup_if_fp_vect = "1.00",
    speedup_if_perfect_MPI_OMP_PTHREAD_LOAD_DISTRIBUTION = "26.36",
    speedup_if_perfect_MPI_OMP_PTHREAD = "19.01",
    speedup_if_L1 = "Not Available",
    GBs = "Not Implemented Yet",
    nb_loops_80_if_fully_vect = 4,
    experiment_type = "MPI; ",
    nb_loops_80_if_clean = 1,
    speedup_if_fully_vectorised = "1.01",
    nb_loops_80_if_fp_vect = 1,
    flow_complexity = "1.00",
    speedup_if_clean = "1.00",
    innerloops_time = 0.88,
    array_access_efficiency = "16.67",
    profiled_time = 100.53,
    number_processes = 4,
    crest_performance = "Not Implemented Yet",
    nb_threads = 4,
    application_time = 100.53,
    compilation_options = "Not Available",
    user_time = 1.56,
  },
  help = {
    GFlops = "<TBD>.\n",
    iterations_count = "Optimistic speedup available by increasing the number of iterations in loops. Having low iteration count loops can decrease\nperformances.\nLower is better.",
    nb_loops_80_if_L1 = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    loops_time = "Percentage of the application time spent in loops. It represents 1.44 seconds.",
    speedup_if_fp_vect = "Optimistic speedup if all floating point instructions are vectorized in all analyzed loops. Memory instructions are not considered as vectorized.\nLower is better.",
    speedup_if_perfect_MPI_OMP_PTHREAD_LOAD_DISTRIBUTION = "Optimistic speedup if OpenMP, MPI and Pthread runtimes are perfect and the load distribution if perfect.\nLower is better.\nThis metric presents an estimation of the speed-up at application level if most common parallel bottelnecks are perfect.\nspeedup = MAX (time) / AVG (time without OpenMP, MPI and Pthread)",
    speedup_if_perfect_MPI_OMP_PTHREAD = "Optimistic speedup if OpenMP, MPI and Pthread runtimes are perfect.\nLower is better.\nThis metric presents an estimation of the speed-up at application level if the MPI/OpenMP/Pthread behaviour is perfect.\nspeedup = MAX (time) / MAX (time without OpenMP, MPI and Pthread)",
    speedup_if_L1 = "Optimistic speedup if all memory accesses are located in the L1 cache for all analyzed loops.\nLower is better.",
    GBs = "<TBD>.\n",
    nb_loops_80_if_fully_vect = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    nb_loops_80_if_clean = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    speedup_if_fully_vectorised = "Optimistic speedup if all instructions are vectorized in all analyzed loops.\nLower is better.",
    nb_loops_80_if_fp_vect = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    flow_complexity = "Optimistic speedup available by reducing the number of paths in loops. Having multiple paths in a loop can prevent\nthe compiler to vectorize the code, decreasing performances. The metric provides an estimation of a global speedup that\ncan be achieved if all loops with more than two paths were fully vectorized.\nLower is better.",
    speedup_if_clean = "Optimistic speedup if all instructions performing addresses computations and scalar integer computations have been deleted. \nLower is better.",
    innerloops_time = "Percentage of the application time spent in innermost loops. It represents 0.88 seconds.",
    array_access_efficiency = "Processor friendly data layout. Accessing contiguous data is faster.\nHigher is better.",
    profiled_time = "Application profiling duration in seconds",
    crest_performance = "<TBD>.\n",
    application_time = "Time spent by the application in seconds",
    compilation_options = "Basic options to use with the compiler to have good performance.",
    user_time = "Percentage of the application time spent in user code (meaning the time spent in the binary and external libraries specified in custom_categories).",
  },
  colors = {
    iterations_count = "00FF3333",
    nb_loops_80_if_L1 = "00FF3333",
    speedup_if_fp_vect = "007FFF00",
    speedup_if_perfect_MPI_OMP_PTHREAD_LOAD_DISTRIBUTION = "00FF950E",
    speedup_if_perfect_MPI_OMP_PTHREAD = "00FF950E",
    speedup_if_L1 = "00FF3333",
    speedup_if_fully_vectorised = "007FFF00",
    flow_complexity = "007FFF00",
    speedup_if_clean = "007FFF00",
    array_access_efficiency = "00FF3333",
    compilation_options = "00FF3333",
  },
}
