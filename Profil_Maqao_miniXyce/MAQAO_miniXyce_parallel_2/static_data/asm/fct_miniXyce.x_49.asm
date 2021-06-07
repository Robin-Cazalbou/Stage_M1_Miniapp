0x9740:::0::Insn: ENDBR64::
0x9744:::0::Insn: PUSH	%R15::
0x9746:::0::Insn: PUSH	%R14::
0x9748:::0::Insn: PUSH	%R13::
0x974a:::0::Insn: MOV	%RDI,%R13::
0x974d:::0::Insn: PUSH	%R12::
0x974f:::0::Insn: PUSH	%RBP::
0x9750:::0::Insn: PUSH	%RBX::
0x9751:::0::Insn: SUB	$0x28,%RSP::
0x9755:::0::Insn: MOVQ	$0,0x10(%RDI)::
0x975d:::0::Insn: MOV	0x10(%RSI),%RBP::
0x9761:::0::Insn: MOVSD	%XMM0,0x8(%RSP)::
0x9767:::0::Insn: PXOR	%XMM0,%XMM0::
0x976b:::0::Insn: MOVUPS	%XMM0,(%RDI)::
0x976e:::0::Insn: CMP	0x18(%RSI),%RBP::
0x9772:::0::Insn: JE	9834 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xf4>::
0x9778:::0::Insn: MOV	%RSI,%R14::
0x977b:::0::Insn: LEA	-0x1b2(%RIP),%RBX::
0x9782:::0::Insn: NOPW	(%RAX,%RAX,1)::
0x9788:::0::Insn: MOV	(%RBP),%R10::(27) 
0x978c:::0::Insn: TEST	%R10,%R10::(27) 
0x978f:::0::Insn: JE	9850 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x110>::(27) 
0x9795:::0::Insn: MOV	(%R10),%R12::(27) 
0x9798:::0::Insn: MOV	%R10,%RAX::(27) 
0x979b:::0::Insn: CMP	%R10,%R12::(27) 
0x979e:::0::Insn: JE	97f8 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xb8>::(27) 
0x97a0:::0::Insn: PXOR	%XMM2,%XMM2::(27) 
0x97a4:::0::Insn: MOVSD	%XMM2,(%RSP)::(27) 
0x97a9:::0::Insn: JMP	97cd <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x8d>::(27) 
0x97ab:::0::Insn: NOPL	(%RAX,%RAX,1)::
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
0x97f3:::0::Insn: NOPL	(%RAX,%RAX,1)::
0x97f8:::0::Insn: PXOR	%XMM5,%XMM5::(27) 
0x97fc:::0::Insn: MOVSD	%XMM5,(%RSP)::(27) 
0x9801:::0::Insn: NOPL	(%RAX)::(27) 
0x9808:::0::Insn: MOV	0x8(%R13),%R12::(27) 
0x980c:::0::Insn: CMP	0x10(%R13),%R12::(27) 
0x9810:::0::Insn: JE	9870 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x130>::(27) 
0x9812:::0::Insn: MOVSD	(%RSP),%XMM3::(27) 
0x9817:::0::Insn: ADD	$0x8,%R12::(27) 
0x981b:::0::Insn: MOVSD	%XMM3,-0x8(%R12)::(27) 
0x9822:::0::Insn: MOV	%R12,0x8(%R13)::(27) 
0x9826:::0::Insn: ADD	$0x8,%RBP::(27) 
0x982a:::0::Insn: CMP	%RBP,0x18(%R14)::(27) 
0x982e:::0::Insn: JNE	9788 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x48>::(27) 
0x9834:::0::Insn: ADD	$0x28,%RSP::
0x9838:::0::Insn: MOV	%R13,%RAX::
0x983b:::0::Insn: POP	%RBX::
0x983c:::0::Insn: POP	%RBP::
0x983d:::0::Insn: POP	%R12::
0x983f:::0::Insn: POP	%R13::
0x9841:::0::Insn: POP	%R14::
0x9843:::0::Insn: POP	%R15::
0x9845:::0::Insn: RET::
0x9846:::0::Insn: NOPW	%CS:(%RAX,%RAX,1)::
0x9850:::0::Insn: MOV	0x8(%R13),%R12::(27) 
0x9854:::0::Insn: CMP	0x10(%R13),%R12::(27) 
0x9858:::0::Insn: JE	9908 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x1c8>::(27) 
0x985e:::0::Insn: MOVQ	$0,(%R12)::(27) 
0x9866:::0::Insn: ADD	$0x8,%R12::(27) 
0x986a:::0::Insn: MOV	%R12,0x8(%R13)::(27) 
0x986e:::0::Insn: JMP	9826 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xe6>::(27) 
0x9870:::0::Insn: MOV	$0xfffffffffffffff,%R9::(27) 
0x987a:::0::Insn: MOV	(%R13),%RDI::(27) 
0x987e:::0::Insn: SUB	%RDI,%R12::(27) 
0x9881:::0::Insn: MOV	%RDI,0x10(%RSP)::(27) 
0x9886:::0::Insn: MOV	%R12,%R8::(27) 
0x9889:::0::Insn: SAR	$0x3,%R8::(27) 
0x988d:::0::Insn: CMP	%R9,%R8::(27) 
0x9890:::0::Insn: JE	9a66 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x326>::(27) 
0x9896:::0::Insn: TEST	%R8,%R8::(27) 
0x9899:::0::Insn: JE	99de <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x29e>::(27) 
0x989f:::0::Insn: MOV	$0x7ffffffffffffff8,%R15::(27) 
0x98a9:::0::Insn: LEA	(%R8,%R8,1),%R10::(27) 
0x98ad:::0::Insn: CMP	%R10,%R8::(27) 
0x98b0:::0::Insn: JBE	9991 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x251>::(27) 
0x98b6:::0::Insn: MOV	%R15,%RDI::(27) 
0x98b9:::0::Insn: CALL	3890 <.plt.sec@start+0x2d0>::(27) 
0x98be:::0::Insn: MOV	%RAX,%RCX::(27) 
0x98c1:::0::Insn: ADD	%RAX,%R15::(27) 
0x98c4:::0::Insn: MOVSD	(%RSP),%XMM4::(27) 
0x98c9:::0::Insn: LEA	0x8(%RCX,%R12,1),%RSI::(27) 
0x98ce:::0::Insn: MOV	%RSI,(%RSP)::(27) 
0x98d2:::0::Insn: MOVSD	%XMM4,(%RCX,%R12,1)::(27) 
0x98d8:::0::Insn: TEST	%R12,%R12::(27) 
0x98db:::0::Insn: JG	99b2 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x272>::(27) 
0x98e1:::0::Insn: CMPQ	$0,0x10(%RSP)::(27) 
0x98e7:::0::Insn: JNE	99c5 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x285>::(27) 
0x98ed:::0::Insn: MOVQ	%RCX,%XMM1::(27) 
0x98f2:::0::Insn: MOV	%R15,0x10(%R13)::(27) 
0x98f6:::0::Insn: MOVHPS	(%RSP),%XMM1::(27) 
0x98fa:::0::Insn: MOVUPS	%XMM1,(%R13)::(27) 
0x98ff:::0::Insn: JMP	9826 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xe6>::(27) 
0x9904:::0::Insn: NOPL	(%RAX)::
0x9908:::0::Insn: MOV	$0xfffffffffffffff,%RDI::(27) 
0x9912:::0::Insn: MOV	(%R13),%RDX::(27) 
0x9916:::0::Insn: SUB	%RDX,%R12::(27) 
0x9919:::0::Insn: MOV	%RDX,(%RSP)::(27) 
0x991d:::0::Insn: MOV	%R12,%RAX::(27) 
0x9920:::0::Insn: SAR	$0x3,%RAX::(27) 
0x9924:::0::Insn: CMP	%RDI,%RAX::(27) 
0x9927:::0::Insn: JE	9a5a <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x31a>::(27) 
0x992d:::0::Insn: TEST	%RAX,%RAX::(27) 
0x9930:::0::Insn: JE	9a13 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2d3>::(27) 
0x9936:::0::Insn: MOV	$0x7ffffffffffffff8,%R15::(27) 
0x9940:::0::Insn: LEA	(%RAX,%RAX,1),%R8::(27) 
0x9944:::0::Insn: CMP	%R8,%RAX::(27) 
0x9947:::0::Insn: JBE	99a4 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x264>::(27) 
0x9949:::0::Insn: MOV	%R15,%RDI::(27) 
0x994c:::0::Insn: CALL	3890 <.plt.sec@start+0x2d0>::(27) 
0x9951:::0::Insn: MOV	%RAX,%R10::(27) 
0x9954:::0::Insn: ADD	%RAX,%R15::(27) 
0x9957:::0::Insn: LEA	0x8(%R10,%R12,1),%R11::(27) 
0x995c:::0::Insn: MOVQ	$0,(%R10,%R12,1)::(27) 
0x9964:::0::Insn: MOV	%R11,0x10(%RSP)::(27) 
0x9969:::0::Insn: TEST	%R12,%R12::(27) 
0x996c:::0::Insn: JG	99e9 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2a9>::(27) 
0x996e:::0::Insn: CMPQ	$0,(%RSP)::(27) 
0x9973:::0::Insn: JNE	99fb <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2bb>::(27) 
0x9979:::0::Insn: MOVQ	%R10,%XMM6::(27) 
0x997e:::0::Insn: MOV	%R15,0x10(%R13)::(27) 
0x9982:::0::Insn: MOVHPS	0x10(%RSP),%XMM6::(27) 
0x9987:::0::Insn: MOVUPS	%XMM6,(%R13)::(27) 
0x998c:::0::Insn: JMP	9826 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0xe6>::(27) 
0x9991:::0::Insn: TEST	%R10,%R10::(27) 
0x9994:::0::Insn: JNE	9a1e <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2de>::(27) 
0x999a:::0::Insn: XOR	%R15D,%R15D::(27) 
0x999d:::0::Insn: XOR	%ECX,%ECX::(27) 
0x999f:::0::Insn: JMP	98c4 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x184>::(27) 
0x99a4:::0::Insn: TEST	%R8,%R8::(27) 
0x99a7:::0::Insn: JNE	9a3c <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x2fc>::(27) 
0x99ad:::0::Insn: XOR	%R15D,%R15D::(27) 
0x99b0:::0::Insn: JMP	9957 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x217>::(27) 
0x99b2:::0::Insn: MOV	0x10(%RSP),%RSI::(27) 
0x99b7:::0::Insn: MOV	%RCX,%RDI::(27) 
0x99ba:::0::Insn: MOV	%R12,%RDX::(27) 
0x99bd:::0::Insn: CALL	3a80 <.plt.sec@start+0x4c0>::(27) 
0x99c2:::0::Insn: MOV	%RAX,%RCX::(27) 
0x99c5:::0::Insn: MOV	0x10(%RSP),%RDI::(27) 
0x99ca:::0::Insn: MOV	%RCX,0x18(%RSP)::(27) 
0x99cf:::0::Insn: CALL	3870 <.plt.sec@start+0x2b0>::(27) 
0x99d4:::0::Insn: MOV	0x18(%RSP),%RCX::(27) 
0x99d9:::0::Insn: JMP	98ed <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x1ad>::(27) 
0x99de:::0::Insn: MOV	$0x8,%R15D::(27) 
0x99e4:::0::Insn: JMP	98b6 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x176>::(27) 
0x99e9:::0::Insn: MOV	(%RSP),%RSI::(27) 
0x99ed:::0::Insn: MOV	%R10,%RDI::(27) 
0x99f0:::0::Insn: MOV	%R12,%RDX::(27) 
0x99f3:::0::Insn: CALL	3a80 <.plt.sec@start+0x4c0>::(27) 
0x99f8:::0::Insn: MOV	%RAX,%R10::(27) 
0x99fb:::0::Insn: MOV	(%RSP),%RDI::(27) 
0x99ff:::0::Insn: MOV	%R10,0x18(%RSP)::(27) 
0x9a04:::0::Insn: CALL	3870 <.plt.sec@start+0x2b0>::(27) 
0x9a09:::0::Insn: MOV	0x18(%RSP),%R10::(27) 
0x9a0e:::0::Insn: JMP	9979 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x239>::(27) 
0x9a13:::0::Insn: MOV	$0x8,%R15D::(27) 
0x9a19:::0::Insn: JMP	9949 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x209>::(27) 
0x9a1e:::0::Insn: MOV	$0xfffffffffffffff,%R11::(27) 
0x9a28:::0::Insn: CMP	%R11,%R10::(27) 
0x9a2b:::0::Insn: CMOVA	%R11,%R10::(27) 
0x9a2f:::0::Insn: LEA	(,%R10,8),%R15::(27) 
0x9a37:::0::Insn: JMP	98b6 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x176>::(27) 
0x9a3c:::0::Insn: MOV	$0xfffffffffffffff,%R9::(27) 
0x9a46:::0::Insn: CMP	%R9,%R8::(27) 
0x9a49:::0::Insn: CMOVA	%R9,%R8::(27) 
0x9a4d:::0::Insn: LEA	(,%R8,8),%R15::(27) 
0x9a55:::0::Insn: JMP	9949 <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE+0x209>::(27) 
0x9a5a:::0::Insn: LEA	0x10608(%RIP),%RDI::
0x9a61:::0::Insn: CALL	36e0 <.plt.sec@start+0x120>::
0x9a66:::0::Insn: LEA	0x105fc(%RIP),%RDI::
0x9a6d:::0::Insn: CALL	36e0 <.plt.sec@start+0x120>::
0x9a72:::0::Insn: ENDBR64::
0x9a76:::0::Insn: MOV	%RAX,%RBP::
0x9a79:::0::Insn: JMP	442e <_ZN19mX_linear_DAE_utils10evaluate_bEdPNS_13mX_linear_DAEE.cold>::
0x9a7e:::0::Insn: XCHG	%AX,%AX::
