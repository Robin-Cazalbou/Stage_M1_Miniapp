0x10022:::0::Insn: PXOR	%XMM10,%XMM10::
0x10027:::0::Insn: LEA	0x1(%RDI),%EAX::
0x1002a:::0::Insn: MOVQ	$0,0x1a0(%RSP)::
0x10036:::0::Insn: MOV	(%RSP),%R10D::
0x1003a:::0::Insn: MOV	%EAX,(%RBP)::
0x1003d:::0::Insn: LEA	0x190(%RSP),%R14::
0x10045:::0::Insn: MOVQ	$0,0x1c0(%RSP)::
0x10051:::0::Insn: MOVAPS	%XMM10,0x190(%RSP)::
0x1005a:::0::Insn: MOVAPS	%XMM10,0x1b0(%RSP)::
0x10063:::0::Insn: CMP	%R10D,0x4(%RSP)::
0x10068:::0::Insn: JG	102ac <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xf3c>::
0x1006e:::0::Insn: MOV	0x4(%RSP),%R11D::
0x10073:::0::Insn: MOV	%R10D,%R15D::
0x10076:::0::Insn: XOR	%R12D,%R12D::
0x10079:::0::Insn: XOR	%EDX,%EDX::
0x1007b:::0::Insn: XOR	%ESI,%ESI::
0x1007d:::0::Insn: LEA	0x190(%RSP),%R14::
0x10085:::0::Insn: SUB	%R11D,%R15D::
0x10088:::0::Insn: MOV	%R11D,%EBX::
0x1008b:::0::Insn: AND	$0x3,%R15D::
0x1008f:::0::Insn: JE	10272 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xf02>::
0x10095:::0::Insn: MOV	0xf0(%RSP),%R12::
0x1009d:::0::Insn: XOR	%ESI,%ESI::
0x1009f:::0::Insn: MOV	(%R12),%R8::
0x100a3:::0::Insn: LEA	(%R8,%RDI,8),%RDX::
0x100a7:::0::Insn: MOV	%R14,%RDI::
0x100aa:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0x100af:::0::Insn: MOV	0x4(%RSP),%ECX::
0x100b3:::0::Insn: MOV	$0x18,%R12D::
0x100b9:::0::Insn: LEA	0x1(%RCX),%EBX::
0x100bc:::0::Insn: CMP	%EBX,(%RSP)::
0x100bf:::0::Insn: JL	102ac <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xf3c>::
0x100c5:::0::Insn: MOV	(%RBP),%EAX::
0x100c8:::0::Insn: MOV	0x198(%RSP),%RSI::
0x100d0:::0::Insn: MOV	0x1a0(%RSP),%RDX::
0x100d8:::0::Insn: CMP	$0x1,%R15D::
0x100dc:::0::Insn: JE	10272 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xf02>::
0x100e2:::0::Insn: CMP	$0x2,%R15D::
0x100e6:::0::Insn: JE	10128 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xdb8>::
0x100e8:::0::Insn: MOV	0xf0(%RSP),%R9::
0x100f0:::0::Insn: SUB	$0x1,%EAX::
0x100f3:::0::Insn: CLTQ::
0x100f5:::0::Insn: MOV	0x18(%R9),%R13::
0x100f9:::0::Insn: LEA	(%R13,%RAX,8),%RAX::
0x100fe:::0::Insn: CMP	%RDX,%RSI::
0x10101:::0::Insn: JE	11ac4 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2754>::
0x10107:::0::Insn: MOVSD	(%RAX),%XMM11::
0x1010c:::0::Insn: ADD	$0x8,%RSI::
0x10110:::0::Insn: MOVSD	%XMM11,-0x8(%RSI)::
0x10116:::0::Insn: MOV	%RSI,0x198(%RSP)::
0x1011e:::0::Insn: MOV	(%RBP),%EAX::
0x10121:::0::Insn: ADD	$0x1,%EBX::
0x10124:::0::Insn: ADD	$0x18,%R12::
0x10128:::0::Insn: MOV	0xf0(%RSP),%RDI::
0x10130:::0::Insn: SUB	$0x1,%EAX::
0x10133:::0::Insn: CLTQ::
0x10135:::0::Insn: MOV	(%RDI,%R12,1),%R10::
0x10139:::0::Insn: LEA	(%R10,%RAX,8),%R15::
0x1013d:::0::Insn: CMP	%RDX,%RSI::
0x10140:::0::Insn: JE	11a9d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x272d>::
0x10146:::0::Insn: MOVSD	(%R15),%XMM12::
0x1014b:::0::Insn: ADD	$0x8,%RSI::
0x1014f:::0::Insn: MOVSD	%XMM12,-0x8(%RSI)::
0x10155:::0::Insn: MOV	%RSI,0x198(%RSP)::
0x1015d:::0::Insn: MOV	(%RBP),%EAX::
0x10160:::0::Insn: MOV	0x1a0(%RSP),%RDX::
0x10168:::0::Insn: ADD	$0x1,%EBX::
0x1016b:::0::Insn: ADD	$0x18,%R12::
0x1016f:::0::Insn: JMP	10272 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xf02>::
0x10178:::0::Insn: MOVSD	(%RCX),%XMM13::  (132) 
0x1017d:::0::Insn: ADD	$0x8,%RSI::  (132) 
0x10181:::0::Insn: ADD	$0x1,%EBX::  (132) 
0x10184:::0::Insn: LEA	0x18(%R12),%R13::  (132) 
0x10189:::0::Insn: MOVSD	%XMM13,-0x8(%RSI)::  (132) 
0x1018f:::0::Insn: MOV	%RSI,0x198(%RSP)::  (132) 
0x10197:::0::Insn: CMP	%EBX,(%RSP)::  (132) 
0x1019a:::0::Insn: JL	102ac <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xf3c>::  (132) 
0x101a0:::0::Insn: MOV	0xf0(%RSP),%RDX::  (132) 
0x101a8:::0::Insn: MOV	(%RBP),%EAX::  (132) 
0x101ab:::0::Insn: MOV	0x198(%RSP),%RSI::  (132) 
0x101b3:::0::Insn: MOV	0x18(%RDX,%R12,1),%R12::  (132) 
0x101b8:::0::Insn: SUB	$0x1,%EAX::  (132) 
0x101bb:::0::Insn: CLTQ::  (132) 
0x101bd:::0::Insn: LEA	(%R12,%RAX,8),%RDX::  (132) 
0x101c1:::0::Insn: CMP	0x1a0(%RSP),%RSI::  (132) 
0x101c9:::0::Insn: JE	11632 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x22c2>::  (132) 
0x101cf:::0::Insn: MOVSD	(%RDX),%XMM14::  (132) 
0x101d4:::0::Insn: ADD	$0x8,%RSI::  (132) 
0x101d8:::0::Insn: MOVSD	%XMM14,-0x8(%RSI)::  (132) 
0x101de:::0::Insn: MOV	%RSI,0x198(%RSP)::  (132) 
0x101e6:::0::Insn: MOV	(%RBP),%EAX::  (132) 
0x101e9:::0::Insn: MOV	0xf0(%RSP),%R9::  (132) 
0x101f1:::0::Insn: SUB	$0x1,%EAX::  (132) 
0x101f4:::0::Insn: MOV	0x18(%R9,%R13,1),%RDI::  (132) 
0x101f9:::0::Insn: CLTQ::  (132) 
0x101fb:::0::Insn: LEA	(%RDI,%RAX,8),%RDX::  (132) 
0x101ff:::0::Insn: CMP	0x1a0(%RSP),%RSI::  (132) 
0x10207:::0::Insn: JE	1161d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x22ad>::  (132) 
0x1020d:::0::Insn: MOVSD	(%RDX),%XMM15::  (132) 
0x10212:::0::Insn: ADD	$0x8,%RSI::  (132) 
0x10216:::0::Insn: MOVSD	%XMM15,-0x8(%RSI)::  (132) 
0x1021c:::0::Insn: MOV	%RSI,0x198(%RSP)::  (132) 
0x10224:::0::Insn: MOV	(%RBP),%EAX::  (132) 
0x10227:::0::Insn: MOV	0xf0(%RSP),%R10::  (132) 
0x1022f:::0::Insn: SUB	$0x1,%EAX::  (132) 
0x10232:::0::Insn: MOV	0x30(%R10,%R13,1),%R15::  (132) 
0x10237:::0::Insn: CLTQ::  (132) 
0x10239:::0::Insn: LEA	(%R15,%RAX,8),%RDX::  (132) 
0x1023d:::0::Insn: CMP	0x1a0(%RSP),%RSI::  (132) 
0x10245:::0::Insn: JE	115db <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x226b>::  (132) 
0x1024b:::0::Insn: MOVSD	(%RDX),%XMM1::  (132) 
0x1024f:::0::Insn: ADD	$0x8,%RSI::  (132) 
0x10253:::0::Insn: MOVSD	%XMM1,-0x8(%RSI)::  (132) 
0x10258:::0::Insn: MOV	%RSI,0x198(%RSP)::  (132) 
0x10260:::0::Insn: MOV	(%RBP),%EAX::  (132) 
0x10263:::0::Insn: MOV	0x1a0(%RSP),%RDX::  (132) 
0x1026b:::0::Insn: ADD	$0x3,%EBX::  (132) 
0x1026e:::0::Insn: LEA	0x48(%R13),%R12::  (132) 
0x10272:::0::Insn: MOV	0xf0(%RSP),%R11::  (132) 
0x1027a:::0::Insn: SUB	$0x1,%EAX::  (132) 
0x1027d:::0::Insn: CLTQ::  (132) 
0x1027f:::0::Insn: MOV	(%R11,%R12,1),%R8::  (132) 
0x10283:::0::Insn: LEA	(%R8,%RAX,8),%RCX::  (132) 
0x10287:::0::Insn: CMP	%RDX,%RSI::  (132) 
0x1028a:::0::Insn: JNE	10178 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xe08>::  (132) 
0x10290:::0::Insn: MOV	%RCX,%RDX::  (132) 
0x10293:::0::Insn: MOV	%R14,%RDI::  (132) 
0x10296:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (132) 
0x1029b:::0::Insn: ADD	$0x1,%EBX::  (132) 
0x1029e:::0::Insn: LEA	0x18(%R12),%R13::  (132) 
0x102a3:::0::Insn: CMP	%EBX,(%RSP)::  (132) 
0x102a6:::0::Insn: JGE	101a0 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xe30>::  (132) 
0x102ac:::0::Insn: MOV	0x28(%RSP),%RDX::
0x102b1:::0::Insn: MOV	0x38(%RSP),%RDI::
0x102b6:::0::Insn: MOV	%R14,%RSI::
0x102b9:::0::Insn: CALL	ed60 <_ZN15mX_matrix_utils28sparse_matrix_vector_productEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_>::
0x102be:::0::Insn: MOV	(%RBP),%ESI::
0x102c1:::0::Insn: PXOR	%XMM0,%XMM0::
0x102c5:::0::Insn: XOR	%EBX,%EBX::
0x102c7:::0::Insn: LEA	0xa8(%RSP),%R13::
0x102cf:::0::Insn: MOVAPS	%XMM0,0x1d0(%RSP)::
0x102d7:::0::Insn: LEA	0xa0(%RSP),%R15::
0x102df:::0::Insn: LEA	0x170(%RSP),%R14::
0x102e7:::0::Insn: MOVQ	$0,0x1e0(%RSP)::
0x102f3:::0::Insn: TEST	%ESI,%ESI::
0x102f5:::0::Insn: JLE	108e5 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1575>::
0x102fb:::0::Insn: NOPL	(%RAX,%RAX,1)::
0x10300:::0::Insn: MOVQ	$0,0xa0(%RSP)::  (129) 
0x1030c:::0::Insn: MOV	(%RSP),%R11D::  (129) 
0x10310:::0::Insn: CMP	%R11D,0x4(%RSP)::  (129) 
0x10315:::0::Insn: JG	1059a <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x122a>::  (129) 
0x1031b:::0::Insn: MOV	0x1b0(%RSP),%RSI::  (129) 
0x10323:::0::Insn: MOV	0x8(%RSP),%RDI::  (129) 
0x10328:::0::Insn: PXOR	%XMM5,%XMM5::  (129) 
0x1032c:::0::Insn: LEA	(,%RBX,8),%RCX::  (129) 
0x10334:::0::Insn: MOV	0xf0(%RSP),%R10::  (129) 
0x1033c:::0::Insn: LEA	0x8(%RSI),%R12::  (129) 
0x10340:::0::Insn: LEA	(%R12,%RDI,1),%R8::  (129) 
0x10344:::0::Insn: SHR	$0x3,%RDI::  (129) 
0x10348:::0::Insn: AND	$0x7,%EDI::  (129) 
0x1034b:::0::Insn: JE	10575 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1205>::  (129) 
0x10351:::0::Insn: MOV	(%R10),%R9::  (129) 
0x10354:::0::Insn: PXOR	%XMM2,%XMM2::  (129) 
0x10358:::0::Insn: ADD	$0x18,%R10::  (129) 
0x1035c:::0::Insn: MOVSD	(%R9,%RBX,8),%XMM5::  (129) 
0x10362:::0::Insn: MULSD	(%RSI),%XMM5::  (129) 
0x10366:::0::Insn: MOV	%R12,%RSI::  (129) 
0x10369:::0::Insn: ADD	$0x8,%R12::  (129) 
0x1036d:::0::Insn: ADDSD	%XMM2,%XMM5::  (129) 
0x10371:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::  (129) 
0x1037a:::0::Insn: CMP	$0x1,%RDI::  (129) 
0x1037e:::0::Insn: JE	10575 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1205>::  (129) 
0x10384:::0::Insn: CMP	$0x2,%RDI::  (129) 
0x10388:::0::Insn: JE	10463 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x10f3>::  (129) 
0x1038e:::0::Insn: CMP	$0x3,%RDI::  (129) 
0x10392:::0::Insn: JE	1043e <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x10ce>::  (129) 
0x10398:::0::Insn: CMP	$0x4,%RDI::  (129) 
0x1039c:::0::Insn: JE	10417 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x10a7>::  (129) 
0x1039e:::0::Insn: CMP	$0x5,%RDI::  (129) 
0x103a2:::0::Insn: JE	103f2 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1082>::  (129) 
0x103a4:::0::Insn: CMP	$0x6,%RDI::  (129) 
0x103a8:::0::Insn: JE	103ce <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x105e>::  (129) 
0x103aa:::0::Insn: MOV	(%R10),%RAX::  (129) 
0x103ad:::0::Insn: ADD	$0x18,%R10::  (129) 
0x103b1:::0::Insn: MOVSD	(%RAX,%RCX,1),%XMM6::  (129) 
0x103b6:::0::Insn: MULSD	(%RSI),%XMM6::  (129) 
0x103ba:::0::Insn: MOV	%R12,%RSI::  (129) 
0x103bd:::0::Insn: ADD	$0x8,%R12::  (129) 
0x103c1:::0::Insn: ADDSD	%XMM6,%XMM5::  (129) 
0x103c5:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::  (129) 
0x103ce:::0::Insn: MOV	(%R10),%RDX::  (129) 
0x103d1:::0::Insn: ADD	$0x18,%R10::  (129) 
0x103d5:::0::Insn: MOVSD	(%RDX,%RCX,1),%XMM3::  (129) 
0x103da:::0::Insn: MULSD	(%RSI),%XMM3::  (129) 
0x103de:::0::Insn: MOV	%R12,%RSI::  (129) 
0x103e1:::0::Insn: ADD	$0x8,%R12::  (129) 
0x103e5:::0::Insn: ADDSD	%XMM3,%XMM5::  (129) 
0x103e9:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::  (129) 
0x103f2:::0::Insn: MOV	(%R10),%R11::  (129) 
0x103f5:::0::Insn: ADD	$0x18,%R10::  (129) 
0x103f9:::0::Insn: MOVSD	(%R11,%RCX,1),%XMM4::  (129) 
0x103ff:::0::Insn: MULSD	(%RSI),%XMM4::  (129) 
0x10403:::0::Insn: MOV	%R12,%RSI::  (129) 
0x10406:::0::Insn: ADD	$0x8,%R12::  (129) 
0x1040a:::0::Insn: ADDSD	%XMM4,%XMM5::  (129) 
0x1040e:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::  (129) 
0x10417:::0::Insn: MOV	(%R10),%RDI::  (129) 
0x1041a:::0::Insn: ADD	$0x18,%R10::  (129) 
0x1041e:::0::Insn: MOVSD	(%RDI,%RCX,1),%XMM8::  (129) 
0x10424:::0::Insn: MULSD	(%RSI),%XMM8::  (129) 
0x10429:::0::Insn: MOV	%R12,%RSI::  (129) 
0x1042c:::0::Insn: ADD	$0x8,%R12::  (129) 
0x10430:::0::Insn: ADDSD	%XMM8,%XMM5::  (129) 
0x10435:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::  (129) 
0x1043e:::0::Insn: MOV	(%R10),%R9::  (129) 
0x10441:::0::Insn: ADD	$0x18,%R10::  (129) 
0x10445:::0::Insn: MOVSD	(%R9,%RCX,1),%XMM7::  (129) 
0x1044b:::0::Insn: MULSD	(%RSI),%XMM7::  (129) 
0x1044f:::0::Insn: MOV	%R12,%RSI::  (129) 
0x10452:::0::Insn: ADD	$0x8,%R12::  (129) 
0x10456:::0::Insn: ADDSD	%XMM7,%XMM5::  (129) 
0x1045a:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::  (129) 
0x10463:::0::Insn: MOV	(%R10),%RAX::  (129) 
0x10466:::0::Insn: ADD	$0x18,%R10::  (129) 
0x1046a:::0::Insn: MOVSD	(%RAX,%RCX,1),%XMM9::  (129) 
0x10470:::0::Insn: MULSD	(%RSI),%XMM9::  (129) 
0x10475:::0::Insn: MOV	%R12,%RSI::  (129) 
0x10478:::0::Insn: ADD	$0x8,%R12::  (129) 
0x1047c:::0::Insn: ADDSD	%XMM9,%XMM5::  (129) 
0x10481:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::  (129) 
0x1048a:::0::Insn: JMP	10575 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1205>::  (129) 
0x10490:::0::Insn: MOV	0x18(%R10),%R11::    (131) 
0x10494:::0::Insn: MOV	0x30(%R10),%RDI::    (131) 
0x10498:::0::Insn: ADD	$0xc0,%R10::    (131) 
0x1049f:::0::Insn: MOV	-0x78(%R10),%R9::    (131) 
0x104a3:::0::Insn: MOV	-0x60(%R10),%RAX::    (131) 
0x104a7:::0::Insn: MOVSD	(%R11,%RCX,1),%XMM11::    (131) 
0x104ad:::0::Insn: MULSD	(%R12),%XMM11::    (131) 
0x104b3:::0::Insn: MOV	-0x48(%R10),%RSI::    (131) 
0x104b7:::0::Insn: MOV	-0x30(%R10),%RDX::    (131) 
0x104bb:::0::Insn: MOV	-0x18(%R10),%R11::    (131) 
0x104bf:::0::Insn: ADDSD	%XMM11,%XMM5::    (131) 
0x104c4:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x104cd:::0::Insn: MOVSD	(%RDI,%RCX,1),%XMM12::    (131) 
0x104d3:::0::Insn: MULSD	0x8(%R12),%XMM12::    (131) 
0x104da:::0::Insn: ADDSD	%XMM12,%XMM5::    (131) 
0x104df:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x104e8:::0::Insn: MOVSD	(%R9,%RCX,1),%XMM13::    (131) 
0x104ee:::0::Insn: MULSD	0x10(%R12),%XMM13::    (131) 
0x104f5:::0::Insn: ADDSD	%XMM13,%XMM5::    (131) 
0x104fa:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x10503:::0::Insn: MOVSD	(%RAX,%RCX,1),%XMM14::    (131) 
0x10509:::0::Insn: MULSD	0x18(%R12),%XMM14::    (131) 
0x10510:::0::Insn: ADDSD	%XMM14,%XMM5::    (131) 
0x10515:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x1051e:::0::Insn: MOVSD	(%RSI,%RCX,1),%XMM15::    (131) 
0x10524:::0::Insn: MULSD	0x20(%R12),%XMM15::    (131) 
0x1052b:::0::Insn: LEA	0x38(%R12),%RSI::    (131) 
0x10530:::0::Insn: ADD	$0x40,%R12::    (131) 
0x10534:::0::Insn: ADDSD	%XMM15,%XMM5::    (131) 
0x10539:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x10542:::0::Insn: MOVSD	(%RDX,%RCX,1),%XMM1::    (131) 
0x10547:::0::Insn: MULSD	-0x18(%R12),%XMM1::    (131) 
0x1054e:::0::Insn: ADDSD	%XMM1,%XMM5::    (131) 
0x10552:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x1055b:::0::Insn: MOVSD	(%R11,%RCX,1),%XMM0::    (131) 
0x10561:::0::Insn: MULSD	-0x10(%R12),%XMM0::    (131) 
0x10568:::0::Insn: ADDSD	%XMM0,%XMM5::    (131) 
0x1056c:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x10575:::0::Insn: MOV	(%R10),%RDX::    (131) 
0x10578:::0::Insn: MOVSD	(%RDX,%RCX,1),%XMM10::    (131) 
0x1057e:::0::Insn: MULSD	(%RSI),%XMM10::    (131) 
0x10583:::0::Insn: ADDSD	%XMM10,%XMM5::    (131) 
0x10588:::0::Insn: MOVSD	%XMM5,0xa0(%RSP)::    (131) 
0x10591:::0::Insn: CMP	%R12,%R8::    (131) 
0x10594:::0::Insn: JNE	10490 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1120>::    (131) 
0x1059a:::0::Insn: MOV	$0x44000000,%R9D::  (129) 
0x105a0:::0::Insn: MOV	%R13,%RSI::  (129) 
0x105a3:::0::Insn: MOV	%R15,%RDI::  (129) 
0x105a6:::0::Insn: MOV	%R14,%R12::  (129) 
0x105a9:::0::Insn: MOV	$0x58000003,%R8D::  (129) 
0x105af:::0::Insn: MOV	$0x4c00080b,%ECX::  (129) 
0x105b4:::0::Insn: MOV	$0x1,%EDX::  (129) 
0x105b9:::0::Insn: CALL	3930 <.plt.sec@start+0x370>::  (129) 
0x105be:::0::Insn: MOV	(%RSP),%ECX::  (129) 
0x105c1:::0::Insn: CMP	%ECX,0x4(%RSP)::  (129) 
0x105c5:::0::Insn: JG	108a8 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1538>::  (129) 
0x105cb:::0::Insn: MOV	0x1b0(%RSP),%RCX::  (129) 
0x105d3:::0::Insn: MOV	0x8(%RSP),%RDI::  (129) 
0x105d8:::0::Insn: LEA	(,%RBX,8),%R10::  (129) 
0x105e0:::0::Insn: MOV	0xf0(%RSP),%R12::  (129) 
0x105e8:::0::Insn: LEA	0x8(%RCX),%RAX::  (129) 
0x105ec:::0::Insn: LEA	(%RAX,%RDI,1),%R8::  (129) 
0x105f0:::0::Insn: SHR	$0x3,%RDI::  (129) 
0x105f4:::0::Insn: AND	$0x7,%EDI::  (129) 
0x105f7:::0::Insn: JE	10880 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1510>::  (129) 
0x105fd:::0::Insn: MOV	(%R12),%R9::  (129) 
0x10601:::0::Insn: MOVSD	(%RCX),%XMM2::  (129) 
0x10605:::0::Insn: ADD	$0x18,%R12::  (129) 
0x10609:::0::Insn: MOVSD	(%R9,%RBX,8),%XMM5::  (129) 
0x1060f:::0::Insn: MULSD	0xa8(%RSP),%XMM5::  (129) 
0x10618:::0::Insn: SUBSD	%XMM5,%XMM2::  (129) 
0x1061c:::0::Insn: MOVSD	%XMM2,(%RCX)::  (129) 
0x10620:::0::Insn: MOV	%RAX,%RCX::  (129) 
0x10623:::0::Insn: ADD	$0x8,%RAX::  (129) 
0x10627:::0::Insn: CMP	$0x1,%RDI::  (129) 
0x1062b:::0::Insn: JE	10880 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1510>::  (129) 
0x10631:::0::Insn: CMP	$0x2,%RDI::  (129) 
0x10635:::0::Insn: JE	1073b <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x13cb>::  (129) 
0x1063b:::0::Insn: CMP	$0x3,%RDI::  (129) 
0x1063f:::0::Insn: JE	1070d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x139d>::  (129) 
0x10645:::0::Insn: CMP	$0x4,%RDI::  (129) 
0x10649:::0::Insn: JE	106df <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x136f>::  (129) 
0x1064f:::0::Insn: CMP	$0x5,%RDI::  (129) 
0x10653:::0::Insn: JE	106b2 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1342>::  (129) 
0x10655:::0::Insn: CMP	$0x6,%RDI::  (129) 
0x10659:::0::Insn: JE	10685 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1315>::  (129) 
0x1065b:::0::Insn: MOV	(%R12),%RSI::  (129) 
0x1065f:::0::Insn: MOVSD	(%RCX),%XMM3::  (129) 
0x10663:::0::Insn: ADD	$0x18,%R12::  (129) 
0x10667:::0::Insn: MOVSD	(%RSI,%R10,1),%XMM6::  (129) 
0x1066d:::0::Insn: MULSD	0xa8(%RSP),%XMM6::  (129) 
0x10676:::0::Insn: SUBSD	%XMM6,%XMM3::  (129) 
0x1067a:::0::Insn: MOVSD	%XMM3,(%RCX)::  (129) 
0x1067e:::0::Insn: MOV	%RAX,%RCX::  (129) 
0x10681:::0::Insn: ADD	$0x8,%RAX::  (129) 
0x10685:::0::Insn: MOV	(%R12),%RDX::  (129) 
0x10689:::0::Insn: MOVSD	(%RCX),%XMM8::  (129) 
0x1068e:::0::Insn: ADD	$0x18,%R12::  (129) 
0x10692:::0::Insn: MOVSD	(%RDX,%R10,1),%XMM4::  (129) 
0x10698:::0::Insn: MULSD	0xa8(%RSP),%XMM4::  (129) 
0x106a1:::0::Insn: SUBSD	%XMM4,%XMM8::  (129) 
0x106a6:::0::Insn: MOVSD	%XMM8,(%RCX)::  (129) 
0x106ab:::0::Insn: MOV	%RAX,%RCX::  (129) 
0x106ae:::0::Insn: ADD	$0x8,%RAX::  (129) 
0x106b2:::0::Insn: MOV	(%R12),%R11::  (129) 
0x106b6:::0::Insn: MOVSD	(%RCX),%XMM9::  (129) 
0x106bb:::0::Insn: ADD	$0x18,%R12::  (129) 
0x106bf:::0::Insn: MOVSD	(%R11,%R10,1),%XMM7::  (129) 
0x106c5:::0::Insn: MULSD	0xa8(%RSP),%XMM7::  (129) 
0x106ce:::0::Insn: SUBSD	%XMM7,%XMM9::  (129) 
0x106d3:::0::Insn: MOVSD	%XMM9,(%RCX)::  (129) 
0x106d8:::0::Insn: MOV	%RAX,%RCX::  (129) 
0x106db:::0::Insn: ADD	$0x8,%RAX::  (129) 
0x106df:::0::Insn: MOV	(%R12),%RDI::  (129) 
0x106e3:::0::Insn: MOVSD	(%RCX),%XMM11::  (129) 
0x106e8:::0::Insn: ADD	$0x18,%R12::  (129) 
0x106ec:::0::Insn: MOVSD	(%RDI,%R10,1),%XMM10::  (129) 
0x106f2:::0::Insn: MULSD	0xa8(%RSP),%XMM10::  (129) 
0x106fc:::0::Insn: SUBSD	%XMM10,%XMM11::  (129) 
0x10701:::0::Insn: MOVSD	%XMM11,(%RCX)::  (129) 
0x10706:::0::Insn: MOV	%RAX,%RCX::  (129) 
0x10709:::0::Insn: ADD	$0x8,%RAX::  (129) 
0x1070d:::0::Insn: MOV	(%R12),%R9::  (129) 
0x10711:::0::Insn: MOVSD	(%RCX),%XMM13::  (129) 
0x10716:::0::Insn: ADD	$0x18,%R12::  (129) 
0x1071a:::0::Insn: MOVSD	(%R9,%R10,1),%XMM12::  (129) 
0x10720:::0::Insn: MULSD	0xa8(%RSP),%XMM12::  (129) 
0x1072a:::0::Insn: SUBSD	%XMM12,%XMM13::  (129) 
0x1072f:::0::Insn: MOVSD	%XMM13,(%RCX)::  (129) 
0x10734:::0::Insn: MOV	%RAX,%RCX::  (129) 
0x10737:::0::Insn: ADD	$0x8,%RAX::  (129) 
0x1073b:::0::Insn: MOV	(%R12),%RSI::  (129) 
0x1073f:::0::Insn: MOVSD	(%RCX),%XMM15::  (129) 
0x10744:::0::Insn: ADD	$0x18,%R12::  (129) 
0x10748:::0::Insn: MOVSD	(%RSI,%R10,1),%XMM14::  (129) 
0x1074e:::0::Insn: MULSD	0xa8(%RSP),%XMM14::  (129) 
0x10758:::0::Insn: SUBSD	%XMM14,%XMM15::  (129) 
0x1075d:::0::Insn: MOVSD	%XMM15,(%RCX)::  (129) 
0x10762:::0::Insn: MOV	%RAX,%RCX::  (129) 
0x10765:::0::Insn: ADD	$0x8,%RAX::  (129) 
0x10769:::0::Insn: JMP	10880 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1510>::  (129) 
0x10770:::0::Insn: MOV	0x18(%R12),%R11::    (130) 
0x10775:::0::Insn: MOVSD	(%RAX),%XMM2::    (130) 
0x10779:::0::Insn: ADD	$0xc0,%R12::    (130) 
0x10780:::0::Insn: MOV	-0x90(%R12),%RDI::    (130) 
0x10788:::0::Insn: MOVSD	0x8(%RAX),%XMM3::    (130) 
0x1078d:::0::Insn: MOVSD	(%R11,%R10,1),%XMM5::    (130) 
0x10793:::0::Insn: MOV	-0x78(%R12),%R9::    (130) 
0x10798:::0::Insn: MULSD	0xa8(%RSP),%XMM5::    (130) 
0x107a1:::0::Insn: MOVSD	0x10(%RAX),%XMM8::    (130) 
0x107a7:::0::Insn: MOV	-0x60(%R12),%RSI::    (130) 
0x107ac:::0::Insn: MOVSD	0x18(%RAX),%XMM9::    (130) 
0x107b2:::0::Insn: MOV	-0x48(%R12),%RCX::    (130) 
0x107b7:::0::Insn: MOVSD	0x20(%RAX),%XMM11::    (130) 
0x107bd:::0::Insn: MOV	-0x30(%R12),%RDX::    (130) 
0x107c2:::0::Insn: MOVSD	0x28(%RAX),%XMM13::    (130) 
0x107c8:::0::Insn: MOV	-0x18(%R12),%R11::    (130) 
0x107cd:::0::Insn: SUBSD	%XMM5,%XMM2::    (130) 
0x107d1:::0::Insn: MOVSD	%XMM2,(%RAX)::    (130) 
0x107d5:::0::Insn: MOVSD	(%RDI,%R10,1),%XMM6::    (130) 
0x107db:::0::Insn: MULSD	0xa8(%RSP),%XMM6::    (130) 
0x107e4:::0::Insn: SUBSD	%XMM6,%XMM3::    (130) 
0x107e8:::0::Insn: MOVSD	%XMM3,0x8(%RAX)::    (130) 
0x107ed:::0::Insn: MOVSD	(%R9,%R10,1),%XMM4::    (130) 
0x107f3:::0::Insn: MULSD	0xa8(%RSP),%XMM4::    (130) 
0x107fc:::0::Insn: SUBSD	%XMM4,%XMM8::    (130) 
0x10801:::0::Insn: MOVSD	%XMM8,0x10(%RAX)::    (130) 
0x10807:::0::Insn: MOVSD	(%RSI,%R10,1),%XMM7::    (130) 
0x1080d:::0::Insn: MULSD	0xa8(%RSP),%XMM7::    (130) 
0x10816:::0::Insn: SUBSD	%XMM7,%XMM9::    (130) 
0x1081b:::0::Insn: MOVSD	%XMM9,0x18(%RAX)::    (130) 
0x10821:::0::Insn: MOVSD	(%RCX,%R10,1),%XMM10::    (130) 
0x10827:::0::Insn: LEA	0x38(%RAX),%RCX::    (130) 
0x1082b:::0::Insn: MULSD	0xa8(%RSP),%XMM10::    (130) 
0x10835:::0::Insn: ADD	$0x40,%RAX::    (130) 
0x10839:::0::Insn: SUBSD	%XMM10,%XMM11::    (130) 
0x1083e:::0::Insn: MOVSD	%XMM11,-0x20(%RAX)::    (130) 
0x10844:::0::Insn: MOVSD	(%RDX,%R10,1),%XMM12::    (130) 
0x1084a:::0::Insn: MULSD	0xa8(%RSP),%XMM12::    (130) 
0x10854:::0::Insn: SUBSD	%XMM12,%XMM13::    (130) 
0x10859:::0::Insn: MOVSD	%XMM13,-0x18(%RAX)::    (130) 
0x1085f:::0::Insn: MOVSD	(%R11,%R10,1),%XMM14::    (130) 
0x10865:::0::Insn: MULSD	0xa8(%RSP),%XMM14::    (130) 
0x1086f:::0::Insn: MOVSD	-0x10(%RAX),%XMM15::    (130) 
0x10875:::0::Insn: SUBSD	%XMM14,%XMM15::    (130) 
0x1087a:::0::Insn: MOVSD	%XMM15,-0x10(%RAX)::    (130) 
0x10880:::0::Insn: MOV	(%R12),%RDX::    (130) 
0x10884:::0::Insn: MOVSD	(%RCX),%XMM0::    (130) 
0x10888:::0::Insn: MOVSD	(%RDX,%R10,1),%XMM1::    (130) 
0x1088e:::0::Insn: MULSD	0xa8(%RSP),%XMM1::    (130) 
0x10897:::0::Insn: SUBSD	%XMM1,%XMM0::    (130) 
0x1089b:::0::Insn: MOVSD	%XMM0,(%RCX)::    (130) 
0x1089f:::0::Insn: CMP	%RAX,%R8::    (130) 
0x108a2:::0::Insn: JNE	10770 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1400>::    (130) 
0x108a8:::0::Insn: MOV	0x1d8(%RSP),%RSI::  (129) 
0x108b0:::0::Insn: CMP	0x1e0(%RSP),%RSI::  (129) 
0x108b8:::0::Insn: JE	10e48 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1ad8>::  (129) 
0x108be:::0::Insn: MOVSD	0xa8(%RSP),%XMM1::  (129) 
0x108c7:::0::Insn: ADD	$0x8,%RSI::  (129) 
0x108cb:::0::Insn: MOVSD	%XMM1,-0x8(%RSI)::  (129) 
0x108d0:::0::Insn: MOV	%RSI,0x1d8(%RSP)::  (129) 
0x108d8:::0::Insn: ADD	$0x1,%RBX::  (129) 
0x108dc:::0::Insn: CMP	%EBX,(%RBP)::  (129) 
0x108df:::0::Insn: JG	10300 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xf90>::  (129) 
0x108e5:::0::Insn: MOV	0x1b0(%RSP),%RBX::
0x108ed:::0::Insn: MOV	0x1b8(%RSP),%R14::
0x108f5:::0::Insn: PXOR	%XMM0,%XMM0::
0x108f9:::0::Insn: MOVQ	$0,0xa8(%RSP)::
0x10905:::0::Insn: SUB	%RBX,%R14::
0x10908:::0::Insn: MOV	%RBX,%R10::
0x1090b:::0::Insn: LEA	(%RBX,%R14,1),%R12::
0x1090f:::0::Insn: SHR	$0x3,%R14::
0x10913:::0::Insn: JE	10af6 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1786>::
0x10919:::0::Insn: MOV	%R12,%RAX::
0x1091c:::0::Insn: SUB	%RBX,%RAX::
0x1091f:::0::Insn: SUB	$0x8,%RAX::
0x10923:::0::Insn: SHR	$0x3,%RAX::
0x10927:::0::Insn: ADD	$0x1,%RAX::
0x1092b:::0::Insn: AND	$0x7,%EAX::
0x1092e:::0::Insn: JE	10a24 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x16b4>::
0x10934:::0::Insn: CMP	$0x1,%RAX::
0x10938:::0::Insn: JE	10a01 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1691>::
0x1093e:::0::Insn: CMP	$0x2,%RAX::
0x10942:::0::Insn: JE	109e5 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1675>::
0x10948:::0::Insn: CMP	$0x3,%RAX::
0x1094c:::0::Insn: JE	109cb <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x165b>::
0x1094e:::0::Insn: CMP	$0x4,%RAX::
0x10952:::0::Insn: JE	109b1 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1641>::
0x10954:::0::Insn: CMP	$0x5,%RAX::
0x10958:::0::Insn: JE	10997 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1627>::
0x1095a:::0::Insn: CMP	$0x6,%RAX::
0x1095e:::0::Insn: JE	1097d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x160d>::
0x10960:::0::Insn: MOVSD	(%RBX),%XMM0::
0x10964:::0::Insn: PXOR	%XMM5,%XMM5::
0x10968:::0::Insn: ADD	$0x8,%R10::
0x1096c:::0::Insn: MULSD	%XMM0,%XMM0::
0x10970:::0::Insn: ADDSD	%XMM5,%XMM0::
0x10974:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::
0x1097d:::0::Insn: MOVSD	(%R10),%XMM2::
0x10982:::0::Insn: ADD	$0x8,%R10::
0x10986:::0::Insn: MULSD	%XMM2,%XMM2::
0x1098a:::0::Insn: ADDSD	%XMM2,%XMM0::
0x1098e:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::
0x10997:::0::Insn: MOVSD	(%R10),%XMM6::
0x1099c:::0::Insn: ADD	$0x8,%R10::
0x109a0:::0::Insn: MULSD	%XMM6,%XMM6::
0x109a4:::0::Insn: ADDSD	%XMM6,%XMM0::
0x109a8:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::
0x109b1:::0::Insn: MOVSD	(%R10),%XMM3::
0x109b6:::0::Insn: ADD	$0x8,%R10::
0x109ba:::0::Insn: MULSD	%XMM3,%XMM3::
0x109be:::0::Insn: ADDSD	%XMM3,%XMM0::
0x109c2:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::
0x109cb:::0::Insn: MOVSD	(%R10),%XMM4::
0x109d0:::0::Insn: ADD	$0x8,%R10::
0x109d4:::0::Insn: MULSD	%XMM4,%XMM4::
0x109d8:::0::Insn: ADDSD	%XMM4,%XMM0::
0x109dc:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::
0x109e5:::0::Insn: MOVSD	(%R10),%XMM8::
0x109ea:::0::Insn: ADD	$0x8,%R10::
0x109ee:::0::Insn: MULSD	%XMM8,%XMM8::
0x109f3:::0::Insn: ADDSD	%XMM8,%XMM0::
0x109f8:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::
0x10a01:::0::Insn: MOVSD	(%R10),%XMM7::
0x10a06:::0::Insn: ADD	$0x8,%R10::
0x10a0a:::0::Insn: MULSD	%XMM7,%XMM7::
0x10a0e:::0::Insn: ADDSD	%XMM7,%XMM0::
0x10a12:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::
0x10a1b:::0::Insn: CMP	%R10,%R12::
0x10a1e:::0::Insn: JE	10af6 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1786>::
0x10a24:::0::Insn: MOVSD	(%R10),%XMM9::  (128) 
0x10a29:::0::Insn: ADD	$0x40,%R10::  (128) 
0x10a2d:::0::Insn: MULSD	%XMM9,%XMM9::  (128) 
0x10a32:::0::Insn: ADDSD	%XMM9,%XMM0::  (128) 
0x10a37:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10a40:::0::Insn: MOVSD	-0x38(%R10),%XMM10::  (128) 
0x10a46:::0::Insn: MULSD	%XMM10,%XMM10::  (128) 
0x10a4b:::0::Insn: ADDSD	%XMM10,%XMM0::  (128) 
0x10a50:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10a59:::0::Insn: MOVSD	-0x30(%R10),%XMM11::  (128) 
0x10a5f:::0::Insn: MULSD	%XMM11,%XMM11::  (128) 
0x10a64:::0::Insn: ADDSD	%XMM11,%XMM0::  (128) 
0x10a69:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10a72:::0::Insn: MOVSD	-0x28(%R10),%XMM12::  (128) 
0x10a78:::0::Insn: MULSD	%XMM12,%XMM12::  (128) 
0x10a7d:::0::Insn: ADDSD	%XMM12,%XMM0::  (128) 
0x10a82:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10a8b:::0::Insn: MOVSD	-0x20(%R10),%XMM13::  (128) 
0x10a91:::0::Insn: MULSD	%XMM13,%XMM13::  (128) 
0x10a96:::0::Insn: ADDSD	%XMM13,%XMM0::  (128) 
0x10a9b:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10aa4:::0::Insn: MOVSD	-0x18(%R10),%XMM14::  (128) 
0x10aaa:::0::Insn: MULSD	%XMM14,%XMM14::  (128) 
0x10aaf:::0::Insn: ADDSD	%XMM14,%XMM0::  (128) 
0x10ab4:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10abd:::0::Insn: MOVSD	-0x10(%R10),%XMM15::  (128) 
0x10ac3:::0::Insn: MULSD	%XMM15,%XMM15::  (128) 
0x10ac8:::0::Insn: ADDSD	%XMM15,%XMM0::  (128) 
0x10acd:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10ad6:::0::Insn: MOVSD	-0x8(%R10),%XMM1::  (128) 
0x10adc:::0::Insn: MULSD	%XMM1,%XMM1::  (128) 
0x10ae0:::0::Insn: ADDSD	%XMM1,%XMM0::  (128) 
0x10ae4:::0::Insn: MOVSD	%XMM0,0xa8(%RSP)::  (128) 
0x10aed:::0::Insn: CMP	%R10,%R12::  (128) 
0x10af0:::0::Insn: JNE	10a24 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x16b4>::  (128) 
0x10af6:::0::Insn: MOV	$0x4c00080b,%ECX::
0x10afb:::0::Insn: MOV	$0x1,%EDX::
0x10b00:::0::Insn: MOV	%R15,%RSI::
0x10b03:::0::Insn: MOV	%R13,%RDI::
0x10b06:::0::Insn: MOV	$0x44000000,%R9D::
0x10b0c:::0::Insn: MOV	$0x58000003,%R8D::
0x10b12:::0::Insn: LEA	0x170(%RSP),%R12::
0x10b1a:::0::Insn: CALL	3930 <.plt.sec@start+0x370>::
0x10b1f:::0::Insn: MOVSD	0xa0(%RSP),%XMM0::
0x10b28:::0::Insn: PXOR	%XMM5,%XMM5::
0x10b2c:::0::Insn: UCOMISD	%XMM0,%XMM5::
0x10b30:::0::Insn: MOVAPD	%XMM0,%XMM2::
0x10b34:::0::Insn: SQRTSD	%XMM2,%XMM2::
0x10b38:::0::Insn: JA	11cf5 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2985>::
0x10b3e:::0::Insn: MOV	0x10(%RSP),%RDI::
0x10b43:::0::Insn: MOV	%R13,%RSI::
0x10b46:::0::Insn: MOVSD	%XMM2,0xa8(%RSP)::
0x10b4f:::0::Insn: LEA	0x170(%RSP),%R12::
0x10b57:::0::Insn: CALL	12080 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_>::
0x10b5c:::0::Insn: MOV	0x4(%RSP),%R8D::
0x10b61:::0::Insn: MOV	(%RSP),%R15D::
0x10b65:::0::Insn: CMP	%R15D,%R8D::
0x10b68:::0::Insn: JG	10e5d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1aed>::
0x10b6e:::0::Insn: MOV	0x1d8(%RSP),%RDI::
0x10b76:::0::Insn: MOV	0x1b0(%RSP),%RDX::
0x10b7e:::0::Insn: LEA	0x170(%RSP),%R9::
0x10b86:::0::Insn: SUB	%R8D,%R15D::
0x10b89:::0::Insn: MOV	%R9,0x18(%RSP)::
0x10b8e:::0::Insn: AND	$0x3,%R15D::
0x10b92:::0::Insn: MOVSD	(%RDX),%XMM0::
0x10b96:::0::Insn: DIVSD	-0x8(%RDI),%XMM0::
0x10b9b:::0::Insn: MOVSD	%XMM0,(%RDX)::
0x10b9f:::0::Insn: MOV	0xf0(%RSP),%RDI::
0x10ba7:::0::Insn: MOV	0x8(%RDI),%RSI::
0x10bab:::0::Insn: CMP	0x10(%RDI),%RSI::
0x10baf:::0::Insn: JE	116af <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x233f>::
0x10bb5:::0::Insn: MOVSD	%XMM0,(%RSI)::
0x10bb9:::0::Insn: ADD	$0x8,%RSI::
0x10bbd:::0::Insn: MOV	%R8D,%EBX::
0x10bc0:::0::Insn: MOV	%RSI,0x8(%RDI)::
0x10bc4:::0::Insn: LEA	0x1(%RBX),%R14D::
0x10bc8:::0::Insn: MOV	$0x8,%EBX::
0x10bcd:::0::Insn: CMP	%R14D,(%RSP)::
0x10bd1:::0::Insn: JL	10e5d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1aed>::
0x10bd7:::0::Insn: TEST	%R15D,%R15D::
0x10bda:::0::Insn: JE	10df6 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1a86>::
0x10be0:::0::Insn: CMP	$0x1,%R15D::
0x10be4:::0::Insn: JE	10c90 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1920>::
0x10bea:::0::Insn: CMP	$0x2,%R15D::
0x10bee:::0::Insn: JE	10c41 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x18d1>::
0x10bf0:::0::Insn: MOV	0xf0(%RSP),%R11::
0x10bf8:::0::Insn: MOV	0x1b0(%RSP),%RSI::
0x10c00:::0::Insn: MOV	0x1d8(%RSP),%RCX::
0x10c08:::0::Insn: LEA	0x18(%R11),%RDI::
0x10c0c:::0::Insn: MOVSD	0x8(%RSI),%XMM6::
0x10c11:::0::Insn: LEA	0x8(%RSI),%RDX::
0x10c15:::0::Insn: DIVSD	-0x8(%RCX),%XMM6::
0x10c1a:::0::Insn: MOVSD	%XMM6,0x8(%RSI)::
0x10c1f:::0::Insn: MOV	0x8(%RDI),%RSI::
0x10c23:::0::Insn: CMP	0x10(%RDI),%RSI::
0x10c27:::0::Insn: JE	11ae4 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2774>::
0x10c2d:::0::Insn: MOVSD	%XMM6,(%RSI)::
0x10c31:::0::Insn: ADD	$0x8,%RSI::
0x10c35:::0::Insn: MOV	%RSI,0x8(%RDI)::
0x10c39:::0::Insn: ADD	$0x1,%R14D::
0x10c3d:::0::Insn: ADD	$0x8,%RBX::
0x10c41:::0::Insn: MOV	0x1b0(%RSP),%RDX::
0x10c49:::0::Insn: MOV	0x1d8(%RSP),%R10::
0x10c51:::0::Insn: LEA	(%RBX,%RBX,2),%RDI::
0x10c55:::0::Insn: ADD	0xf0(%RSP),%RDI::
0x10c5d:::0::Insn: ADD	%RBX,%RDX::
0x10c60:::0::Insn: MOV	0x8(%RDI),%RSI::
0x10c64:::0::Insn: MOVSD	(%RDX),%XMM3::
0x10c68:::0::Insn: DIVSD	-0x8(%R10),%XMM3::
0x10c6e:::0::Insn: MOVSD	%XMM3,(%RDX)::
0x10c72:::0::Insn: CMP	0x10(%RDI),%RSI::
0x10c76:::0::Insn: JE	11ab5 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2745>::
0x10c7c:::0::Insn: MOVSD	%XMM3,(%RSI)::
0x10c80:::0::Insn: ADD	$0x8,%RSI::
0x10c84:::0::Insn: MOV	%RSI,0x8(%RDI)::
0x10c88:::0::Insn: ADD	$0x1,%R14D::
0x10c8c:::0::Insn: ADD	$0x8,%RBX::
0x10c90:::0::Insn: MOV	0x1b0(%RSP),%RDX::
0x10c98:::0::Insn: MOV	0x1d8(%RSP),%R12::
0x10ca0:::0::Insn: LEA	(%RBX,%RBX,2),%RDI::
0x10ca4:::0::Insn: ADD	0xf0(%RSP),%RDI::
0x10cac:::0::Insn: ADD	%RBX,%RDX::
0x10caf:::0::Insn: MOV	0x8(%RDI),%RSI::
0x10cb3:::0::Insn: MOVSD	(%RDX),%XMM4::
0x10cb7:::0::Insn: DIVSD	-0x8(%R12),%XMM4::
0x10cbe:::0::Insn: MOVSD	%XMM4,(%RDX)::
0x10cc2:::0::Insn: CMP	0x10(%RDI),%RSI::
0x10cc6:::0::Insn: JE	116c0 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2350>::
0x10ccc:::0::Insn: MOVSD	%XMM4,(%RSI)::
0x10cd0:::0::Insn: ADD	$0x8,%RSI::
0x10cd4:::0::Insn: MOV	%RSI,0x8(%RDI)::
0x10cd8:::0::Insn: ADD	$0x1,%R14D::
0x10cdc:::0::Insn: ADD	$0x8,%RBX::
0x10ce0:::0::Insn: CMP	%R14D,(%RSP)::
0x10ce4:::0::Insn: JGE	10df6 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1a86>::
0x10cea:::0::Insn: JMP	10e5d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1aed>::
0x10cf0:::0::Insn: MOVSD	%XMM8,(%RSI)::  (127) 
0x10cf5:::0::Insn: ADD	$0x8,%RSI::  (127) 
0x10cf9:::0::Insn: MOV	%RSI,0x8(%RDI)::  (127) 
0x10cfd:::0::Insn: MOV	0x1b0(%RSP),%RDX::  (127) 
0x10d05:::0::Insn: MOV	0x1d8(%RSP),%R8::  (127) 
0x10d0d:::0::Insn: ADD	$0x8,%RBX::  (127) 
0x10d11:::0::Insn: ADD	$0x1,%R14D::  (127) 
0x10d15:::0::Insn: LEA	(%RBX,%RBX,2),%RDI::  (127) 
0x10d19:::0::Insn: ADD	0xf0(%RSP),%RDI::  (127) 
0x10d21:::0::Insn: ADD	%RBX,%RDX::  (127) 
0x10d24:::0::Insn: MOV	0x8(%RDI),%RSI::  (127) 
0x10d28:::0::Insn: MOVSD	(%RDX),%XMM7::  (127) 
0x10d2c:::0::Insn: DIVSD	-0x8(%R8),%XMM7::  (127) 
0x10d32:::0::Insn: MOVSD	%XMM7,(%RDX)::  (127) 
0x10d36:::0::Insn: CMP	0x10(%RDI),%RSI::  (127) 
0x10d3a:::0::Insn: JE	1168a <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x231a>::  (127) 
0x10d40:::0::Insn: MOVSD	%XMM7,(%RSI)::  (127) 
0x10d44:::0::Insn: ADD	$0x8,%RSI::  (127) 
0x10d48:::0::Insn: MOV	%RSI,0x8(%RDI)::  (127) 
0x10d4c:::0::Insn: MOV	0x1b0(%RSP),%RDX::  (127) 
0x10d54:::0::Insn: MOV	0x1d8(%RSP),%R15::  (127) 
0x10d5c:::0::Insn: LEA	0x8(%RBX),%R9::  (127) 
0x10d60:::0::Insn: LEA	(%R9,%R9,2),%RDI::  (127) 
0x10d64:::0::Insn: ADD	0xf0(%RSP),%RDI::  (127) 
0x10d6c:::0::Insn: ADD	%R9,%RDX::  (127) 
0x10d6f:::0::Insn: MOV	0x8(%RDI),%RSI::  (127) 
0x10d73:::0::Insn: MOVSD	(%RDX),%XMM9::  (127) 
0x10d78:::0::Insn: DIVSD	-0x8(%R15),%XMM9::  (127) 
0x10d7e:::0::Insn: MOVSD	%XMM9,(%RDX)::  (127) 
0x10d83:::0::Insn: CMP	0x10(%RDI),%RSI::  (127) 
0x10d87:::0::Insn: JE	1167b <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x230b>::  (127) 
0x10d8d:::0::Insn: MOVSD	%XMM9,(%RSI)::  (127) 
0x10d92:::0::Insn: ADD	$0x8,%RSI::  (127) 
0x10d96:::0::Insn: MOV	%RSI,0x8(%RDI)::  (127) 
0x10d9a:::0::Insn: MOV	0x1b0(%RSP),%RDX::  (127) 
0x10da2:::0::Insn: MOV	0x1d8(%RSP),%RSI::  (127) 
0x10daa:::0::Insn: LEA	0x10(%RBX),%RDI::  (127) 
0x10dae:::0::Insn: ADD	%RDI,%RDX::  (127) 
0x10db1:::0::Insn: LEA	(%RDI,%RDI,2),%RDI::  (127) 
0x10db5:::0::Insn: ADD	0xf0(%RSP),%RDI::  (127) 
0x10dbd:::0::Insn: MOVSD	(%RDX),%XMM10::  (127) 
0x10dc2:::0::Insn: DIVSD	-0x8(%RSI),%XMM10::  (127) 
0x10dc8:::0::Insn: MOV	0x8(%RDI),%RSI::  (127) 
0x10dcc:::0::Insn: MOVSD	%XMM10,(%RDX)::  (127) 
0x10dd1:::0::Insn: CMP	0x10(%RDI),%RSI::  (127) 
0x10dd5:::0::Insn: JE	1166c <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x22fc>::  (127) 
0x10ddb:::0::Insn: MOVSD	%XMM10,(%RSI)::  (127) 
0x10de0:::0::Insn: ADD	$0x8,%RSI::  (127) 
0x10de4:::0::Insn: MOV	%RSI,0x8(%RDI)::  (127) 
0x10de8:::0::Insn: ADD	$0x3,%R14D::  (127) 
0x10dec:::0::Insn: ADD	$0x18,%RBX::  (127) 
0x10df0:::0::Insn: CMP	%R14D,(%RSP)::  (127) 
0x10df4:::0::Insn: JL	10e5d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1aed>::  (127) 
0x10df6:::0::Insn: MOV	0x1b0(%RSP),%RDX::  (127) 
0x10dfe:::0::Insn: MOV	0x1d8(%RSP),%RAX::  (127) 
0x10e06:::0::Insn: LEA	(%RBX,%RBX,2),%RDI::  (127) 
0x10e0a:::0::Insn: ADD	0xf0(%RSP),%RDI::  (127) 
0x10e12:::0::Insn: ADD	%RBX,%RDX::  (127) 
0x10e15:::0::Insn: MOV	0x8(%RDI),%RSI::  (127) 
0x10e19:::0::Insn: MOVSD	(%RDX),%XMM8::  (127) 
0x10e1e:::0::Insn: DIVSD	-0x8(%RAX),%XMM8::  (127) 
0x10e24:::0::Insn: MOVSD	%XMM8,(%RDX)::  (127) 
0x10e29:::0::Insn: CMP	0x10(%RDI),%RSI::  (127) 
0x10e2d:::0::Insn: JNE	10cf0 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1980>::  (127) 
0x10e33:::0::Insn: MOV	0x18(%RSP),%R12::  (127) 
0x10e38:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (127) 
0x10e3d:::0::Insn: JMP	10cfd <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x198d>::  (127) 
0x10e48:::0::Insn: MOV	0x10(%RSP),%RDI::  (129) 
0x10e4d:::0::Insn: MOV	%R13,%RDX::  (129) 
0x10e50:::0::Insn: MOV	%R14,%R12::  (129) 
0x10e53:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (129) 
0x10e58:::0::Insn: JMP	108d8 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1568>::  (129) 
0x10e5d:::0::Insn: MOV	(%RBP),%R14D::
0x10e61:::0::Insn: MOV	0x1d0(%RSP),%RDX::
0x10e69:::0::Insn: LEA	-0x1(%R14),%EBX::
0x10e6d:::0::Insn: TEST	%EBX,%EBX::
0x10e6f:::0::Insn: JLE	11098 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1d28>::
0x10e75:::0::Insn: LEA	-0x2(%R14),%R12D::
0x10e79:::0::Insn: MOV	0x110(%RSP),%R11::
0x10e81:::0::Insn: MOV	0x130(%RSP),%R10::
0x10e89:::0::Insn: XOR	%EAX,%EAX::
0x10e8b:::0::Insn: LEA	0x1(%R12),%RCX::
0x10e90:::0::Insn: MOVSD	(%RDX),%XMM0::
0x10e94:::0::Insn: AND	$0x3,%ECX::
0x10e97:::0::Insn: JE	10f86 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1c16>::
0x10e9d:::0::Insn: CMP	$0x1,%RCX::
0x10ea1:::0::Insn: JE	10f39 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1bc9>::
0x10ea7:::0::Insn: CMP	$0x2,%RCX::
0x10eab:::0::Insn: JE	10ef0 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1b80>::
0x10ead:::0::Insn: MOVSD	0x8(%RDX),%XMM11::
0x10eb3:::0::Insn: MOVSD	(%R11),%XMM12::
0x10eb8:::0::Insn: MOV	$0x1,%EAX::
0x10ebd:::0::Insn: MOVSD	(%R10),%XMM13::
0x10ec2:::0::Insn: MULSD	%XMM0,%XMM12::
0x10ec7:::0::Insn: MULSD	%XMM11,%XMM13::
0x10ecc:::0::Insn: ADDSD	%XMM13,%XMM12::
0x10ed1:::0::Insn: MOVSD	%XMM12,(%RDX)::
0x10ed6:::0::Insn: MULSD	(%R10),%XMM0::
0x10edb:::0::Insn: MULSD	(%R11),%XMM11::
0x10ee0:::0::Insn: SUBSD	%XMM0,%XMM11::
0x10ee5:::0::Insn: MOVAPD	%XMM11,%XMM0::
0x10eea:::0::Insn: MOVSD	%XMM11,0x8(%RDX)::
0x10ef0:::0::Insn: MOVSD	0x8(%RDX,%RAX,8),%XMM14::
0x10ef7:::0::Insn: MOVSD	(%R11,%RAX,8),%XMM15::
0x10efd:::0::Insn: MOVSD	(%R10,%RAX,8),%XMM1::
0x10f03:::0::Insn: MULSD	%XMM0,%XMM15::
0x10f08:::0::Insn: MULSD	%XMM14,%XMM1::
0x10f0d:::0::Insn: ADDSD	%XMM1,%XMM15::
0x10f12:::0::Insn: MOVSD	%XMM15,(%RDX,%RAX,8)::
0x10f18:::0::Insn: MULSD	(%R10,%RAX,8),%XMM0::
0x10f1e:::0::Insn: MULSD	(%R11,%RAX,8),%XMM14::
0x10f24:::0::Insn: SUBSD	%XMM0,%XMM14::
0x10f29:::0::Insn: MOVSD	%XMM14,0x8(%RDX,%RAX,8)::
0x10f30:::0::Insn: MOVAPD	%XMM14,%XMM0::
0x10f35:::0::Insn: ADD	$0x1,%RAX::
0x10f39:::0::Insn: MOVSD	0x8(%RDX,%RAX,8),%XMM5::
0x10f3f:::0::Insn: MOVSD	(%R11,%RAX,8),%XMM2::
0x10f45:::0::Insn: MOV	%RAX,%R8::
0x10f48:::0::Insn: MOVSD	(%R10,%RAX,8),%XMM6::
0x10f4e:::0::Insn: MULSD	%XMM0,%XMM2::
0x10f52:::0::Insn: MULSD	%XMM5,%XMM6::
0x10f56:::0::Insn: ADDSD	%XMM6,%XMM2::
0x10f5a:::0::Insn: MOVSD	%XMM2,(%RDX,%RAX,8)::
0x10f5f:::0::Insn: MULSD	(%R10,%RAX,8),%XMM0::
0x10f65:::0::Insn: MULSD	(%R11,%RAX,8),%XMM5::
0x10f6b:::0::Insn: SUBSD	%XMM0,%XMM5::
0x10f6f:::0::Insn: MOVSD	%XMM5,0x8(%RDX,%RAX,8)::
0x10f75:::0::Insn: MOVAPD	%XMM5,%XMM0::
0x10f79:::0::Insn: ADD	$0x1,%RAX::
0x10f7d:::0::Insn: CMP	%R8,%R12::
0x10f80:::0::Insn: JE	11098 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1d28>::
0x10f86:::0::Insn: MOVSD	0x8(%RDX,%RAX,8),%XMM4::  (126) 
0x10f8c:::0::Insn: MOVSD	(%R11,%RAX,8),%XMM8::  (126) 
0x10f92:::0::Insn: LEA	0x1(%RAX),%R9::  (126) 
0x10f96:::0::Insn: LEA	0x2(%RAX),%R15::  (126) 
0x10f9a:::0::Insn: MOVSD	(%R10,%RAX,8),%XMM3::  (126) 
0x10fa0:::0::Insn: LEA	0x3(%RAX),%RDI::  (126) 
0x10fa4:::0::Insn: MULSD	%XMM0,%XMM8::  (126) 
0x10fa9:::0::Insn: MULSD	%XMM4,%XMM3::  (126) 
0x10fad:::0::Insn: ADDSD	%XMM3,%XMM8::  (126) 
0x10fb2:::0::Insn: MOVSD	%XMM8,(%RDX,%RAX,8)::  (126) 
0x10fb8:::0::Insn: MULSD	(%R10,%RAX,8),%XMM0::  (126) 
0x10fbe:::0::Insn: MULSD	(%R11,%RAX,8),%XMM4::  (126) 
0x10fc4:::0::Insn: SUBSD	%XMM0,%XMM4::  (126) 
0x10fc8:::0::Insn: MOVSD	%XMM4,0x8(%RDX,%RAX,8)::  (126) 
0x10fce:::0::Insn: MOVSD	(%R11,%R9,8),%XMM9::  (126) 
0x10fd4:::0::Insn: MOVSD	(%R10,%R9,8),%XMM10::  (126) 
0x10fda:::0::Insn: ADD	$0x4,%RAX::  (126) 
0x10fde:::0::Insn: MOVSD	0x8(%RDX,%R9,8),%XMM7::  (126) 
0x10fe5:::0::Insn: MULSD	%XMM4,%XMM9::  (126) 
0x10fea:::0::Insn: MULSD	%XMM7,%XMM10::  (126) 
0x10fef:::0::Insn: ADDSD	%XMM10,%XMM9::  (126) 
0x10ff4:::0::Insn: MOVSD	%XMM9,(%RDX,%R9,8)::  (126) 
0x10ffa:::0::Insn: MULSD	(%R10,%R9,8),%XMM4::  (126) 
0x11000:::0::Insn: MULSD	(%R11,%R9,8),%XMM7::  (126) 
0x11006:::0::Insn: SUBSD	%XMM4,%XMM7::  (126) 
0x1100a:::0::Insn: MOVSD	%XMM7,0x8(%RDX,%R9,8)::  (126) 
0x11011:::0::Insn: MOVSD	0x8(%RDX,%R15,8),%XMM11::  (126) 
0x11018:::0::Insn: MOVSD	(%R11,%R15,8),%XMM12::  (126) 
0x1101e:::0::Insn: MOVSD	(%R10,%R15,8),%XMM13::  (126) 
0x11024:::0::Insn: MULSD	%XMM7,%XMM12::  (126) 
0x11029:::0::Insn: MULSD	%XMM11,%XMM13::  (126) 
0x1102e:::0::Insn: ADDSD	%XMM13,%XMM12::  (126) 
0x11033:::0::Insn: MOVSD	%XMM12,(%RDX,%R15,8)::  (126) 
0x11039:::0::Insn: MULSD	(%R10,%R15,8),%XMM7::  (126) 
0x1103f:::0::Insn: MULSD	(%R11,%R15,8),%XMM11::  (126) 
0x11045:::0::Insn: SUBSD	%XMM7,%XMM11::  (126) 
0x1104a:::0::Insn: MOVSD	%XMM11,0x8(%RDX,%R15,8)::  (126) 
0x11051:::0::Insn: MOVSD	0x8(%RDX,%RDI,8),%XMM0::  (126) 
0x11057:::0::Insn: MOVSD	(%R11,%RDI,8),%XMM14::  (126) 
0x1105d:::0::Insn: MOVSD	(%R10,%RDI,8),%XMM15::  (126) 
0x11063:::0::Insn: MULSD	%XMM11,%XMM14::  (126) 
0x11068:::0::Insn: MULSD	%XMM0,%XMM15::  (126) 
0x1106d:::0::Insn: ADDSD	%XMM15,%XMM14::  (126) 
0x11072:::0::Insn: MOVSD	%XMM14,(%RDX,%RDI,8)::  (126) 
0x11078:::0::Insn: MULSD	(%R10,%RDI,8),%XMM11::  (126) 
0x1107e:::0::Insn: MULSD	(%R11,%RDI,8),%XMM0::  (126) 
0x11084:::0::Insn: SUBSD	%XMM11,%XMM0::  (126) 
0x11089:::0::Insn: MOVSD	%XMM0,0x8(%RDX,%RDI,8)::  (126) 
0x1108f:::0::Insn: CMP	%RDI,%R12::  (126) 
0x11092:::0::Insn: JNE	10f86 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1c16>::  (126) 
0x11098:::0::Insn: MOVSXD	%EBX,%RSI::
0x1109b:::0::Insn: PXOR	%XMM6,%XMM6::
0x1109f:::0::Insn: MOVSD	(%RDX,%RSI,8),%XMM1::
0x110a4:::0::Insn: MOVSD	0x8(%RDX,%RSI,8),%XMM5::
0x110aa:::0::Insn: MULSD	%XMM5,%XMM5::
0x110ae:::0::Insn: MOVAPD	%XMM1,%XMM0::
0x110b2:::0::Insn: MULSD	%XMM1,%XMM0::
0x110b6:::0::Insn: ADDSD	%XMM5,%XMM0::
0x110ba:::0::Insn: MOVAPD	%XMM0,%XMM2::
0x110be:::0::Insn: UCOMISD	%XMM0,%XMM6::
0x110c2:::0::Insn: SQRTSD	%XMM2,%XMM2::
0x110c6:::0::Insn: MOVSD	%XMM2,0x18(%RSP)::
0x110cc:::0::Insn: JA	11cd5 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x2965>::
0x110d2:::0::Insn: LEA	0x110(%RSP),%RDI::
0x110da:::0::Insn: MOV	%R13,%RSI::
0x110dd:::0::Insn: DIVSD	0x18(%RSP),%XMM1::
0x110e3:::0::Insn: LEA	0x170(%RSP),%R12::
0x110eb:::0::Insn: MOVSD	%XMM1,0xa8(%RSP)::
0x110f4:::0::Insn: CALL	12080 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_>::
0x115db:::0::Insn: MOV	%R14,%RDI::  (132) 
0x115de:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (132) 
0x115e3:::0::Insn: MOV	0x198(%RSP),%RSI::  (132) 
0x115eb:::0::Insn: JMP	10260 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xef0>::  (132) 
0x1161d:::0::Insn: MOV	%R14,%RDI::  (132) 
0x11620:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (132) 
0x11625:::0::Insn: MOV	0x198(%RSP),%RSI::  (132) 
0x1162d:::0::Insn: JMP	10224 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xeb4>::  (132) 
0x11632:::0::Insn: MOV	%R14,%RDI::  (132) 
0x11635:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (132) 
0x1163a:::0::Insn: MOV	0x198(%RSP),%RSI::  (132) 
0x11642:::0::Insn: JMP	101e6 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xe76>::  (132) 
0x1166c:::0::Insn: MOV	0x18(%RSP),%R12::  (127) 
0x11671:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (127) 
0x11676:::0::Insn: JMP	10de8 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1a78>::  (127) 
0x1167b:::0::Insn: MOV	0x18(%RSP),%R12::  (127) 
0x11680:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (127) 
0x11685:::0::Insn: JMP	10d9a <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1a2a>::  (127) 
0x1168a:::0::Insn: MOV	0x18(%RSP),%R12::  (127) 
0x1168f:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::  (127) 
0x11694:::0::Insn: JMP	10d4c <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x19dc>::  (127) 
0x116af:::0::Insn: MOV	%R9,%R12::
0x116b2:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0x116b7:::0::Insn: MOV	0x4(%RSP),%EBX::
0x116bb:::0::Insn: JMP	10bc4 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1854>::
0x116c0:::0::Insn: MOV	0x18(%RSP),%R12::
0x116c5:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0x116ca:::0::Insn: JMP	10cd8 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1968>::
0x11a9d:::0::Insn: MOV	%R15,%RDX::
0x11aa0:::0::Insn: MOV	%R14,%RDI::
0x11aa3:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0x11aa8:::0::Insn: MOV	0x198(%RSP),%RSI::
0x11ab0:::0::Insn: JMP	1015d <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xded>::
0x11ab5:::0::Insn: MOV	0x18(%RSP),%R12::
0x11aba:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0x11abf:::0::Insn: JMP	10c88 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x1918>::
0x11ac4:::0::Insn: MOV	%RAX,%RDX::
0x11ac7:::0::Insn: MOV	%R14,%RDI::
0x11aca:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0x11acf:::0::Insn: MOV	0x198(%RSP),%RSI::
0x11ad7:::0::Insn: MOV	0x1a0(%RSP),%RDX::
0x11adf:::0::Insn: JMP	1011e <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0xdae>::
0x11ae4:::0::Insn: MOV	0x18(%RSP),%R12::
0x11ae9:::0::Insn: CALL	95e0 <_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_>::
0x11aee:::0::Insn: JMP	10c39 <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x18c9>::
0x11cf5:::0::Insn: MOVSD	%XMM2,0x18(%RSP)::
0x11cfb:::0::Insn: CALL	37e0 <.plt.sec@start+0x220>::
0x11d00:::0::Insn: MOVSD	0x18(%RSP),%XMM2::
0x11d06:::0::Insn: JMP	10b3e <_ZN15mX_matrix_utils5gmresEPNS_25distributed_sparse_matrixERSt6vectorIdSaIdEES5_RdS6_iS5_RiS7_+0x17ce>::
