_group = {
  {
    group_size = 3,
    pattern = "LLL",
    opcodes = "MOV,MOV,MOV,",
    offsets = "0,24,48,",
    addresses = "0x10575,0x10490,0x10494,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 24,
    accessed_memory_nooverlap = 24,
    accessed_memory_overlap = 0,
    span = 56,
    head = 0,
    unroll_factor = 3,
  },
  {
    group_size = 8,
    pattern = "SSSSSSSS",
    opcodes = "MOVSD,MOVSD,MOVSD,MOVSD,MOVSD,MOVSD,MOVSD,MOVSD,",
    offsets = "160,160,160,160,160,160,160,160,",
    addresses = "0x10588,0x104c4,0x104df,0x104fa,0x10515,0x10539,0x10552,0x1056c,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 64,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 56,
    span = 8,
    head = 0,
    unroll_factor = 8,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x10542,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x10503,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 5,
    pattern = "LLLLL",
    opcodes = "MOV,MOV,MOV,MOV,MOV,",
    offsets = "-120,-96,-72,-48,-24,",
    addresses = "0x1049f,0x104a3,0x104b3,0x104b7,0x104bb,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 40,
    accessed_memory_nooverlap = 40,
    accessed_memory_overlap = 0,
    span = 104,
    head = 0,
    unroll_factor = 5,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x104cd,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 5,
    pattern = "LLLLL",
    opcodes = "MULSD,MULSD,MULSD,MULSD,MULSD,",
    offsets = "0,8,16,24,32,",
    addresses = "0x104ad,0x104d3,0x104ee,0x10509,0x10524,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 40,
    accessed_memory_nooverlap = 40,
    accessed_memory_overlap = 0,
    span = 40,
    head = 0,
    unroll_factor = 5,
  },
  {
    group_size = 2,
    pattern = "LL",
    opcodes = "MULSD,MULSD,",
    offsets = "-24,-16,",
    addresses = "0x10547,0x10561,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 16,
    accessed_memory_nooverlap = 16,
    accessed_memory_overlap = 0,
    span = 16,
    head = 0,
    unroll_factor = 2,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x104e8,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x104a7,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x1055b,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x1051e,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MULSD,",
    offsets = "0,",
    addresses = "0x1057e,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x10578,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
}
