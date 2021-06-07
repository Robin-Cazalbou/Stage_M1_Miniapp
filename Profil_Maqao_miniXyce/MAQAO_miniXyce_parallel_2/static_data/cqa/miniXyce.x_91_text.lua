_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CMOVE: 8 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = " - Irregular (variable stride) or indirect: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 96 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: e142\n\nInstruction                                                                                                   | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJNE e142 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x112> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 40\nnb uops            : 47\nloop length        : 152\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 11.75 cycles\nfront end            : 11.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 9.75 | 9.75 | 8.00 | 8.00 | 0.00 | 9.75 | 9.75 | 0.00\ncycles | 9.75 | 9.75 | 8.00 | 8.00 | 0.00 | 9.75 | 9.75 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 16.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 11.75\nDispatch  : 9.75\nData deps.: 16.00\nOverall L1: 16.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 16%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 16%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 16.00 cycles. At this rate:\n - 9% of peak load performance is reached (6.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 16% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 16.00 to 2.35 cycles (6.81x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CMOVE: 8 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = " - Irregular (variable stride) or indirect: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 96 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: e142\n\nInstruction                                                                                                   | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJE e1e0 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x1b0>  | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\nCMP %EBP,0x10(%R12)                                                                                           | 1     | 0.25 | 0.25 | 0.50 | 0.50 | 0  | 0.25 | 0.25 | 0  | 1       | 0.50\nMOV (%R12),%R12                                                                                               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 2       | 0.50\nCMOVE %R8D,%EDI                                                                                               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 0.50 | 0.50 | 0  | 2       | 0.50\nCMP %R12,%R15                                                                                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJNE e142 <_ZN15mX_matrix_utils32distributed_sparse_matrix_add_toEPNS_25distributed_sparse_matrixEiidii+0x112> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 40\nnb uops            : 47\nloop length        : 152\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 11.75 cycles\nfront end            : 11.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 9.75 | 9.75 | 8.00 | 8.00 | 0.00 | 9.75 | 9.75 | 0.00\ncycles | 9.75 | 9.75 | 8.00 | 8.00 | 0.00 | 9.75 | 9.75 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 16.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 11.75\nDispatch  : 9.75\nData deps.: 16.00\nOverall L1: 16.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 16%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 16%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 16.00 cycles. At this rate:\n - 9% of peak load performance is reached (6.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 16% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 16.00 to 2.35 cycles (6.81x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}
