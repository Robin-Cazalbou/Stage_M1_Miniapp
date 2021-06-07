0x9788:::0::Insn: MOV	(%RBP),%R10::
0x978c:::0::Insn: TEST	%R10,%R10::
0x978f:::0::Insn: JE	9850 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x110>::
0x9795:::0::Insn: MOV	(%R10),%R12::
0x9798:::0::Insn: MOV	%R10,%RAX::
0x979b:::0::Insn: CMP	%R10,%R12::
0x979e:::0::Insn: JE	97f8 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xb8>::
0x97a0:::0::Insn: PXOR	%XMM2,%XMM2::
0x97a4:::0::Insn: MOVSD	%XMM2,(%RSP)::
0x97a9:::0::Insn: JMP	97cd <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x8d>::
0x97b0:::0::Insn: MOVSD	0x8(%RDI),%XMM0::  (28) 
0x97b5:::0::Insn: MULSD	0x8(%RDX),%XMM0::  (28) 
0x97ba:::0::Insn: MOV	(%R12),%R12::  (28) 
0x97be:::0::Insn: ADDSD	(%RSP),%XMM0::  (28) 
0x97c3:::0::Insn: MOVSD	%XMM0,(%RSP)::  (28) 
0x97c8:::0::Insn: CMP	%R12,%RAX::  (28) 
0x97cb:::0::Insn: JE	9808 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xc8>::  (28) 
0x97cd:::0::Insn: MOV	0x10(%R12),%RDX::  (28) 
0x97d2:::0::Insn: MOV	(%RDX),%RDI::  (28) 
0x97d5:::0::Insn: MOV	(%RDI),%RCX::  (28) 
0x97d8:::0::Insn: MOV	(%RCX),%RSI::  (28) 
0x97db:::0::Insn: CMP	%RBX,%RSI::  (28) 
0x97de:::0::Insn: JE	97b0 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x70>::  (28) 
0x97e0:::0::Insn: MOVSD	0x8(%RSP),%XMM0::  (28) 
0x97e6:::0::Insn: CALL	%RSI::  (28) 
0x97e8:::0::Insn: MOV	0x10(%R12),%RDX::  (28) 
0x97ed:::0::Insn: MOV	(%RBP),%RAX::  (28) 
0x97f1:::0::Insn: JMP	97b5 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x75>::  (28) 
0x97f8:::0::Insn: PXOR	%XMM5,%XMM5::
0x97fc:::0::Insn: MOVSD	%XMM5,(%RSP)::
0x9801:::0::Insn: NOPL	(%RAX)::
0x9808:::0::Insn: MOV	0x8(%R13),%R12::
0x980c:::0::Insn: CMP	0x10(%R13),%R12::
0x9810:::0::Insn: JE	9870 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x130>::
0x9812:::0::Insn: MOVSD	(%RSP),%XMM3::
0x9817:::0::Insn: ADD	$0x8,%R12::
0x981b:::0::Insn: MOVSD	%XMM3,-0x8(%R12)::
0x9822:::0::Insn: MOV	%R12,0x8(%R13)::
0x9826:::0::Insn: ADD	$0x8,%RBP::
0x982a:::0::Insn: CMP	%RBP,0x18(%R14)::
0x982e:::0::Insn: JNE	9788 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x48>::
0x9850:::0::Insn: MOV	0x8(%R13),%R12::
0x9854:::0::Insn: CMP	0x10(%R13),%R12::
0x9858:::0::Insn: JE	9908 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x1c8>::
0x985e:::0::Insn: MOVQ	$0,(%R12)::
0x9866:::0::Insn: ADD	$0x8,%R12::
0x986a:::0::Insn: MOV	%R12,0x8(%R13)::
0x986e:::0::Insn: JMP	9826 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xe6>::
0x9870:::0::Insn: MOV	$0xfffffffffffffff,%R9::
0x987a:::0::Insn: MOV	(%R13),%RDI::
0x987e:::0::Insn: SUB	%RDI,%R12::
0x9881:::0::Insn: MOV	%RDI,0x10(%RSP)::
0x9886:::0::Insn: MOV	%R12,%R8::
0x9889:::0::Insn: SAR	$0x3,%R8::
0x988d:::0::Insn: CMP	%R9,%R8::
0x9890:::0::Insn: JE	9a66 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x326>::
0x9896:::0::Insn: TEST	%R8,%R8::
0x9899:::0::Insn: JE	99de <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x29e>::
0x989f:::0::Insn: MOV	$0x7ffffffffffffff8,%R15::
0x98a9:::0::Insn: LEA	(%R8,%R8,1),%R10::
0x98ad:::0::Insn: CMP	%R10,%R8::
0x98b0:::0::Insn: JBE	9991 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x251>::
0x98b6:::0::Insn: MOV	%R15,%RDI::
0x98b9:::0::Insn: CALL	3890 <.plt.sec@start+0x2d0>::
0x98be:::0::Insn: MOV	%RAX,%RCX::
0x98c1:::0::Insn: ADD	%RAX,%R15::
0x98c4:::0::Insn: MOVSD	(%RSP),%XMM4::
0x98c9:::0::Insn: LEA	0x8(%RCX,%R12,1),%RSI::
0x98ce:::0::Insn: MOV	%RSI,(%RSP)::
0x98d2:::0::Insn: MOVSD	%XMM4,(%RCX,%R12,1)::
0x98d8:::0::Insn: TEST	%R12,%R12::
0x98db:::0::Insn: JG	99b2 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x272>::
0x98e1:::0::Insn: CMPQ	$0,0x10(%RSP)::
0x98e7:::0::Insn: JNE	99c5 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x285>::
0x98ed:::0::Insn: MOVQ	%RCX,%XMM1::
0x98f2:::0::Insn: MOV	%R15,0x10(%R13)::
0x98f6:::0::Insn: MOVHPS	(%RSP),%XMM1::
0x98fa:::0::Insn: MOVUPS	%XMM1,(%R13)::
0x98ff:::0::Insn: JMP	9826 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xe6>::
0x9908:::0::Insn: MOV	$0xfffffffffffffff,%RDI::
0x9912:::0::Insn: MOV	(%R13),%RDX::
0x9916:::0::Insn: SUB	%RDX,%R12::
0x9919:::0::Insn: MOV	%RDX,(%RSP)::
0x991d:::0::Insn: MOV	%R12,%RAX::
0x9920:::0::Insn: SAR	$0x3,%RAX::
0x9924:::0::Insn: CMP	%RDI,%RAX::
0x9927:::0::Insn: JE	9a5a <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x31a>::
0x992d:::0::Insn: TEST	%RAX,%RAX::
0x9930:::0::Insn: JE	9a13 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2d3>::
0x9936:::0::Insn: MOV	$0x7ffffffffffffff8,%R15::
0x9940:::0::Insn: LEA	(%RAX,%RAX,1),%R8::
0x9944:::0::Insn: CMP	%R8,%RAX::
0x9947:::0::Insn: JBE	99a4 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x264>::
0x9949:::0::Insn: MOV	%R15,%RDI::
0x994c:::0::Insn: CALL	3890 <.plt.sec@start+0x2d0>::
0x9951:::0::Insn: MOV	%RAX,%R10::
0x9954:::0::Insn: ADD	%RAX,%R15::
0x9957:::0::Insn: LEA	0x8(%R10,%R12,1),%R11::
0x995c:::0::Insn: MOVQ	$0,(%R10,%R12,1)::
0x9964:::0::Insn: MOV	%R11,0x10(%RSP)::
0x9969:::0::Insn: TEST	%R12,%R12::
0x996c:::0::Insn: JG	99e9 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2a9>::
0x996e:::0::Insn: CMPQ	$0,(%RSP)::
0x9973:::0::Insn: JNE	99fb <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2bb>::
0x9979:::0::Insn: MOVQ	%R10,%XMM6::
0x997e:::0::Insn: MOV	%R15,0x10(%R13)::
0x9982:::0::Insn: MOVHPS	0x10(%RSP),%XMM6::
0x9987:::0::Insn: MOVUPS	%XMM6,(%R13)::
0x998c:::0::Insn: JMP	9826 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xe6>::
0x9991:::0::Insn: TEST	%R10,%R10::
0x9994:::0::Insn: JNE	9a1e <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2de>::
0x999a:::0::Insn: XOR	%R15D,%R15D::
0x999d:::0::Insn: XOR	%ECX,%ECX::
0x999f:::0::Insn: JMP	98c4 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x184>::
0x99a4:::0::Insn: TEST	%R8,%R8::
0x99a7:::0::Insn: JNE	9a3c <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2fc>::
0x99ad:::0::Insn: XOR	%R15D,%R15D::
0x99b0:::0::Insn: JMP	9957 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x217>::
0x99b2:::0::Insn: MOV	0x10(%RSP),%RSI::
0x99b7:::0::Insn: MOV	%RCX,%RDI::
0x99ba:::0::Insn: MOV	%R12,%RDX::
0x99bd:::0::Insn: CALL	3a80 <.plt.sec@start+0x4c0>::
0x99c2:::0::Insn: MOV	%RAX,%RCX::
0x99c5:::0::Insn: MOV	0x10(%RSP),%RDI::
0x99ca:::0::Insn: MOV	%RCX,0x18(%RSP)::
0x99cf:::0::Insn: CALL	3870 <.plt.sec@start+0x2b0>::
0x99d4:::0::Insn: MOV	0x18(%RSP),%RCX::
0x99d9:::0::Insn: JMP	98ed <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x1ad>::
0x99de:::0::Insn: MOV	$0x8,%R15D::
0x99e4:::0::Insn: JMP	98b6 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x176>::
0x99e9:::0::Insn: MOV	(%RSP),%RSI::
0x99ed:::0::Insn: MOV	%R10,%RDI::
0x99f0:::0::Insn: MOV	%R12,%RDX::
0x99f3:::0::Insn: CALL	3a80 <.plt.sec@start+0x4c0>::
0x99f8:::0::Insn: MOV	%RAX,%R10::
0x99fb:::0::Insn: MOV	(%RSP),%RDI::
0x99ff:::0::Insn: MOV	%R10,0x18(%RSP)::
0x9a04:::0::Insn: CALL	3870 <.plt.sec@start+0x2b0>::
0x9a09:::0::Insn: MOV	0x18(%RSP),%R10::
0x9a0e:::0::Insn: JMP	9979 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x239>::
0x9a13:::0::Insn: MOV	$0x8,%R15D::
0x9a19:::0::Insn: JMP	9949 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x209>::
0x9a1e:::0::Insn: MOV	$0xfffffffffffffff,%R11::
0x9a28:::0::Insn: CMP	%R11,%R10::
0x9a2b:::0::Insn: CMOVA	%R11,%R10::
0x9a2f:::0::Insn: LEA	(,%R10,8),%R15::
0x9a37:::0::Insn: JMP	98b6 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x176>::
0x9a3c:::0::Insn: MOV	$0xfffffffffffffff,%R9::
0x9a46:::0::Insn: CMP	%R9,%R8::
0x9a49:::0::Insn: CMOVA	%R9,%R8::
0x9a4d:::0::Insn: LEA	(,%R8,8),%R15::
0x9a55:::0::Insn: JMP	9949 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x209>::
