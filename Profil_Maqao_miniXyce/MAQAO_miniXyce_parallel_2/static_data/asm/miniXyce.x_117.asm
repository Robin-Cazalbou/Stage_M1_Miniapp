0x11834:::0::Insn: MOVUPD	(%RAX),%XMM14::
0x11839:::0::Insn: MOVUPD	(%RDX),%XMM1::
0x1183d:::0::Insn: SUB	$0x40,%RAX::
0x11841:::0::Insn: ADD	$0x40,%RDX::
0x11845:::0::Insn: MOVUPD	0x30(%RAX),%XMM6::
0x1184a:::0::Insn: MOVUPD	-0x30(%RDX),%XMM4::
0x1184f:::0::Insn: SHUFPD	$0x1,%XMM14,%XMM14::
0x11855:::0::Insn: MULPD	%XMM1,%XMM14::
0x1185a:::0::Insn: MOVUPD	0x20(%RAX),%XMM9::
0x11860:::0::Insn: MOVUPD	-0x20(%RDX),%XMM7::
0x11865:::0::Insn: SHUFPD	$0x1,%XMM6,%XMM6::
0x1186a:::0::Insn: MULPD	%XMM4,%XMM6::
0x1186e:::0::Insn: MOVUPD	-0x10(%RDX),%XMM13::
0x11874:::0::Insn: SHUFPD	$0x1,%XMM9,%XMM9::
0x1187a:::0::Insn: MULPD	%XMM7,%XMM9::
0x1187f:::0::Insn: ADDSD	%XMM14,%XMM0::
0x11884:::0::Insn: UNPCKHPD	%XMM14,%XMM14::
0x11889:::0::Insn: ADDSD	%XMM14,%XMM0::
0x1188e:::0::Insn: ADDSD	%XMM6,%XMM0::
0x11892:::0::Insn: UNPCKHPD	%XMM6,%XMM6::
0x11896:::0::Insn: MOVAPD	%XMM6,%XMM3::
0x1189a:::0::Insn: ADDSD	%XMM0,%XMM3::
0x1189e:::0::Insn: MOVUPD	0x10(%RAX),%XMM0::
0x118a3:::0::Insn: SHUFPD	$0x1,%XMM0,%XMM0::
0x118a8:::0::Insn: MULPD	%XMM13,%XMM0::
0x118ad:::0::Insn: ADDSD	%XMM9,%XMM3::
0x118b2:::0::Insn: UNPCKHPD	%XMM9,%XMM9::
0x118b7:::0::Insn: MOVAPD	%XMM9,%XMM11::
0x118bc:::0::Insn: ADDSD	%XMM3,%XMM11::
0x118c1:::0::Insn: MOVAPD	%XMM0,%XMM14::
0x118c6:::0::Insn: UNPCKHPD	%XMM0,%XMM0::
0x118ca:::0::Insn: ADDSD	%XMM11,%XMM14::
0x118cf:::0::Insn: ADDSD	%XMM14,%XMM0::
0x118d4:::0::Insn: CMP	%R11,%RAX::
0x118d7:::0::Insn: JNE	11834 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x24c4>::
