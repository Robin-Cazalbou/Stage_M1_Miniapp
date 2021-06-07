0xc110:::0::Insn: ENDBR64::
0xc114:::0::Insn: PUSH	%R15::
0xc116:::0::Insn: PUSH	%R14::
0xc118:::0::Insn: PUSH	%R13::
0xc11a:::0::Insn: PUSH	%R12::
0xc11c:::0::Insn: MOV	%RDI,%R12::
0xc11f:::0::Insn: PUSH	%RBP::
0xc120:::0::Insn: PUSH	%RBX::
0xc121:::0::Insn: SUB	$0x38,%RSP::
0xc125:::0::Insn: MOV	(%RSI),%RBX::
0xc128:::0::Insn: MOVSD	%XMM0,0x28(%RSP)::
0xc12e:::0::Insn: PXOR	%XMM0,%XMM0::
0xc132:::0::Insn: MOV	0x18(%RBX),%R13::
0xc136:::0::Insn: SUB	0x10(%RBX),%R13::
0xc13a:::0::Insn: MOV	%RSI,0x10(%RSP)::
0xc13f:::0::Insn: MOV	%R13,%RAX::
0xc142:::0::Insn: MOV	0x78(%RBX),%EBP::
0xc145:::0::Insn: MOV	0x70(%RBX),%R14::
0xc149:::0::Insn: MOVUPS	%XMM0,(%RDI)::
0xc14c:::0::Insn: SAR	$0x2,%RAX::
0xc150:::0::Insn: MOVQ	$0,0x10(%RDI)::
0xc158:::0::Insn: JE	c782 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x672>::
0xc15e:::0::Insn: MOV	$0x1fffffffffffffff,%RDX::
0xc168:::0::Insn: CMP	%RDX,%RAX::
0xc16b:::0::Insn: JA	c796 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x686>::
0xc171:::0::Insn: MOV	%R13,%RDI::
0xc174:::0::Insn: CALL	48c0 <.plt.sec@start+0x2f0>::
0xc179:::0::Insn: MOV	%RAX,%RCX::
0xc17c:::0::Insn: MOVQ	%RCX,%XMM1::
0xc181:::0::Insn: ADD	%RCX,%R13::
0xc184:::0::Insn: PUNPCKLQDQ	%XMM1,%XMM1::
0xc188:::0::Insn: MOV	%R13,0x10(%R12)::
0xc18d:::0::Insn: MOVUPS	%XMM1,(%R12)::
0xc192:::0::Insn: MOV	0x18(%RBX),%RDI::
0xc196:::0::Insn: MOV	0x10(%RBX),%RSI::
0xc19a:::0::Insn: MOV	%RDI,%R15::
0xc19d:::0::Insn: SUB	%RSI,%R15::
0xc1a0:::0::Insn: CMP	%RSI,%RDI::
0xc1a3:::0::Insn: JE	c1b3 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0xa3>::
0xc1a5:::0::Insn: MOV	%RCX,%RDI::
0xc1a8:::0::Insn: MOV	%R15,%RDX::
0xc1ab:::0::Insn: CALL	4a70 <.plt.sec@start+0x4a0>::
0xc1b0:::0::Insn: MOV	%RAX,%RCX::
0xc1b3:::0::Insn: ADD	%R15,%RCX::
0xc1b6:::0::Insn: PXOR	%XMM2,%XMM2::
0xc1ba:::0::Insn: MOV	%RCX,0x8(%R12)::
0xc1bf:::0::Insn: MOV	0x30(%RBX),%R13::
0xc1c3:::0::Insn: SUB	0x28(%RBX),%R13::
0xc1c7:::0::Insn: MOVUPS	%XMM2,0x18(%R12)::
0xc1cd:::0::Insn: MOVQ	$0,0x28(%R12)::
0xc1d6:::0::Insn: MOV	%R13,%RSI::
0xc1d9:::0::Insn: SAR	$0x2,%RSI::
0xc1dd:::0::Insn: JE	c789 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x679>::
0xc1e3:::0::Insn: MOV	$0x1fffffffffffffff,%R8::
0xc1ed:::0::Insn: CMP	%R8,%RSI::
0xc1f0:::0::Insn: JA	c791 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x681>::
0xc1f6:::0::Insn: MOV	%R13,%RDI::
0xc1f9:::0::Insn: CALL	48c0 <.plt.sec@start+0x2f0>::
0xc1fe:::0::Insn: MOV	%RAX,%R10::
0xc201:::0::Insn: MOVQ	%R10,%XMM3::
0xc206:::0::Insn: ADD	%R10,%R13::
0xc209:::0::Insn: PUNPCKLQDQ	%XMM3,%XMM3::
0xc20d:::0::Insn: MOV	%R13,0x28(%R12)::
0xc212:::0::Insn: MOVUPS	%XMM3,0x18(%R12)::
0xc218:::0::Insn: MOV	0x30(%RBX),%R9::
0xc21c:::0::Insn: MOV	0x28(%RBX),%RSI::
0xc220:::0::Insn: MOV	%R9,%R15::
0xc223:::0::Insn: SUB	%RSI,%R15::
0xc226:::0::Insn: CMP	%RSI,%R9::
0xc229:::0::Insn: JE	c239 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x129>::
0xc22b:::0::Insn: MOV	%R10,%RDI::
0xc22e:::0::Insn: MOV	%R15,%RDX::
0xc231:::0::Insn: CALL	4a70 <.plt.sec@start+0x4a0>::
0xc236:::0::Insn: MOV	%RAX,%R10::
0xc239:::0::Insn: LEA	0x88(%R12),%R11::
0xc241:::0::Insn: MOV	%EBP,0x80(%R12)::
0xc249:::0::Insn: LEA	0x38(%R12),%R13::
0xc24e:::0::Insn: ADD	%R15,%R10::
0xc251:::0::Insn: MOVQ	%R11,%XMM5::
0xc256:::0::Insn: MOV	%R14,0x78(%R12)::
0xc25b:::0::Insn: PXOR	%XMM4,%XMM4::
0xc25f:::0::Insn: LEA	0xb0(%RBX),%R14::
0xc266:::0::Insn: PUNPCKLQDQ	%XMM5,%XMM5::
0xc26a:::0::Insn: MOV	%R10,0x20(%R12)::
0xc26f:::0::Insn: MOVUPS	%XMM5,0x88(%R12)::
0xc278:::0::Insn: MOV	0xb0(%RBX),%RBP::
0xc27f:::0::Insn: MOVL	$0,0x38(%R12)::
0xc288:::0::Insn: MOVQ	$0,0x40(%R12)::
0xc291:::0::Insn: MOV	%R13,0x48(%R12)::
0xc296:::0::Insn: MOV	%R13,0x50(%R12)::
0xc29b:::0::Insn: MOVQ	$0,0x58(%R12)::
0xc2a4:::0::Insn: MOVQ	$0,0x70(%R12)::
0xc2ad:::0::Insn: MOV	%R11,0x20(%RSP)::
0xc2b2:::0::Insn: MOVQ	$0,0x98(%R12)::
0xc2be:::0::Insn: MOVUPS	%XMM4,0x60(%R12)::
0xc2c4:::0::Insn: CMP	%RBP,%R14::
0xc2c7:::0::Insn: JE	c301 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x1f1>::
0xc2c9:::0::Insn: NOPL	(%RAX)::
0xc2d0:::0::Insn: MOV	$0x18,%EDI::(102) 
0xc2d5:::0::Insn: CALL	48c0 <.plt.sec@start+0x2f0>::(102) 
0xc2da:::0::Insn: MOV	%RAX,%RDI::(102) 
0xc2dd:::0::Insn: MOV	0x10(%RBP),%RAX::(102) 
0xc2e1:::0::Insn: MOV	0x20(%RSP),%RSI::(102) 
0xc2e6:::0::Insn: MOV	%RAX,0x10(%RDI)::(102) 
0xc2ea:::0::Insn: CALL	45e0 <.plt.sec@start+0x10>::(102) 
0xc2ef:::0::Insn: MOV	(%RBP),%RBP::(102) 
0xc2f3:::0::Insn: ADDQ	$0x1,0x98(%R12)::(102) 
0xc2fc:::0::Insn: CMP	%RBP,%R14::(102) 
0xc2ff:::0::Insn: JNE	c2d0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x1c0>::(102) 
0xc301:::0::Insn: LEA	0xa0(%R12),%R15::
0xc309:::0::Insn: LEA	0xc8(%RBX),%R14::
0xc310:::0::Insn: MOVQ	$0,0xb0(%R12)::
0xc31c:::0::Insn: MOVQ	%R15,%XMM6::
0xc321:::0::Insn: PUNPCKLQDQ	%XMM6,%XMM6::
0xc325:::0::Insn: MOVUPS	%XMM6,0xa0(%R12)::
0xc32e:::0::Insn: MOV	0xc8(%RBX),%RBX::
0xc335:::0::Insn: CMP	%RBX,%R14::
0xc338:::0::Insn: JE	c36e <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x25e>::
0xc33a:::0::Insn: NOPW	(%RAX,%RAX,1)::
0xc340:::0::Insn: MOV	$0x18,%EDI::(101) 
0xc345:::0::Insn: CALL	48c0 <.plt.sec@start+0x2f0>::(101) 
0xc34a:::0::Insn: MOV	0x10(%RBX),%RDX::(101) 
0xc34e:::0::Insn: MOV	%RAX,%RDI::(101) 
0xc351:::0::Insn: MOV	%R15,%RSI::(101) 
0xc354:::0::Insn: MOV	%RDX,0x10(%RAX)::(101) 
0xc358:::0::Insn: CALL	45e0 <.plt.sec@start+0x10>::(101) 
0xc35d:::0::Insn: MOV	(%RBX),%RBX::(101) 
0xc360:::0::Insn: ADDQ	$0x1,0xb0(%R12)::(101) 
0xc369:::0::Insn: CMP	%RBX,%R14::(101) 
0xc36c:::0::Insn: JNE	c340 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x230>::(101) 
0xc36e:::0::Insn: MOV	(%R12),%RBP::
0xc372:::0::Insn: XOR	%EBX,%EBX::
0xc374:::0::Insn: CMP	0x8(%R12),%RBP::
0xc379:::0::Insn: JE	c454 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x344>::
0xc37f:::0::Insn: LEA	0x30(%R12),%RDI::
0xc384:::0::Insn: MOV	%RDI,(%RSP)::
0xc388:::0::Insn: NOPL	(%RAX,%RAX,1)::
0xc390:::0::Insn: MOV	0x40(%R12),%RCX::(99) 
0xc395:::0::Insn: TEST	%RCX,%RCX::(99) 
0xc398:::0::Insn: JE	c6f0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x5e0>::(99) 
0xc39e:::0::Insn: MOV	(%RBP),%ESI::(99) 
0xc3a1:::0::Insn: MOV	%R13,%R14::(99) 
0xc3a4:::0::Insn: JMP	c3bc <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x2ac>::(99) 
0xc3a6:::0::Insn: NOPW	%CS:(%RAX,%RAX,1)::
0xc3b0:::0::Insn: MOV	%RCX,%R14::  (100) 
0xc3b3:::0::Insn: MOV	0x10(%RCX),%RCX::  (100) 
0xc3b7:::0::Insn: TEST	%RCX,%RCX::  (100) 
0xc3ba:::0::Insn: JE	c3ca <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x2ba>::  (100) 
0xc3bc:::0::Insn: CMP	%ESI,0x20(%RCX)::  (100) 
0xc3bf:::0::Insn: JGE	c3b0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x2a0>::  (100) 
0xc3c1:::0::Insn: MOV	0x18(%RCX),%RCX::  (100) 
0xc3c5:::0::Insn: TEST	%RCX,%RCX::  (100) 
0xc3c8:::0::Insn: JNE	c3bc <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x2ac>::  (100) 
0xc3ca:::0::Insn: CMP	%R14,%R13::(99) 
0xc3cd:::0::Insn: JE	c3d5 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x2c5>::(99) 
0xc3cf:::0::Insn: CMP	0x20(%R14),%ESI::(99) 
0xc3d3:::0::Insn: JGE	c43e <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x32e>::(99) 
0xc3d5:::0::Insn: MOV	(%RSP),%R8::(99) 
0xc3d9:::0::Insn: MOV	$0x28,%EDI::(99) 
0xc3de:::0::Insn: MOV	%R14,0x18(%RSP)::(99) 
0xc3e3:::0::Insn: MOV	%R8,0x8(%RSP)::(99) 
0xc3e8:::0::Insn: CALL	48c0 <.plt.sec@start+0x2f0>::(99) 
0xc3ed:::0::Insn: MOV	(%RBP),%R9D::(99) 
0xc3f1:::0::Insn: MOV	0x18(%RSP),%RSI::(99) 
0xc3f6:::0::Insn: LEA	0x20(%RAX),%RDX::(99) 
0xc3fa:::0::Insn: MOV	%RAX,%R14::(99) 
0xc3fd:::0::Insn: MOVL	$0,0x24(%RAX)::(99) 
0xc404:::0::Insn: MOV	(%RSP),%RDI::(99) 
0xc408:::0::Insn: MOV	%R9D,0x20(%RAX)::(99) 
0xc40c:::0::Insn: CALL	d0d0 <_ZNSt8_Rb_treeIiSt4pairIKiiESt10_Select1stIS2_ESt4lessIiESaIS2_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS2_ERS1_>::(99) 
0xc411:::0::Insn: TEST	%RDX,%RDX::(99) 
0xc414:::0::Insn: JE	c690 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x580>::(99) 
0xc41a:::0::Insn: CMP	%RDX,%R13::(99) 
0xc41d:::0::Insn: JE	c428 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x318>::(99) 
0xc41f:::0::Insn: TEST	%RAX,%RAX::(99) 
0xc422:::0::Insn: JE	c728 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x618>::(99) 
0xc428:::0::Insn: MOV	$0x1,%EDI::(99) 
0xc42d:::0::Insn: MOV	%R13,%RCX::(99) 
0xc430:::0::Insn: MOV	%R14,%RSI::(99) 
0xc433:::0::Insn: CALL	45f0 <.plt.sec@start+0x20>::(99) 
0xc438:::0::Insn: ADDQ	$0x1,0x58(%R12)::(99) 
0xc43e:::0::Insn: MOV	%EBX,0x24(%R14)::(99) 
0xc442:::0::Insn: ADD	$0x4,%RBP::(99) 
0xc446:::0::Insn: ADD	$0x1,%EBX::(99) 
0xc449:::0::Insn: CMP	%RBP,0x8(%R12)::(99) 
0xc44e:::0::Insn: JNE	c390 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x280>::(99) 
0xc454:::0::Insn: LEA	0x30(%R12),%R11::
0xc459:::0::Insn: MOV	0x18(%R12),%RBP::
0xc45e:::0::Insn: MOV	%R11,(%RSP)::
0xc462:::0::Insn: CMP	%RBP,0x20(%R12)::
0xc467:::0::Insn: JE	c532 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x422>::
0xc46d:::0::Insn: NOPL	(%RAX)::
0xc470:::0::Insn: MOV	0x40(%R12),%RAX::(97) 
0xc475:::0::Insn: TEST	%RAX,%RAX::(97) 
0xc478:::0::Insn: JE	c700 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x5f0>::(97) 
0xc47e:::0::Insn: MOV	(%RBP),%EDX::(97) 
0xc481:::0::Insn: MOV	%R13,%R14::(97) 
0xc484:::0::Insn: JMP	c49c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x38c>::(97) 
0xc486:::0::Insn: NOPW	%CS:(%RAX,%RAX,1)::
0xc490:::0::Insn: MOV	%RAX,%R14::  (98) 
0xc493:::0::Insn: MOV	0x10(%RAX),%RAX::  (98) 
0xc497:::0::Insn: TEST	%RAX,%RAX::  (98) 
0xc49a:::0::Insn: JE	c4aa <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x39a>::  (98) 
0xc49c:::0::Insn: CMP	%EDX,0x20(%RAX)::  (98) 
0xc49f:::0::Insn: JGE	c490 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x380>::  (98) 
0xc4a1:::0::Insn: MOV	0x18(%RAX),%RAX::  (98) 
0xc4a5:::0::Insn: TEST	%RAX,%RAX::  (98) 
0xc4a8:::0::Insn: JNE	c49c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x38c>::  (98) 
0xc4aa:::0::Insn: CMP	%R14,%R13::(97) 
0xc4ad:::0::Insn: JE	c4b5 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x3a5>::(97) 
0xc4af:::0::Insn: CMP	0x20(%R14),%EDX::(97) 
0xc4b3:::0::Insn: JGE	c51c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x40c>::(97) 
0xc4b5:::0::Insn: MOV	(%RSP),%RDI::(97) 
0xc4b9:::0::Insn: MOV	%R14,0x18(%RSP)::(97) 
0xc4be:::0::Insn: MOV	%RDI,0x8(%RSP)::(97) 
0xc4c3:::0::Insn: MOV	$0x28,%EDI::(97) 
0xc4c8:::0::Insn: CALL	48c0 <.plt.sec@start+0x2f0>::(97) 
0xc4cd:::0::Insn: MOV	(%RBP),%ECX::(97) 
0xc4d0:::0::Insn: MOV	0x18(%RSP),%RSI::(97) 
0xc4d5:::0::Insn: LEA	0x20(%RAX),%RDX::(97) 
0xc4d9:::0::Insn: MOV	%RAX,%R14::(97) 
0xc4dc:::0::Insn: MOVL	$0,0x24(%RAX)::(97) 
0xc4e3:::0::Insn: MOV	(%RSP),%RDI::(97) 
0xc4e7:::0::Insn: MOV	%ECX,0x20(%RAX)::(97) 
0xc4ea:::0::Insn: CALL	d0d0 <_ZNSt8_Rb_treeIiSt4pairIKiiESt10_Select1stIS2_ESt4lessIiESaIS2_EE29_M_get_insert_hint_unique_posESt23_Rb_tree_const_iteratorIS2_ERS1_>::(97) 
0xc4ef:::0::Insn: TEST	%RDX,%RDX::(97) 
0xc4f2:::0::Insn: JE	c6b0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x5a0>::(97) 
0xc4f8:::0::Insn: TEST	%RAX,%RAX::(97) 
0xc4fb:::0::Insn: JNE	c506 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x3f6>::(97) 
0xc4fd:::0::Insn: CMP	%RDX,%R13::(97) 
0xc500:::0::Insn: JNE	c710 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x600>::(97) 
0xc506:::0::Insn: MOV	$0x1,%EDI::(97) 
0xc50b:::0::Insn: MOV	%R13,%RCX::(97) 
0xc50e:::0::Insn: MOV	%R14,%RSI::(97) 
0xc511:::0::Insn: CALL	45f0 <.plt.sec@start+0x20>::(97) 
0xc516:::0::Insn: ADDQ	$0x1,0x58(%R12)::(97) 
0xc51c:::0::Insn: MOV	%EBX,0x24(%R14)::(97) 
0xc520:::0::Insn: ADD	$0x4,%RBP::(97) 
0xc524:::0::Insn: ADD	$0x1,%EBX::(97) 
0xc527:::0::Insn: CMP	%RBP,0x20(%R12)::(97) 
0xc52c:::0::Insn: JNE	c470 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x360>::(97) 
0xc532:::0::Insn: MOV	0x68(%R12),%R9::
0xc537:::0::Insn: MOV	0x60(%R12),%R8::
0xc53c:::0::Insn: MOV	0x58(%R12),%RSI::
0xc541:::0::Insn: MOV	%R9,%R10::
0xc544:::0::Insn: SUB	%R8,%R10::
0xc547:::0::Insn: SAR	$0x3,%R10::
0xc54b:::0::Insn: CMP	%R10,%RSI::
0xc54e:::0::Insn: JA	c766 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x656>::
0xc554:::0::Insn: JB	c73b <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x62b>::
0xc55a:::0::Insn: MOV	0x10(%RSP),%RDX::
0xc55f:::0::Insn: XOR	%EBP,%EBP::
0xc561:::0::Insn: LEA	-0xec8(%RIP),%R14::
0xc568:::0::Insn: MOV	0x10(%RDX),%RSI::
0xc56c:::0::Insn: MOV	0x18(%RDX),%RCX::
0xc570:::0::Insn: CMP	%RSI,%RCX::
0xc573:::0::Insn: JNE	c597 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x487>::
0xc575:::0::Insn: JMP	c6d0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x5c0>::
0xc57a:::0::Insn: NOPW	(%RAX,%RAX,1)::
0xc580:::0::Insn: MOV	%RCX,%R11::(94) 
0xc583:::0::Insn: ADD	$0x1,%RBP::(94) 
0xc587:::0::Insn: SUB	%RSI,%R11::(94) 
0xc58a:::0::Insn: SAR	$0x3,%R11::(94) 
0xc58e:::0::Insn: CMP	%RBP,%R11::(94) 
0xc591:::0::Insn: JBE	c6d0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x5c0>::(94) 
0xc597:::0::Insn: MOV	(%RSI,%RBP,8),%R11::(94) 
0xc59b:::0::Insn: LEA	(,%RBP,8),%RBX::(94) 
0xc5a3:::0::Insn: MOV	%RBX,0x8(%RSP)::(94) 
0xc5a8:::0::Insn: TEST	%R11,%R11::(94) 
0xc5ab:::0::Insn: JE	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::(94) 
0xc5ad:::0::Insn: MOV	(%R11),%RBX::(94) 
0xc5b0:::0::Insn: CMP	%R11,%RBX::(94) 
0xc5b3:::0::Insn: JE	c758 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x648>::(94) 
0xc5b9:::0::Insn: PXOR	%XMM8,%XMM8::(94) 
0xc5be:::0::Insn: MOVSD	%XMM8,(%RSP)::(94) 
0xc5c4:::0::Insn: JMP	c5e7 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x4d7>::(94) 
0xc5c6:::0::Insn: NOPW	%CS:(%RAX,%RAX,1)::
0xc5d0:::0::Insn: MOVSD	0x8(%RDI),%XMM0::  (96) 
0xc5d5:::0::Insn: ADDSD	(%RSP),%XMM0::  (96) 
0xc5da:::0::Insn: MOV	(%RBX),%RBX::  (96) 
0xc5dd:::0::Insn: MOVSD	%XMM0,(%RSP)::  (96) 
0xc5e2:::0::Insn: CMP	%R11,%RBX::  (96) 
0xc5e5:::0::Insn: JE	c620 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x510>::  (96) 
0xc5e7:::0::Insn: MOV	0x10(%RBX),%RCX::  (96) 
0xc5eb:::0::Insn: MOV	(%RCX),%RDI::  (96) 
0xc5ee:::0::Insn: MOV	(%RDI),%R8::  (96) 
0xc5f1:::0::Insn: MOV	0x10(%R8),%R9::  (96) 
0xc5f5:::0::Insn: CMP	%R14,%R9::  (96) 
0xc5f8:::0::Insn: JE	c5d0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x4c0>::  (96) 
0xc5fa:::0::Insn: MOVSD	0x28(%RSP),%XMM0::  (96) 
0xc600:::0::Insn: MULSD	0x8(%RCX),%XMM0::  (96) 
0xc605:::0::Insn: CALL	%R9::  (96) 
0xc608:::0::Insn: MOV	0x10(%RSP),%RDI::  (96) 
0xc60d:::0::Insn: MOV	0x8(%RSP),%R10::  (96) 
0xc612:::0::Insn: MOV	0x10(%RDI),%RSI::  (96) 
0xc616:::0::Insn: MOV	(%RSI,%R10,1),%R11::  (96) 
0xc61a:::0::Insn: JMP	c5d5 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x4c5>::  (96) 
0xc61c:::0::Insn: NOPL	(%RAX)::
0xc620:::0::Insn: MOV	0x10(%RSP),%RAX::(94) 
0xc625:::0::Insn: MOV	0x18(%RAX),%RCX::(94) 
0xc629:::0::Insn: MOV	0x40(%R12),%R8::(94) 
0xc62e:::0::Insn: TEST	%R8,%R8::(94) 
0xc631:::0::Insn: JE	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::(94) 
0xc637:::0::Insn: MOV	%R13,%RDX::(94) 
0xc63a:::0::Insn: MOV	%EBP,%R9D::(94) 
0xc63d:::0::Insn: JMP	c64c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x53c>::(94) 
0xc63f:::0::Insn: NOP::
0xc640:::0::Insn: MOV	%R8,%RDX::  (95) 
0xc643:::0::Insn: MOV	0x10(%R8),%R8::  (95) 
0xc647:::0::Insn: TEST	%R8,%R8::  (95) 
0xc64a:::0::Insn: JE	c65b <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x54b>::  (95) 
0xc64c:::0::Insn: CMP	%EBP,0x20(%R8)::  (95) 
0xc650:::0::Insn: JGE	c640 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x530>::  (95) 
0xc652:::0::Insn: MOV	0x18(%R8),%R8::  (95) 
0xc656:::0::Insn: TEST	%R8,%R8::  (95) 
0xc659:::0::Insn: JNE	c64c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x53c>::  (95) 
0xc65b:::0::Insn: CMP	%RDX,%R13::(94) 
0xc65e:::0::Insn: JE	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::(94) 
0xc664:::0::Insn: CMP	%R9D,0x20(%RDX)::(94) 
0xc668:::0::Insn: JG	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::(94) 
0xc66e:::0::Insn: MOVSXD	0x24(%RDX),%RDI::(94) 
0xc672:::0::Insn: MOV	0x60(%R12),%R10::(94) 
0xc677:::0::Insn: MOVSD	(%RSP),%XMM9::(94) 
0xc67d:::0::Insn: MOVSD	%XMM9,(%R10,%RDI,8)::(94) 
0xc683:::0::Insn: JMP	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::(94) 
0xc688:::0::Insn: NOPL	(%RAX,%RAX,1)::
0xc690:::0::Insn: MOV	%R14,%RDI::(99) 
0xc693:::0::Insn: MOV	%RAX,0x8(%RSP)::(99) 
0xc698:::0::Insn: CALL	48b0 <.plt.sec@start+0x2e0>::(99) 
0xc69d:::0::Insn: MOV	0x8(%RSP),%R14::(99) 
0xc6a2:::0::Insn: JMP	c43e <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x32e>::(99) 
0xc6a7:::0::Insn: NOPW	(%RAX,%RAX,1)::
0xc6b0:::0::Insn: MOV	%R14,%RDI::(97) 
0xc6b3:::0::Insn: MOV	%RAX,0x8(%RSP)::(97) 
0xc6b8:::0::Insn: CALL	48b0 <.plt.sec@start+0x2e0>::(97) 
0xc6bd:::0::Insn: MOV	0x8(%RSP),%R14::(97) 
0xc6c2:::0::Insn: JMP	c51c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x40c>::(97) 
0xc6c7:::0::Insn: NOPW	(%RAX,%RAX,1)::
0xc6d0:::0::Insn: MOV	%R12,%RDI::
0xc6d3:::0::Insn: CALL	19070 <_ZN15mX_vector_utils15assemble_vectorERNS_18distributed_vectorE>::
0xc6d8:::0::Insn: ADD	$0x38,%RSP::
0xc6dc:::0::Insn: MOV	%R12,%RAX::
0xc6df:::0::Insn: POP	%RBX::
0xc6e0:::0::Insn: POP	%RBP::
0xc6e1:::0::Insn: POP	%R12::
0xc6e3:::0::Insn: POP	%R13::
0xc6e5:::0::Insn: POP	%R14::
0xc6e7:::0::Insn: POP	%R15::
0xc6e9:::0::Insn: RET::
0xc6ea:::0::Insn: NOPW	(%RAX,%RAX,1)::
0xc6f0:::0::Insn: MOV	%R13,%R14::(99) 
0xc6f3:::0::Insn: JMP	c3d5 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x2c5>::(99) 
0xc6f8:::0::Insn: NOPL	(%RAX,%RAX,1)::
0xc700:::0::Insn: MOV	%R13,%R14::(97) 
0xc703:::0::Insn: JMP	c4b5 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x3a5>::(97) 
0xc708:::0::Insn: NOPL	(%RAX,%RAX,1)::
0xc710:::0::Insn: XOR	%EDI,%EDI::(97) 
0xc712:::0::Insn: MOV	0x20(%RDX),%ESI::(97) 
0xc715:::0::Insn: CMP	%ESI,0x20(%R14)::(97) 
0xc719:::0::Insn: SETL	%DIL::(97) 
0xc71d:::0::Insn: JMP	c50b <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x3fb>::(97) 
0xc722:::0::Insn: NOPW	(%RAX,%RAX,1)::
0xc728:::0::Insn: XOR	%EDI,%EDI::(99) 
0xc72a:::0::Insn: MOV	0x20(%RDX),%R10D::(99) 
0xc72e:::0::Insn: CMP	%R10D,0x20(%R14)::(99) 
0xc732:::0::Insn: SETL	%DIL::(99) 
0xc736:::0::Insn: JMP	c42d <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x31d>::(99) 
0xc73b:::0::Insn: LEA	(%R8,%RSI,8),%R11::
0xc73f:::0::Insn: CMP	%R11,%R9::
0xc742:::0::Insn: JE	c55a <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x44a>::
0xc748:::0::Insn: MOV	%R11,0x68(%R12)::
0xc74d:::0::Insn: JMP	c55a <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x44a>::
0xc752:::0::Insn: NOPW	(%RAX,%RAX,1)::
0xc758:::0::Insn: PXOR	%XMM7,%XMM7::(94) 
0xc75c:::0::Insn: MOVSD	%XMM7,(%RSP)::(94) 
0xc761:::0::Insn: JMP	c629 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x519>::(94) 
0xc766:::0::Insn: LEA	0x30(%R12),%RAX::
0xc76b:::0::Insn: SUB	%R10,%RSI::
0xc76e:::0::Insn: LEA	0x60(%R12),%RDI::
0xc773:::0::Insn: MOV	%RAX,0x8(%RSP)::
0xc778:::0::Insn: CALL	a530 <_ZNSt6vectorIdSaIdEE17_M_default_appendEm>::
0xc77d:::0::Insn: JMP	c55a <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x44a>::
0xc782:::0::Insn: XOR	%ECX,%ECX::
0xc784:::0::Insn: JMP	c17c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x6c>::
0xc789:::0::Insn: XOR	%R10D,%R10D::
0xc78c:::0::Insn: JMP	c201 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0xf1>::
0xc791:::0::Insn: CALL	46b0 <.plt.sec@start+0xe0>::
0xc796:::0::Insn: CALL	46b0 <.plt.sec@start+0xe0>::
0xc79b:::0::Insn: ENDBR64::
0xc79f:::0::Insn: MOV	%RAX,%R13::
0xc7a2:::0::Insn: JMP	565f <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE.cold>::
0xc7a7:::0::Insn: ENDBR64::
0xc7ab:::0::Insn: MOV	%RAX,%RBX::
0xc7ae:::0::Insn: JMP	56ca <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE.cold+0x6b>::
0xc7b3:::0::Insn: ENDBR64::
0xc7b7:::0::Insn: MOV	%RAX,%RBX::
0xc7ba:::0::Insn: JMP	572a <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE.cold+0xcb>::
0xc7bf:::0::Insn: ENDBR64::
0xc7c3:::0::Insn: MOV	%RAX,%RBX::
0xc7c6:::0::Insn: JMP	5714 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE.cold+0xb5>::
0xc7cb:::0::Insn: ENDBR64::
0xc7cf:::0::Insn: MOV	%RAX,%RBX::
0xc7d2:::0::Insn: JMP	5753 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE.cold+0xf4>::
0xc7d7:::0::Insn: NOPW	(%RAX,%RAX,1)::
