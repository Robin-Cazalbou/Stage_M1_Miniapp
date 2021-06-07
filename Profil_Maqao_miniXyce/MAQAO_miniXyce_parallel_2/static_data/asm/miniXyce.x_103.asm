0xef90:::0::Insn: CMP	%R12D,%EBX::
0xef93:::0::Insn: JL	efe2 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x282>::
0xef95:::0::Insn: MOV	(%R14),%R9::
0xef98:::0::Insn: MOV	(%R13),%R11::
0xef9c:::0::Insn: SUB	%R12D,%EBX::
0xef9f:::0::Insn: MOVSXD	%EBX,%R10::
0xefa2:::0::Insn: ADD	%R15,%R9::
0xefa5:::0::Insn: MOVSD	(%R11,%R10,8),%XMM0::
0xefab:::0::Insn: MULSD	0x8(%RDI),%XMM0::
0xefb0:::0::Insn: ADDSD	(%R9),%XMM0::
0xefb5:::0::Insn: MOVSD	%XMM0,(%R9)::
0xefba:::0::Insn: MOV	%RDI,%R9::
0xefbd:::0::Insn: MOV	0x10(%R9),%RDI::
0xefc1:::0::Insn: MOV	%RDI,-0xa8(%RBP)::
0xefc8:::0::Insn: TEST	%RDI,%RDI::
0xefcb:::0::Insn: JE	f180 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x420>::
0xefd1:::0::Insn: MOV	-0xa8(%RBP),%RDI::
0xefd8:::0::Insn: MOV	(%RDI),%EBX::
0xefda:::0::Insn: CMP	-0xac(%RBP),%EBX::
0xefe0:::0::Insn: JLE	ef90 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x230>::
0xefe2:::0::Insn: MOV	-0x60(%RBP),%RAX::
0xefe6:::0::Insn: TEST	%RAX,%RAX::
0xefe9:::0::Insn: JE	f033 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x2d3>::
0xefeb:::0::Insn: MOV	-0xa8(%RBP),%RDI::
0xeff2:::0::Insn: MOV	-0xb8(%RBP),%RDX::
0xeff9:::0::Insn: MOV	%RDI,%RCX::
0xeffc:::0::Insn: JMP	f00c <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x2ac>::
0xf000:::0::Insn: MOV	%RAX,%RDX::  (107) 
0xf003:::0::Insn: MOV	0x10(%RAX),%RAX::  (107) 
0xf007:::0::Insn: TEST	%RAX,%RAX::  (107) 
0xf00a:::0::Insn: JE	f01a <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x2ba>::  (107) 
0xf00c:::0::Insn: CMP	0x20(%RAX),%EBX::  (107) 
0xf00f:::0::Insn: JLE	f000 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x2a0>::  (107) 
0xf011:::0::Insn: MOV	0x18(%RAX),%RAX::  (107) 
0xf015:::0::Insn: TEST	%RAX,%RAX::  (107) 
0xf018:::0::Insn: JNE	f00c <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x2ac>::  (107) 
0xf01a:::0::Insn: MOV	%RCX,-0xa8(%RBP)::
0xf021:::0::Insn: CMP	-0xb8(%RBP),%RDX::
0xf028:::0::Insn: JE	f033 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x2d3>::
0xf02a:::0::Insn: CMP	0x20(%RDX),%EBX::
0xf02d:::0::Insn: JGE	f2d8 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x578>::
0xf033:::0::Insn: SUB	$0x8,%RSP::
0xf037:::0::Insn: MOV	%EBX,%R8D::
0xf03a:::0::Insn: MOV	$-0x2,%ECX::
0xf03f:::0::Insn: MOV	$0x4c00080b,%EDX::
0xf044:::0::Insn: PUSHQ	-0xd0(%RBP)::
0xf04a:::0::Insn: MOV	$0x44000000,%R9D::
0xf050:::0::Insn: MOV	$0x1,%ESI::
0xf055:::0::Insn: MOV	-0xe0(%RBP),%RDI::
0xf05c:::0::Insn: CALL	3800 <.plt.sec@start+0x240>::
0xf061:::0::Insn: MOV	-0x60(%RBP),%R10::
0xf065:::0::Insn: POP	%RAX::
0xf066:::0::Insn: POP	%RDX::
0xf067:::0::Insn: TEST	%R10,%R10::
0xf06a:::0::Insn: JE	f336 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x5d6>::
0xf070:::0::Insn: MOV	-0xb8(%RBP),%RDX::
0xf077:::0::Insn: MOV	-0xa8(%RBP),%R11::
0xf07e:::0::Insn: JMP	f08c <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x32c>::
0xf080:::0::Insn: MOV	%R10,%RDX::  (106) 
0xf083:::0::Insn: MOV	0x10(%R10),%R10::  (106) 
0xf087:::0::Insn: TEST	%R10,%R10::  (106) 
0xf08a:::0::Insn: JE	f09b <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x33b>::  (106) 
0xf08c:::0::Insn: CMP	0x20(%R10),%EBX::  (106) 
0xf090:::0::Insn: JLE	f080 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x320>::  (106) 
0xf092:::0::Insn: MOV	0x18(%R10),%R10::  (106) 
0xf096:::0::Insn: TEST	%R10,%R10::  (106) 
0xf099:::0::Insn: JNE	f08c <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x32c>::  (106) 
0xf09b:::0::Insn: MOV	%R11,-0xa8(%RBP)::
0xf0a2:::0::Insn: CMP	-0xb8(%RBP),%RDX::
0xf0a9:::0::Insn: JE	f0b4 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x354>::
0xf0ab:::0::Insn: CMP	0x20(%RDX),%EBX::
0xf0ae:::0::Insn: JGE	f13a <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x3da>::
0xf0b4:::0::Insn: MOV	$0x30,%EDI::
0xf0b9:::0::Insn: MOV	%RDX,-0xd8(%RBP)::
0xf0c0:::0::Insn: CALL	3890 <.plt.sec@start+0x2d0>::
0xf0c5:::0::Insn: MOV	%EBX,0x20(%RAX)::
0xf0c8:::0::Insn: MOV	-0xd8(%RBP),%RSI::
0xf0cf:::0::Insn: LEA	0x20(%RAX),%RDX::
0xf0d3:::0::Insn: MOVQ	$0,0x28(%RAX)::
0xf0db:::0::Insn: MOV	-0xf0(%RBP),%RDI::
0xf0e2:::0::Insn: MOV	%RAX,-0xe8(%RBP)::
0xf0e9:::0::Insn: CALL	12da0 <_ZNSt8_Rb_treeIiSt4pairIKidESt10_Select1stIS2_ESt4lessIiESaIS2_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS2_ERS1_>::
0xf0ee:::0::Insn: MOV	-0xe8(%RBP),%R8::
0xf0f5:::0::Insn: TEST	%RDX,%RDX::
0xf0f8:::0::Insn: MOV	%RAX,%RBX::
0xf0fb:::0::Insn: JE	f326 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x5c6>::
0xf101:::0::Insn: TEST	%RAX,%RAX::
0xf104:::0::Insn: JNE	f113 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x3b3>::
0xf106:::0::Insn: CMP	%RDX,-0xb8(%RBP)::
0xf10d:::0::Insn: JNE	f342 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x5e2>::
0xf113:::0::Insn: MOV	$0x1,%EDI::
0xf118:::0::Insn: MOV	-0xb8(%RBP),%RCX::
0xf11f:::0::Insn: MOV	%R8,%RSI::
0xf122:::0::Insn: MOV	%R8,-0xd8(%RBP)::
0xf129:::0::Insn: CALL	35e0 <.plt.sec@start+0x20>::
0xf12e:::0::Insn: ADDQ	$0x1,-0x48(%RBP)::
0xf133:::0::Insn: MOV	-0xd8(%RBP),%RDX::
0xf13a:::0::Insn: MOV	-0xa8(%RBP),%RAX::
0xf141:::0::Insn: MOVSD	-0x98(%RBP),%XMM2::
0xf149:::0::Insn: MOV	(%R14),%R9::
0xf14c:::0::Insn: MOVSD	%XMM2,0x28(%RDX)::
0xf151:::0::Insn: MULSD	0x8(%RAX),%XMM2::
0xf156:::0::Insn: ADD	%R15,%R9::
0xf159:::0::Insn: ADDSD	(%R9),%XMM2::
0xf15e:::0::Insn: MOVSD	%XMM2,(%R9)::
0xf163:::0::Insn: MOV	%RAX,%R9::
0xf166:::0::Insn: MOV	0x10(%R9),%RDI::
0xf16a:::0::Insn: MOV	%RDI,-0xa8(%RBP)::
0xf171:::0::Insn: TEST	%RDI,%RDI::
0xf174:::0::Insn: JNE	efd1 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x271>::
0xf2d8:::0::Insn: MOV	(%R14),%RSI::
0xf2db:::0::Insn: MOVSD	0x28(%RDX),%XMM1::
0xf2e0:::0::Insn: MOV	%RCX,%R9::
0xf2e3:::0::Insn: MULSD	0x8(%RCX),%XMM1::
0xf2e8:::0::Insn: ADD	%R15,%RSI::
0xf2eb:::0::Insn: ADDSD	(%RSI),%XMM1::
0xf2ef:::0::Insn: MOVSD	%XMM1,(%RSI)::
0xf2f3:::0::Insn: JMP	efbd <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x25d>::
0xf326:::0::Insn: MOV	%R8,%RDI::
0xf329:::0::Insn: CALL	3870 <.plt.sec@start+0x2b0>::
0xf32e:::0::Insn: MOV	%RBX,%RDX::
0xf331:::0::Insn: JMP	f13a <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x3da>::
0xf336:::0::Insn: MOV	-0xb8(%RBP),%RDX::
0xf33d:::0::Insn: JMP	f0b4 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x354>::
0xf342:::0::Insn: XOR	%EDI,%EDI::
0xf344:::0::Insn: MOV	0x20(%RDX),%ESI::
0xf347:::0::Insn: CMP	%ESI,0x20(%R8)::
0xf34b:::0::Insn: SETL	%DIL::
0xf34f:::0::Insn: JMP	f118 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_+0x3b8>::
