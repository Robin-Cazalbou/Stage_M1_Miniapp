0x11760:::0::Insn: TEST	%R13D,%R13D::
0x11763:::0::Insn: JS	11a8b <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x271b>::
0x11769:::0::Insn: MOV	(%R10),%RCX::
0x1176c:::0::Insn: JE	11a94 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2724>::
0x11772:::0::Insn: LEA	-0x10(%R14),%RSI::
0x11776:::0::Insn: LEA	(%RCX,%R15,1),%RAX::
0x1177a:::0::Insn: PXOR	%XMM0,%XMM0::
0x1177e:::0::Insn: MOV	%R12,%RDX::
0x11781:::0::Insn: SHR	$0x4,%RSI::
0x11785:::0::Insn: MOV	%RAX,%R11::
0x11788:::0::Insn: ADD	$0x1,%RSI::
0x1178c:::0::Insn: SUB	%R14,%R11::
0x1178f:::0::Insn: AND	$0x3,%ESI::
0x11792:::0::Insn: JE	11834 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x24c4>::
0x11798:::0::Insn: CMP	$0x1,%RSI::
0x1179c:::0::Insn: JE	117ff <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x248f>::
0x1179e:::0::Insn: CMP	$0x2,%RSI::
0x117a2:::0::Insn: JE	117d4 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2464>::
0x117a4:::0::Insn: MOVUPD	(%RAX),%XMM1::
0x117a8:::0::Insn: MOVUPD	(%R12),%XMM2::
0x117ae:::0::Insn: PXOR	%XMM4,%XMM4::
0x117b2:::0::Insn: SUB	$0x10,%RAX::
0x117b6:::0::Insn: LEA	0x10(%R12),%RDX::
0x117bb:::0::Insn: SHUFPD	$0x1,%XMM1,%XMM1::
0x117c0:::0::Insn: MULPD	%XMM2,%XMM1::
0x117c4:::0::Insn: ADDSD	%XMM1,%XMM4::
0x117c8:::0::Insn: UNPCKHPD	%XMM1,%XMM1::
0x117cc:::0::Insn: MOVAPD	%XMM1,%XMM0::
0x117d0:::0::Insn: ADDSD	%XMM4,%XMM0::
0x117d4:::0::Insn: MOVUPD	(%RAX),%XMM8::
0x117d9:::0::Insn: MOVUPD	(%RDX),%XMM7::
0x117dd:::0::Insn: SUB	$0x10,%RAX::
0x117e1:::0::Insn: ADD	$0x10,%RDX::
0x117e5:::0::Insn: SHUFPD	$0x1,%XMM8,%XMM8::
0x117eb:::0::Insn: MULPD	%XMM7,%XMM8::
0x117f0:::0::Insn: ADDSD	%XMM8,%XMM0::
0x117f5:::0::Insn: UNPCKHPD	%XMM8,%XMM8::
0x117fa:::0::Insn: ADDSD	%XMM8,%XMM0::
0x117ff:::0::Insn: MOVUPD	(%RAX),%XMM10::
0x11804:::0::Insn: MOVUPD	(%RDX),%XMM12::
0x11809:::0::Insn: SUB	$0x10,%RAX::
0x1180d:::0::Insn: ADD	$0x10,%RDX::
0x11811:::0::Insn: SHUFPD	$0x1,%XMM10,%XMM10::
0x11817:::0::Insn: MULPD	%XMM12,%XMM10::
0x1181c:::0::Insn: ADDSD	%XMM10,%XMM0::
0x11821:::0::Insn: UNPCKHPD	%XMM10,%XMM10::
0x11826:::0::Insn: ADDSD	%XMM10,%XMM0::
0x1182b:::0::Insn: CMP	%R11,%RAX::
0x1182e:::0::Insn: JE	118dd <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x256d>::
0x11834:::0::Insn: MOVUPD	(%RAX),%XMM14::  (117) 
0x11839:::0::Insn: MOVUPD	(%RDX),%XMM1::  (117) 
0x1183d:::0::Insn: SUB	$0x40,%RAX::  (117) 
0x11841:::0::Insn: ADD	$0x40,%RDX::  (117) 
0x11845:::0::Insn: MOVUPD	0x30(%RAX),%XMM6::  (117) 
0x1184a:::0::Insn: MOVUPD	-0x30(%RDX),%XMM4::  (117) 
0x1184f:::0::Insn: SHUFPD	$0x1,%XMM14,%XMM14::  (117) 
0x11855:::0::Insn: MULPD	%XMM1,%XMM14::  (117) 
0x1185a:::0::Insn: MOVUPD	0x20(%RAX),%XMM9::  (117) 
0x11860:::0::Insn: MOVUPD	-0x20(%RDX),%XMM7::  (117) 
0x11865:::0::Insn: SHUFPD	$0x1,%XMM6,%XMM6::  (117) 
0x1186a:::0::Insn: MULPD	%XMM4,%XMM6::  (117) 
0x1186e:::0::Insn: MOVUPD	-0x10(%RDX),%XMM13::  (117) 
0x11874:::0::Insn: SHUFPD	$0x1,%XMM9,%XMM9::  (117) 
0x1187a:::0::Insn: MULPD	%XMM7,%XMM9::  (117) 
0x1187f:::0::Insn: ADDSD	%XMM14,%XMM0::  (117) 
0x11884:::0::Insn: UNPCKHPD	%XMM14,%XMM14::  (117) 
0x11889:::0::Insn: ADDSD	%XMM14,%XMM0::  (117) 
0x1188e:::0::Insn: ADDSD	%XMM6,%XMM0::  (117) 
0x11892:::0::Insn: UNPCKHPD	%XMM6,%XMM6::  (117) 
0x11896:::0::Insn: MOVAPD	%XMM6,%XMM3::  (117) 
0x1189a:::0::Insn: ADDSD	%XMM0,%XMM3::  (117) 
0x1189e:::0::Insn: MOVUPD	0x10(%RAX),%XMM0::  (117) 
0x118a3:::0::Insn: SHUFPD	$0x1,%XMM0,%XMM0::  (117) 
0x118a8:::0::Insn: MULPD	%XMM13,%XMM0::  (117) 
0x118ad:::0::Insn: ADDSD	%XMM9,%XMM3::  (117) 
0x118b2:::0::Insn: UNPCKHPD	%XMM9,%XMM9::  (117) 
0x118b7:::0::Insn: MOVAPD	%XMM9,%XMM11::  (117) 
0x118bc:::0::Insn: ADDSD	%XMM3,%XMM11::  (117) 
0x118c1:::0::Insn: MOVAPD	%XMM0,%XMM14::  (117) 
0x118c6:::0::Insn: UNPCKHPD	%XMM0,%XMM0::  (117) 
0x118ca:::0::Insn: ADDSD	%XMM11,%XMM14::  (117) 
0x118cf:::0::Insn: ADDSD	%XMM14,%XMM0::  (117) 
0x118d4:::0::Insn: CMP	%R11,%RAX::  (117) 
0x118d7:::0::Insn: JNE	11834 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x24c4>::  (117) 
0x118dd:::0::Insn: MOV	0x40(%RSP),%EAX::
0x118e1:::0::Insn: CMP	%EAX,0x18(%RSP)::
0x118e5:::0::Insn: JE	118f7 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2587>::
0x118e7:::0::Insn: MOVSD	(%RCX,%RDI,1),%XMM15::
0x118ed:::0::Insn: MULSD	(%R8),%XMM15::
0x118f2:::0::Insn: ADDSD	%XMM15,%XMM0::
0x118f7:::0::Insn: ADDSD	(%RBX,%R9,8),%XMM0::
0x118fd:::0::Insn: ADD	$0x18,%R10::
0x11901:::0::Insn: MOVSD	%XMM0,(%RBX,%R9,8)::
0x11907:::0::Insn: ADD	$0x1,%R9::
0x1190b:::0::Insn: CMP	%R9D,%EBP::
0x1190e:::0::Insn: JGE	11760 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x23f0>::
0x11a8b:::0::Insn: PXOR	%XMM0,%XMM0::
0x11a8f:::0::Insn: JMP	118f7 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2587>::
0x11a94:::0::Insn: PXOR	%XMM0,%XMM0::
0x11a98:::0::Insn: JMP	118e7 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2577>::
