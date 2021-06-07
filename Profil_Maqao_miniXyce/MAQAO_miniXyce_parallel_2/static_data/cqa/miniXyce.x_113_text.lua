_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "16 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 16 FP arithmetical operations:\n - 8: addition or subtraction\n - 8: multiply\nThe binary loop is loading 64 bytes (8 double precision FP elements).\nThe binary loop is storing 64 bytes (8 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: fc32\n\nInstruction                                                                                                     | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOVSD (%RDI),%XMM14                                                                                             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nADD $0x40,%RDI                                                                                                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMULSD %XMM14,%XMM14                                                                                             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM14,%XMM4                                                                                              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x38(%RDI),%XMM15                                                                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM15,%XMM15                                                                                             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM15,%XMM4                                                                                              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x30(%RDI),%XMM1                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM1,%XMM1                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM1,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x28(%RDI),%XMM0                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM0,%XMM0                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM0,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x20(%RDI),%XMM5                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM5,%XMM5                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM5,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x18(%RDI),%XMM2                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM2,%XMM2                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM2,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x10(%RDI),%XMM6                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM6,%XMM6                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM6,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x8(%RDI),%XMM3                                                                                          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM3,%XMM3                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM3,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nCMP %RDI,%R10                                                                                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE fc32 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x8c2> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 35\nnb uops            : 34\nloop length        : 194\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 9\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 1\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 8.50 cycles\nfront end            : 8.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 8.00 | 8.00 | 5.33 | 5.33 | 8.00 | 1.00 | 1.00 | 5.33\ncycles | 8.00 | 8.00 | 5.33 | 5.33 | 8.00 | 1.00 | 1.00 | 5.33\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 24.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.50\nDispatch  : 8.00\nData deps.: 24.00\nOverall L1: 24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : 0%\nmul    : 0%\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : 25%\nstore  : 25%\nmul    : 25%\nadd-sub: 25%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 4% of peak load performance is reached (2.67 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 8% of peak store performance is reached (2.67 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "4% of peak computational performance is used (0.67 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 24.00 to 6.00 cycles (4.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).\n",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "16 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 16 FP arithmetical operations:\n - 8: addition or subtraction\n - 8: multiply\nThe binary loop is loading 64 bytes (8 double precision FP elements).\nThe binary loop is storing 64 bytes (8 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: fc32\n\nInstruction                                                                                                     | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOVSD (%RDI),%XMM14                                                                                             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nADD $0x40,%RDI                                                                                                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nMULSD %XMM14,%XMM14                                                                                             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM14,%XMM4                                                                                              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x38(%RDI),%XMM15                                                                                        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM15,%XMM15                                                                                             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM15,%XMM4                                                                                              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x30(%RDI),%XMM1                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM1,%XMM1                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM1,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x28(%RDI),%XMM0                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM0,%XMM0                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM0,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x20(%RDI),%XMM5                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM5,%XMM5                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM5,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x18(%RDI),%XMM2                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM2,%XMM2                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM2,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x10(%RDI),%XMM6                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM6,%XMM6                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM6,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVSD -0x8(%RDI),%XMM3                                                                                          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 0       | 0.50\nMULSD %XMM3,%XMM3                                                                                               | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 5       | 0.50\nADDSD %XMM3,%XMM4                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVSD %XMM4,0x1d0(%RSP)                                                                                         | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nCMP %RDI,%R10                                                                                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE fc32 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x8c2> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 35\nnb uops            : 34\nloop length        : 194\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 9\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 1\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 8.50 cycles\nfront end            : 8.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 8.00 | 8.00 | 5.33 | 5.33 | 8.00 | 1.00 | 1.00 | 5.33\ncycles | 8.00 | 8.00 | 5.33 | 5.33 | 8.00 | 1.00 | 1.00 | 5.33\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 24.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.50\nDispatch  : 8.00\nData deps.: 24.00\nOverall L1: 24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : 0%\nmul    : 0%\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : 25%\nstore  : 25%\nmul    : 25%\nadd-sub: 25%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 4% of peak load performance is reached (2.67 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 8% of peak store performance is reached (2.67 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "4% of peak computational performance is used (0.67 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 24.00 to 6.00 cycles (4.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).\n",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}
