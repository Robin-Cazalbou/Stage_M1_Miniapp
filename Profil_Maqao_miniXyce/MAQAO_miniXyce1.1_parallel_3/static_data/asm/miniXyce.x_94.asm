0xc580:::0::Insn: MOV	%RCX,%R11::
0xc583:::0::Insn: ADD	$0x1,%RBP::
0xc587:::0::Insn: SUB	%RSI,%R11::
0xc58a:::0::Insn: SAR	$0x3,%R11::
0xc58e:::0::Insn: CMP	%RBP,%R11::
0xc591:::0::Insn: JBE	c6d0 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x5c0>::
0xc597:::0::Insn: MOV	(%RSI,%RBP,8),%R11::
0xc59b:::0::Insn: LEA	(,%RBP,8),%RBX::
0xc5a3:::0::Insn: MOV	%RBX,0x8(%RSP)::
0xc5a8:::0::Insn: TEST	%R11,%R11::
0xc5ab:::0::Insn: JE	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::
0xc5ad:::0::Insn: MOV	(%R11),%RBX::
0xc5b0:::0::Insn: CMP	%R11,%RBX::
0xc5b3:::0::Insn: JE	c758 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x648>::
0xc5b9:::0::Insn: PXOR	%XMM8,%XMM8::
0xc5be:::0::Insn: MOVSD	%XMM8,(%RSP)::
0xc5c4:::0::Insn: JMP	c5e7 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x4d7>::
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
0xc620:::0::Insn: MOV	0x10(%RSP),%RAX::
0xc625:::0::Insn: MOV	0x18(%RAX),%RCX::
0xc629:::0::Insn: MOV	0x40(%R12),%R8::
0xc62e:::0::Insn: TEST	%R8,%R8::
0xc631:::0::Insn: JE	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::
0xc637:::0::Insn: MOV	%R13,%RDX::
0xc63a:::0::Insn: MOV	%EBP,%R9D::
0xc63d:::0::Insn: JMP	c64c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x53c>::
0xc640:::0::Insn: MOV	%R8,%RDX::  (95) 
0xc643:::0::Insn: MOV	0x10(%R8),%R8::  (95) 
0xc647:::0::Insn: TEST	%R8,%R8::  (95) 
0xc64a:::0::Insn: JE	c65b <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x54b>::  (95) 
0xc64c:::0::Insn: CMP	%EBP,0x20(%R8)::  (95) 
0xc650:::0::Insn: JGE	c640 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x530>::  (95) 
0xc652:::0::Insn: MOV	0x18(%R8),%R8::  (95) 
0xc656:::0::Insn: TEST	%R8,%R8::  (95) 
0xc659:::0::Insn: JNE	c64c <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x53c>::  (95) 
0xc65b:::0::Insn: CMP	%RDX,%R13::
0xc65e:::0::Insn: JE	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::
0xc664:::0::Insn: CMP	%R9D,0x20(%RDX)::
0xc668:::0::Insn: JG	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::
0xc66e:::0::Insn: MOVSXD	0x24(%RDX),%RDI::
0xc672:::0::Insn: MOV	0x60(%R12),%R10::
0xc677:::0::Insn: MOVSD	(%RSP),%XMM9::
0xc67d:::0::Insn: MOVSD	%XMM9,(%R10,%RDI,8)::
0xc683:::0::Insn: JMP	c580 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x470>::
0xc758:::0::Insn: PXOR	%XMM7,%XMM7::
0xc75c:::0::Insn: MOVSD	%XMM7,(%RSP)::
0xc761:::0::Insn: JMP	c629 <_ZN12mX_DAE_utils10evaluate_bEdPNS_6mX_DAEE+0x519>::
