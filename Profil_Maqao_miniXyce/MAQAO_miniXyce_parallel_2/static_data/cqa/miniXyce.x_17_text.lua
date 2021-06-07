_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - MOVUPD: 16 occurrences\n - MOVUPS: 16 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 32 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "16 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 32 FP arithmetical operations:\n - 16: addition or subtraction\n - 16: divide\nThe binary loop is loading 256 bytes (32 double precision FP elements).\nThe binary loop is storing 256 bytes (32 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.06 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 6f0a\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------\nMOVUPD (%R10,%RDX,1),%XMM3      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x10(%R10,%RDX,1),%XMM5  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x20(%R10,%RDX,1),%XMM9  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x30(%R10,%RDX,1),%XMM11 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nDIVPD %XMM8,%XMM3               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPD 0x40(%R10,%RDX,1),%XMM13 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x50(%R10,%RDX,1),%XMM15 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x60(%R10,%RDX,1),%XMM0  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x70(%R10,%RDX,1),%XMM1  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nDIVPD %XMM8,%XMM5               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM3,(%R10,%RDX,1)      | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD (%RCX,%RDX,1),%XMM4      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM4,%XMM3               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM3,(%R10,%RDX,1)      | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM9               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM5,0x10(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x10(%RCX,%RDX,1),%XMM6  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM6,%XMM5               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM5,0x10(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM11              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM9,0x20(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x20(%RCX,%RDX,1),%XMM10 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM10,%XMM9              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM9,0x20(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM13              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM11,0x30(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x30(%RCX,%RDX,1),%XMM12 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM12,%XMM11             | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM11,0x30(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM15              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM13,0x40(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x40(%RCX,%RDX,1),%XMM14 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM14,%XMM13             | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM13,0x40(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM15,0x50(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x50(%RCX,%RDX,1),%XMM2  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM2,%XMM15              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM15,0x50(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM1               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM0,0x60(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x60(%RCX,%RDX,1),%XMM7  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM7,%XMM0               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM0,0x60(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPS %XMM1,0x70(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x70(%RCX,%RDX,1),%XMM3  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM3,%XMM1               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM1,0x70(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nSUB $-0x80,%RDX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RDX,%R11                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 6f0a <main+0x1b6a>          | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 51\nnb uops            : 50\nloop length        : 288\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 16\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 12.50 cycles\nfront end            : 12.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4    | P5   | P6   | P7\n------------------------------------------------------------------\nuops   | 8.00 | 8.00 | 10.67 | 10.67 | 16.00 | 1.00 | 1.00 | 10.67\ncycles | 8.00 | 8.00 | 10.67 | 10.67 | 16.00 | 1.00 | 1.00 | 10.67\n\nCycles executing div or sqrt instructions: 64.00-112.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.50\nDispatch  : 16.00\nDIV/SQRT  : 64.00-112.00\nData deps.: 1.00\nOverall L1: 64.00-112.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : 100%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 100%\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : 50%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 112.00 cycles. At this rate:\n - 3% of peak load performance is reached (2.29 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 7% of peak store performance is reached (2.29 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "1% of peak computational performance is used (0.29 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using only 128 out of 256 bits (SSE/AVX-128 instructions on AVX/AVX2 processors).\n",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n  * If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Check whether you really need double precision. If not, switch to single precision to speedup execution\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 112.00 to 16.00 cycles (7.00x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - MOVUPD: 16 occurrences\n - MOVUPS: 16 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 32 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "16 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 32 FP arithmetical operations:\n - 16: addition or subtraction\n - 16: divide\nThe binary loop is loading 256 bytes (32 double precision FP elements).\nThe binary loop is storing 256 bytes (32 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.06 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 6f0a\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------\nMOVUPD (%R10,%RDX,1),%XMM3      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x10(%R10,%RDX,1),%XMM5  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x20(%R10,%RDX,1),%XMM9  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x30(%R10,%RDX,1),%XMM11 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nDIVPD %XMM8,%XMM3               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPD 0x40(%R10,%RDX,1),%XMM13 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x50(%R10,%RDX,1),%XMM15 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x60(%R10,%RDX,1),%XMM0  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nMOVUPD 0x70(%R10,%RDX,1),%XMM1  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nDIVPD %XMM8,%XMM5               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM3,(%R10,%RDX,1)      | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD (%RCX,%RDX,1),%XMM4      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM4,%XMM3               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM3,(%R10,%RDX,1)      | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM9               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM5,0x10(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x10(%RCX,%RDX,1),%XMM6  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM6,%XMM5               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM5,0x10(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM11              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM9,0x20(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x20(%RCX,%RDX,1),%XMM10 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM10,%XMM9              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM9,0x20(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM13              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM11,0x30(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x30(%RCX,%RDX,1),%XMM12 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM12,%XMM11             | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM11,0x30(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM15              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM13,0x40(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x40(%RCX,%RDX,1),%XMM14 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM14,%XMM13             | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM13,0x40(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM15,0x50(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x50(%RCX,%RDX,1),%XMM2  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM2,%XMM15              | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM15,0x50(%R10,%RDX,1) | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nDIVPD %XMM8,%XMM1               | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 10-20   | 8-14\nMOVUPS %XMM0,0x60(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x60(%RCX,%RDX,1),%XMM7  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM7,%XMM0               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM0,0x60(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPS %XMM1,0x70(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOVUPD 0x70(%RCX,%RDX,1),%XMM3  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3       | 0.50\nADDPD %XMM3,%XMM1               | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 3       | 1\nMOVUPS %XMM1,0x70(%R10,%RDX,1)  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nSUB $-0x80,%RDX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RDX,%R11                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 6f0a <main+0x1b6a>          | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 51\nnb uops            : 50\nloop length        : 288\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 16\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 12.50 cycles\nfront end            : 12.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4    | P5   | P6   | P7\n------------------------------------------------------------------\nuops   | 8.00 | 8.00 | 10.67 | 10.67 | 16.00 | 1.00 | 1.00 | 10.67\ncycles | 8.00 | 8.00 | 10.67 | 10.67 | 16.00 | 1.00 | 1.00 | 10.67\n\nCycles executing div or sqrt instructions: 64.00-112.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.50\nDispatch  : 16.00\nDIV/SQRT  : 64.00-112.00\nData deps.: 1.00\nOverall L1: 64.00-112.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : 100%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 100%\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : 50%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 112.00 cycles. At this rate:\n - 3% of peak load performance is reached (2.29 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 7% of peak store performance is reached (2.29 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "1% of peak computational performance is used (0.29 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using only 128 out of 256 bits (SSE/AVX-128 instructions on AVX/AVX2 processors).\n",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n  * If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Check whether you really need double precision. If not, switch to single precision to speedup execution\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 112.00 to 16.00 cycles (7.00x speedup).\n",
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
