0xdb60:::0::Insn: ENDBR64::
0xdb64:::0::Insn: MOV	0x8(%RDI),%RAX::
0xdb68:::0::Insn: MOV	0x10(%RDI),%R8::
0xdb6c:::0::Insn: MOV	0x88(%RDI),%RDX::
0xdb73:::0::Insn: MOV	0x90(%RDI),%R9::
0xdb7a:::0::Insn: CMP	%R8,%RAX::
0xdb7d:::0::Insn: JE	dcc3 <_ZN15mX_device_utils12mX_capacitor13load_matricesEv+0x163>::
0xdb83:::0::Insn: CMP	%R9,%RDX::
0xdb86:::0::Insn: JE	dcc3 <_ZN15mX_device_utils12mX_capacitor13load_matricesEv+0x163>::
0xdb8c:::0::Insn: MOV	%R9,%RCX::
0xdb8f:::0::Insn: SUB	%RDX,%RCX::
0xdb92:::0::Insn: AND	$0x8,%ECX::
0xdb95:::0::Insn: JNE	dc69 <_ZN15mX_device_utils12mX_capacitor13load_matricesEv+0x109>::
0xdb9b:::0::Insn: MOV	(%RAX),%RSI::
0xdb9e:::0::Insn: MOV	0x8(%RAX),%RDI::
0xdba2:::0::Insn: ADD	$0x20,%RAX::
0xdba6:::0::Insn: ADD	$0x8,%RDX::
0xdbaa:::0::Insn: MOV	-0x10(%RAX),%R10::
0xdbae:::0::Insn: MOV	-0x8(%RAX),%R11::
0xdbb2:::0::Insn: MOVSD	0x8(%RSI),%XMM0::
0xdbb7:::0::Insn: ADDSD	-0x8(%RDX),%XMM0::
0xdbbc:::0::Insn: MOVSD	%XMM0,0x8(%RSI)::
0xdbc1:::0::Insn: MOVSD	0x8(%RDI),%XMM1::
0xdbc6:::0::Insn: ADDSD	-0x8(%RDX),%XMM1::
0xdbcb:::0::Insn: MOVSD	%XMM1,0x8(%RDI)::
0xdbd0:::0::Insn: MOVSD	0x8(%R10),%XMM2::
0xdbd6:::0::Insn: SUBSD	-0x8(%RDX),%XMM2::
0xdbdb:::0::Insn: MOVSD	%XMM2,0x8(%R10)::
0xdbe1:::0::Insn: MOVSD	0x8(%R11),%XMM3::
0xdbe7:::0::Insn: SUBSD	-0x8(%RDX),%XMM3::
0xdbec:::0::Insn: MOVSD	%XMM3,0x8(%R11)::
0xdbf2:::0::Insn: CMP	%RAX,%R8::
0xdbf5:::0::Insn: JNE	dc69 <_ZN15mX_device_utils12mX_capacitor13load_matricesEv+0x109>::
0xdbf7:::0::Insn: RET::
0xdbf8:::0::Insn: NOPL	(%RAX,%RAX,1)::
0xdc00:::0::Insn: CMP	%R11,%R8::(113) 
0xdc03:::0::Insn: JE	dcc3 <_ZN15mX_device_utils12mX_capacitor13load_matricesEv+0x163>::(113) 
0xdc09:::0::Insn: MOV	(%R11),%RSI::(113) 
0xdc0c:::0::Insn: MOV	0x8(%R11),%RDI::(113) 
0xdc10:::0::Insn: ADD	$0x40,%RAX::(113) 
0xdc14:::0::Insn: ADD	$0x10,%RDX::(113) 
0xdc18:::0::Insn: MOV	0x10(%R11),%R10::(113) 
0xdc1c:::0::Insn: MOV	0x18(%R11),%R11::(113) 
0xdc20:::0::Insn: MOVSD	0x8(%RSI),%XMM8::(113) 
0xdc26:::0::Insn: ADDSD	(%RCX),%XMM8::(113) 
0xdc2b:::0::Insn: MOVSD	%XMM8,0x8(%RSI)::(113) 
0xdc31:::0::Insn: MOVSD	0x8(%RDI),%XMM9::(113) 
0xdc37:::0::Insn: ADDSD	(%RCX),%XMM9::(113) 
0xdc3c:::0::Insn: MOVSD	%XMM9,0x8(%RDI)::(113) 
0xdc42:::0::Insn: MOVSD	0x8(%R10),%XMM10::(113) 
0xdc48:::0::Insn: SUBSD	(%RCX),%XMM10::(113) 
0xdc4d:::0::Insn: MOVSD	%XMM10,0x8(%R10)::(113) 
0xdc53:::0::Insn: MOVSD	0x8(%R11),%XMM11::(113) 
0xdc59:::0::Insn: SUBSD	(%RCX),%XMM11::(113) 
0xdc5e:::0::Insn: MOVSD	%XMM11,0x8(%R11)::(113) 
0xdc64:::0::Insn: CMP	%RAX,%R8::(113) 
0xdc67:::0::Insn: JE	dcc8 <_ZN15mX_device_utils12mX_capacitor13load_matricesEv+0x168>::(113) 
0xdc69:::0::Insn: MOV	(%RAX),%RCX::(113) 
0xdc6c:::0::Insn: MOV	0x8(%RAX),%RSI::(113) 
0xdc70:::0::Insn: LEA	0x20(%RAX),%R11::(113) 
0xdc74:::0::Insn: MOV	0x10(%RAX),%RDI::(113) 
0xdc78:::0::Insn: MOV	0x18(%RAX),%R10::(113) 
0xdc7c:::0::Insn: MOVSD	0x8(%RCX),%XMM4::(113) 
0xdc81:::0::Insn: ADDSD	(%RDX),%XMM4::(113) 
0xdc85:::0::Insn: MOVSD	%XMM4,0x8(%RCX)::(113) 
0xdc8a:::0::Insn: MOVSD	0x8(%RSI),%XMM5::(113) 
0xdc8f:::0::Insn: ADDSD	(%RDX),%XMM5::(113) 
0xdc93:::0::Insn: LEA	0x8(%RDX),%RCX::(113) 
0xdc97:::0::Insn: MOVSD	%XMM5,0x8(%RSI)::(113) 
0xdc9c:::0::Insn: MOVSD	0x8(%RDI),%XMM6::(113) 
0xdca1:::0::Insn: SUBSD	(%RDX),%XMM6::(113) 
0xdca5:::0::Insn: MOVSD	%XMM6,0x8(%RDI)::(113) 
0xdcaa:::0::Insn: MOVSD	0x8(%R10),%XMM7::(113) 
0xdcb0:::0::Insn: SUBSD	(%RDX),%XMM7::(113) 
0xdcb4:::0::Insn: MOVSD	%XMM7,0x8(%R10)::(113) 
0xdcba:::0::Insn: CMP	%RCX,%R9::(113) 
0xdcbd:::0::Insn: JNE	dc00 <_ZN15mX_device_utils12mX_capacitor13load_matricesEv+0xa0>::(113) 
0xdcc3:::0::Insn: RET::
0xdcc4:::0::Insn: NOPL	(%RAX)::
0xdcc8:::0::Insn: RET::
0xdcc9:::0::Insn: NOP::
0xdcca:::0::Insn: NOPW	(%RAX,%RAX,1)::
