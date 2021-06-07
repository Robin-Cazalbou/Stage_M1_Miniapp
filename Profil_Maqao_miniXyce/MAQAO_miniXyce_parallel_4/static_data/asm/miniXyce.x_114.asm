0xf998:::0::Insn: MOV	0x48(%RSP),%R10::
0xf99d:::0::Insn: MOV	0x10(%RSP),%RDI::
0xf9a2:::0::Insn: PXOR	%XMM2,%XMM2::
0xf9a6:::0::Insn: XOR	%ESI,%ESI::
0xf9a8:::0::Insn: MOV	0xd0(%RSP),%RDX::
0xf9b0:::0::Insn: LEA	0xf0(%RSP),%R15::
0xf9b8:::0::Insn: MOV	(%R10),%R11::
0xf9bb:::0::Insn: ADD	%R13,%RDX::
0xf9be:::0::Insn: MOVSD	(%RDX),%XMM5::
0xf9c2:::0::Insn: SUBSD	(%R11,%R13,1),%XMM5::
0xf9c8:::0::Insn: XORPD	0xaf20(%RIP),%XMM5::
0xf9d0:::0::Insn: MOVSD	%XMM5,(%RDX)::
0xf9d4:::0::Insn: MOVQ	$0,0x1e0(%RSP)::
0xf9e0:::0::Insn: MOVAPS	%XMM2,0x1d0(%RSP)::
0xf9e8:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0xf9ed:::0::Insn: MOV	0xf8(%RSP),%R12::
0xf9f5:::0::Insn: CMP	0x100(%RSP),%R12::
0xf9fd:::0::Insn: JE	11647 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x22d7>::
0xfa03:::0::Insn: MOV	0x1d8(%RSP),%RBX::
0xfa0b:::0::Insn: SUB	0x1d0(%RSP),%RBX::
0xfa13:::0::Insn: PXOR	%XMM6,%XMM6::
0xfa17:::0::Insn: MOVQ	$0,0x10(%R12)::
0xfa20:::0::Insn: MOV	%RBX,%R8::
0xfa23:::0::Insn: MOVUPS	%XMM6,(%R12)::
0xfa28:::0::Insn: SAR	$0x3,%R8::
0xfa2c:::0::Insn: JE	116a4 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2334>::
0xfa32:::0::Insn: MOV	$0xfffffffffffffff,%RCX::
0xfa3c:::0::Insn: LEA	0xf0(%RSP),%R15::
0xfa44:::0::Insn: CMP	%RCX,%R8::
0xfa47:::0::Insn: JA	11ca0 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2930>::
0xfa4d:::0::Insn: MOV	%RBX,%RDI::
0xfa50:::0::Insn: CALL	3890 <.plt.sec@start+0x2d0>::
0xfa55:::0::Insn: MOV	0xf8(%RSP),%RSI::
0xfa5d:::0::Insn: MOV	%RAX,%R9::
0xfa60:::0::Insn: MOVQ	%R9,%XMM3::
0xfa65:::0::Insn: ADD	%R9,%RBX::
0xfa68:::0::Insn: PUNPCKLQDQ	%XMM3,%XMM3::
0xfa6c:::0::Insn: MOV	%RBX,0x10(%R12)::
0xfa71:::0::Insn: MOVUPS	%XMM3,(%R12)::
0xfa76:::0::Insn: MOV	0x1d8(%RSP),%RAX::
0xfa7e:::0::Insn: MOV	0x1d0(%RSP),%R15::
0xfa86:::0::Insn: MOV	%RAX,%RBX::
0xfa89:::0::Insn: SUB	%R15,%RBX::
0xfa8c:::0::Insn: CMP	%R15,%RAX::
0xfa8f:::0::Insn: JE	faac <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x73c>::
0xfa91:::0::Insn: MOV	%RSI,0x18(%RSP)::
0xfa96:::0::Insn: MOV	%R9,%RDI::
0xfa99:::0::Insn: MOV	%R15,%RSI::
0xfa9c:::0::Insn: MOV	%RBX,%RDX::
0xfa9f:::0::Insn: CALL	3a80 <.plt.sec@start+0x4c0>::
0xfaa4:::0::Insn: MOV	0x18(%RSP),%RSI::
0xfaa9:::0::Insn: MOV	%RAX,%R9::
0xfaac:::0::Insn: ADD	%RBX,%R9::
0xfaaf:::0::Insn: LEA	0x18(%RSI),%RDX::
0xfab3:::0::Insn: MOV	%R9,0x8(%R12)::
0xfab8:::0::Insn: MOV	%RDX,0xf8(%RSP)::
0xfac0:::0::Insn: TEST	%R15,%R15::
0xfac3:::0::Insn: JE	115c4 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2254>::
0xfac9:::0::Insn: MOV	%R15,%RDI::
0xfacc:::0::Insn: ADD	$0x1,%R14D::
0xfad0:::0::Insn: ADD	$0x8,%R13::
0xfad4:::0::Insn: CALL	3870 <.plt.sec@start+0x2b0>::
0xfad9:::0::Insn: CMP	%R14D,(%RSP)::
0xfadd:::0::Insn: JGE	f998 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x628>::
0x115c4:::0::Insn: ADD	$0x1,%R14D::
0x115c8:::0::Insn: ADD	$0x8,%R13::
0x115cc:::0::Insn: CMP	%R14D,(%RSP)::
0x115d0:::0::Insn: JGE	f998 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x628>::
0x11647:::0::Insn: LEA	0xf0(%RSP),%R15::
0x1164f:::0::Insn: MOV	0x10(%RSP),%RDX::
0x11654:::0::Insn: MOV	%R12,%RSI::
0x11657:::0::Insn: MOV	%R15,%RDI::
0x1165a:::0::Insn: CALL	121b0 <_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_>::
0x1165f:::0::Insn: MOV	0x1d0(%RSP),%R15::
0x11667:::0::Insn: JMP	fac0 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x750>::
0x116a4:::0::Insn: MOV	%R12,%RSI::
0x116a7:::0::Insn: XOR	%R9D,%R9D::
0x116aa:::0::Insn: JMP	fa60 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x6f0>::
