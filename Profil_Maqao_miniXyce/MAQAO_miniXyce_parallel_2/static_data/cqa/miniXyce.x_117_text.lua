_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - MOVUPD: 8 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 8 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "8 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n4 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 16 FP arithmetical operations:\n - 8: addition or subtraction\n - 8: multiply\nThe binary loop is loading 128 bytes (16 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 11834\n\nInstruction                                                                                                       | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOVUPD (%RAX),%XMM14                                                                                              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nMOVUPD (%RDX),%XMM1                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSUB $0x40,%RAX                                                                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x40,%RDX                                                                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nMOVUPD 0x30(%RAX),%XMM6                                                                                           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nMOVUPD -0x30(%RDX),%XMM4                                                                                          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM14,%XMM14                                                                                         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM1,%XMM14                                                                                                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nMOVUPD 0x20(%RAX),%XMM9                                                                                           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nMOVUPD -0x20(%RDX),%XMM7                                                                                          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM6,%XMM6                                                                                           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM4,%XMM6                                                                                                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nMOVUPD -0x10(%RDX),%XMM13                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM9,%XMM9                                                                                           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM7,%XMM9                                                                                                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nADDSD %XMM14,%XMM0                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nUNPCKHPD %XMM14,%XMM14                                                                                            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nADDSD %XMM14,%XMM0                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nADDSD %XMM6,%XMM0                                                                                                 | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nUNPCKHPD %XMM6,%XMM6                                                                                              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMOVAPD %XMM6,%XMM3                                                                                                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nADDSD %XMM0,%XMM3                                                                                                 | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nMOVUPD 0x10(%RAX),%XMM0                                                                                           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM0,%XMM0                                                                                           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM13,%XMM0                                                                                                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nADDSD %XMM9,%XMM3                                                                                                 | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nUNPCKHPD %XMM9,%XMM9                                                                                              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMOVAPD %XMM9,%XMM11                                                                                               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nADDSD %XMM3,%XMM11                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nMOVAPD %XMM0,%XMM14                                                                                               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nUNPCKHPD %XMM0,%XMM0                                                                                              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nADDSD %XMM11,%XMM14                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nADDSD %XMM14,%XMM0                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nCMP %R11,%RAX                                                                                                     | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJNE 11834 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x24c4> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 35\nnb uops            : 34\nloop length        : 169\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 10\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 2.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 8.50 cycles\nfront end            : 8.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 4.00 | 8.00 | 4.00 | 4.00 | 0.00 | 8.00 | 3.00 | 0.00\ncycles | 4.00 | 8.00 | 4.00 | 4.00 | 0.00 | 8.00 | 3.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 24.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.50\nDispatch  : 8.00\nData deps.: 24.00\nOverall L1: 24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 61%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 0%\nother  : 63%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 40%\nload   : 50%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 50%\nadd-sub: 25%\nother  : 40%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 8% of peak load performance is reached (5.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
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
          details = "61% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 63% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 40% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 24.00 to 8.74 cycles (2.75x speedup).",
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
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - MOVUPD: 8 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 8 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "8 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n4 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 16 FP arithmetical operations:\n - 8: addition or subtraction\n - 8: multiply\nThe binary loop is loading 128 bytes (16 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 11834\n\nInstruction                                                                                                       | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOVUPD (%RAX),%XMM14                                                                                              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nMOVUPD (%RDX),%XMM1                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSUB $0x40,%RAX                                                                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x40,%RDX                                                                                                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nMOVUPD 0x30(%RAX),%XMM6                                                                                           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nMOVUPD -0x30(%RDX),%XMM4                                                                                          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM14,%XMM14                                                                                         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM1,%XMM14                                                                                                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nMOVUPD 0x20(%RAX),%XMM9                                                                                           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nMOVUPD -0x20(%RDX),%XMM7                                                                                          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM6,%XMM6                                                                                           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM4,%XMM6                                                                                                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nMOVUPD -0x10(%RDX),%XMM13                                                                                         | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM9,%XMM9                                                                                           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM7,%XMM9                                                                                                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nADDSD %XMM14,%XMM0                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nUNPCKHPD %XMM14,%XMM14                                                                                            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nADDSD %XMM14,%XMM0                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nADDSD %XMM6,%XMM0                                                                                                 | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nUNPCKHPD %XMM6,%XMM6                                                                                              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMOVAPD %XMM6,%XMM3                                                                                                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nADDSD %XMM0,%XMM3                                                                                                 | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nMOVUPD 0x10(%RAX),%XMM0                                                                                           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSHUFPD $0x1,%XMM0,%XMM0                                                                                           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMULPD %XMM13,%XMM0                                                                                                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nADDSD %XMM9,%XMM3                                                                                                 | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nUNPCKHPD %XMM9,%XMM9                                                                                              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nMOVAPD %XMM9,%XMM11                                                                                               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nADDSD %XMM3,%XMM11                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nMOVAPD %XMM0,%XMM14                                                                                               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nUNPCKHPD %XMM0,%XMM0                                                                                              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nADDSD %XMM11,%XMM14                                                                                               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nADDSD %XMM14,%XMM0                                                                                                | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nCMP %R11,%RAX                                                                                                     | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJNE 11834 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x24c4> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 35\nnb uops            : 34\nloop length        : 169\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 10\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 2.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 8.50 cycles\nfront end            : 8.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 4.00 | 8.00 | 4.00 | 4.00 | 0.00 | 8.00 | 3.00 | 0.00\ncycles | 4.00 | 8.00 | 4.00 | 4.00 | 0.00 | 8.00 | 3.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 24.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.50\nDispatch  : 8.00\nData deps.: 24.00\nOverall L1: 24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 61%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 0%\nother  : 63%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 40%\nload   : 50%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 50%\nadd-sub: 25%\nother  : 40%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 8% of peak load performance is reached (5.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
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
          details = "61% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 63% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 40% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 24.00 to 8.74 cycles (2.75x speedup).",
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
