0xd800:::0::Insn: ENDBR64::
0xd804:::0::Insn: MOV	0x88(%RDI),%RCX::
0xd80b:::0::Insn: MOV	0x90(%RDI),%R8::
0xd812:::0::Insn: MOV	0x8(%RDI),%RAX::
0xd816:::0::Insn: MOV	0x10(%RDI),%RDI::
0xd81a:::0::Insn: CMP	%RDI,%RAX::
0xd81d:::0::Insn: JE	d98e <_ZN15mX_device_utils11mX_resistor13load_matricesEv+0x18e>::
0xd823:::0::Insn: CMP	%R8,%RCX::
0xd826:::0::Insn: JE	d98e <_ZN15mX_device_utils11mX_resistor13load_matricesEv+0x18e>::
0xd82c:::0::Insn: MOV	%R8,%RDX::
0xd82f:::0::Insn: MOVSD	0x16c29(%RIP),%XMM2::
0xd837:::0::Insn: SUB	%RCX,%RDX::
0xd83a:::0::Insn: AND	$0x8,%EDX::
0xd83d:::0::Insn: JNE	d923 <_ZN15mX_device_utils11mX_resistor13load_matricesEv+0x123>::
0xd843:::0::Insn: MOV	(%RAX),%RSI::
0xd846:::0::Insn: MOVAPD	%XMM2,%XMM0::
0xd84a:::0::Insn: DIVSD	(%RCX),%XMM0::
0xd84e:::0::Insn: MOV	0x8(%RAX),%R9::
0xd852:::0::Insn: MOV	0x10(%RAX),%R10::
0xd856:::0::Insn: MOV	0x18(%RAX),%R11::
0xd85a:::0::Insn: ADD	$0x20,%RAX::
0xd85e:::0::Insn: ADD	$0x8,%RCX::
0xd862:::0::Insn: MOVSD	0x8(%RSI),%XMM1::
0xd867:::0::Insn: ADDSD	%XMM0,%XMM1::
0xd86b:::0::Insn: MOVSD	%XMM1,0x8(%RSI)::
0xd870:::0::Insn: MOVSD	0x8(%R9),%XMM3::
0xd876:::0::Insn: ADDSD	%XMM0,%XMM3::
0xd87a:::0::Insn: MOVSD	%XMM3,0x8(%R9)::
0xd880:::0::Insn: MOVSD	0x8(%R10),%XMM4::
0xd886:::0::Insn: SUBSD	%XMM0,%XMM4::
0xd88a:::0::Insn: MOVSD	%XMM4,0x8(%R10)::
0xd890:::0::Insn: MOVSD	0x8(%R11),%XMM5::
0xd896:::0::Insn: SUBSD	%XMM0,%XMM5::
0xd89a:::0::Insn: MOVSD	%XMM5,0x8(%R11)::
0xd8a0:::0::Insn: CMP	%RAX,%RDI::
0xd8a3:::0::Insn: JNE	d923 <_ZN15mX_device_utils11mX_resistor13load_matricesEv+0x123>::
0xd8a5:::0::Insn: RET::
0xd8a6:::0::Insn: NOPW	%CS:(%RAX,%RAX,1)::
0xd8b0:::0::Insn: CMP	%R11,%RDI::(111) 
0xd8b3:::0::Insn: JE	d98e <_ZN15mX_device_utils11mX_resistor13load_matricesEv+0x18e>::(111) 
0xd8b9:::0::Insn: MOV	(%R11),%RSI::(111) 
0xd8bc:::0::Insn: MOVAPD	%XMM2,%XMM12::(111) 
0xd8c1:::0::Insn: MOV	0x8(%R11),%R9::(111) 
0xd8c5:::0::Insn: ADD	$0x40,%RAX::(111) 
0xd8c9:::0::Insn: DIVSD	(%RDX),%XMM12::(111) 
0xd8ce:::0::Insn: MOV	0x10(%R11),%R10::(111) 
0xd8d2:::0::Insn: MOV	0x18(%R11),%R11::(111) 
0xd8d6:::0::Insn: ADD	$0x10,%RCX::(111) 
0xd8da:::0::Insn: MOVSD	0x8(%RSI),%XMM13::(111) 
0xd8e0:::0::Insn: ADDSD	%XMM12,%XMM13::(111) 
0xd8e5:::0::Insn: MOVSD	%XMM13,0x8(%RSI)::(111) 
0xd8eb:::0::Insn: MOVSD	0x8(%R9),%XMM14::(111) 
0xd8f1:::0::Insn: ADDSD	%XMM12,%XMM14::(111) 
0xd8f6:::0::Insn: MOVSD	%XMM14,0x8(%R9)::(111) 
0xd8fc:::0::Insn: MOVSD	0x8(%R10),%XMM15::(111) 
0xd902:::0::Insn: SUBSD	%XMM12,%XMM15::(111) 
0xd907:::0::Insn: MOVSD	%XMM15,0x8(%R10)::(111) 
0xd90d:::0::Insn: MOVSD	0x8(%R11),%XMM0::(111) 
0xd913:::0::Insn: SUBSD	%XMM12,%XMM0::(111) 
0xd918:::0::Insn: MOVSD	%XMM0,0x8(%R11)::(111) 
0xd91e:::0::Insn: CMP	%RAX,%RDI::(111) 
0xd921:::0::Insn: JE	d990 <_ZN15mX_device_utils11mX_resistor13load_matricesEv+0x190>::(111) 
0xd923:::0::Insn: MOV	(%RAX),%RDX::(111) 
0xd926:::0::Insn: MOVAPD	%XMM2,%XMM7::(111) 
0xd92a:::0::Insn: DIVSD	(%RCX),%XMM7::(111) 
0xd92e:::0::Insn: MOV	0x8(%RAX),%RSI::(111) 
0xd932:::0::Insn: MOV	0x10(%RAX),%R9::(111) 
0xd936:::0::Insn: MOV	0x18(%RAX),%R10::(111) 
0xd93a:::0::Insn: LEA	0x20(%RAX),%R11::(111) 
0xd93e:::0::Insn: MOVSD	0x8(%RDX),%XMM8::(111) 
0xd944:::0::Insn: ADDSD	%XMM7,%XMM8::(111) 
0xd949:::0::Insn: MOVSD	%XMM8,0x8(%RDX)::(111) 
0xd94f:::0::Insn: MOVSD	0x8(%RSI),%XMM9::(111) 
0xd955:::0::Insn: LEA	0x8(%RCX),%RDX::(111) 
0xd959:::0::Insn: ADDSD	%XMM7,%XMM9::(111) 
0xd95e:::0::Insn: MOVSD	%XMM9,0x8(%RSI)::(111) 
0xd964:::0::Insn: MOVSD	0x8(%R9),%XMM10::(111) 
0xd96a:::0::Insn: SUBSD	%XMM7,%XMM10::(111) 
0xd96f:::0::Insn: MOVSD	%XMM10,0x8(%R9)::(111) 
0xd975:::0::Insn: MOVSD	0x8(%R10),%XMM0::(111) 
0xd97b:::0::Insn: SUBSD	%XMM7,%XMM0::(111) 
0xd97f:::0::Insn: MOVSD	%XMM0,0x8(%R10)::(111) 
0xd985:::0::Insn: CMP	%RDX,%R8::(111) 
0xd988:::0::Insn: JNE	d8b0 <_ZN15mX_device_utils11mX_resistor13load_matricesEv+0xb0>::(111) 
0xd98e:::0::Insn: RET::
0xd98f:::0::Insn: NOP::
0xd990:::0::Insn: RET::
0xd991:::0::Insn: NOP::
0xd992:::0::Insn: NOPW	%CS:(%RAX,%RAX,1)::
0xd99d:::0::Insn: NOPL	(%RAX)::
