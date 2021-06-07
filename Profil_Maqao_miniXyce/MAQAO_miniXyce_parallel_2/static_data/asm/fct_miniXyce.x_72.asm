0x12080:::0::Insn: ENDBR64::
0x12084:::0::Insn: PUSH	%R15::
0x12086:::0::Insn: PUSH	%R14::
0x12088:::0::Insn: PUSH	%R13::
0x1208a:::0::Insn: PUSH	%R12::
0x1208c:::0::Insn: PUSH	%RBP::
0x1208d:::0::Insn: PUSH	%RBX::
0x1208e:::0::Insn: MOV	%RDI,%RBX::
0x12091:::0::Insn: SUB	$0x18,%RSP::
0x12095:::0::Insn: MOV	0x8(%RDI),%RDX::
0x12099:::0::Insn: CMP	0x10(%RDI),%RDX::
0x1209d:::0::Insn: JE	120c0 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0x40>::
0x1209f:::0::Insn: MOVSD	(%RSI),%XMM3::
0x120a3:::0::Insn: ADD	$0x8,%RDX::
0x120a7:::0::Insn: MOVSD	%XMM3,-0x8(%RDX)::
0x120ac:::0::Insn: MOV	%RDX,0x8(%RDI)::
0x120b0:::0::Insn: ADD	$0x18,%RSP::
0x120b4:::0::Insn: POP	%RBX::
0x120b5:::0::Insn: POP	%RBP::
0x120b6:::0::Insn: POP	%R12::
0x120b8:::0::Insn: POP	%R13::
0x120ba:::0::Insn: POP	%R14::
0x120bc:::0::Insn: POP	%R15::
0x120be:::0::Insn: RET::
0x120bf:::0::Insn: NOP::
0x120c0:::0::Insn: MOV	(%RDI),%R14::
0x120c3:::0::Insn: MOV	$0xfffffffffffffff,%RDI::
0x120cd:::0::Insn: SUB	%R14,%RDX::
0x120d0:::0::Insn: MOV	%RDX,%RAX::
0x120d3:::0::Insn: MOV	%RDX,%R12::
0x120d6:::0::Insn: SAR	$0x3,%RAX::
0x120da:::0::Insn: CMP	%RDI,%RAX::
0x120dd:::0::Insn: JE	1218b <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0x10b>::
0x120e3:::0::Insn: TEST	%RAX,%RAX::
0x120e6:::0::Insn: JE	12180 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0x100>::
0x120ec:::0::Insn: MOV	$0x7ffffffffffffff8,%R13::
0x120f6:::0::Insn: LEA	(%RAX,%RAX,1),%RCX::
0x120fa:::0::Insn: CMP	%RCX,%RAX::
0x120fd:::0::Insn: JBE	12170 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0xf0>::
0x120ff:::0::Insn: MOV	%R13,%RDI::
0x12102:::0::Insn: MOV	%RSI,0x8(%RSP)::
0x12107:::0::Insn: CALL	3890 <.plt.sec@start+0x2d0>::
0x1210c:::0::Insn: MOV	0x8(%RSP),%RSI::
0x12111:::0::Insn: MOV	%RAX,%RBP::
0x12114:::0::Insn: ADD	%RAX,%R13::
0x12117:::0::Insn: MOVSD	(%RSI),%XMM0::
0x1211b:::0::Insn: LEA	0x8(%RBP,%R12,1),%R15::
0x12120:::0::Insn: MOVSD	%XMM0,(%RBP,%R12,1)::
0x12127:::0::Insn: TEST	%R12,%R12::
0x1212a:::0::Insn: JG	12158 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0xd8>::
0x1212c:::0::Insn: TEST	%R14,%R14::
0x1212f:::0::Insn: JNE	12166 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0xe6>::
0x12131:::0::Insn: MOVQ	%RBP,%XMM2::
0x12136:::0::Insn: MOVQ	%R15,%XMM1::
0x1213b:::0::Insn: MOV	%R13,0x10(%RBX)::
0x1213f:::0::Insn: PUNPCKLQDQ	%XMM1,%XMM2::
0x12143:::0::Insn: MOVUPS	%XMM2,(%RBX)::
0x12146:::0::Insn: ADD	$0x18,%RSP::
0x1214a:::0::Insn: POP	%RBX::
0x1214b:::0::Insn: POP	%RBP::
0x1214c:::0::Insn: POP	%R12::
0x1214e:::0::Insn: POP	%R13::
0x12150:::0::Insn: POP	%R14::
0x12152:::0::Insn: POP	%R15::
0x12154:::0::Insn: RET::
0x12155:::0::Insn: NOPL	(%RAX)::
0x12158:::0::Insn: MOV	%R12,%RDX::
0x1215b:::0::Insn: MOV	%R14,%RSI::
0x1215e:::0::Insn: MOV	%RBP,%RDI::
0x12161:::0::Insn: CALL	3a80 <.plt.sec@start+0x4c0>::
0x12166:::0::Insn: MOV	%R14,%RDI::
0x12169:::0::Insn: CALL	3870 <.plt.sec@start+0x2b0>::
0x1216e:::0::Insn: JMP	12131 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0xb1>::
0x12170:::0::Insn: TEST	%RCX,%RCX::
0x12173:::0::Insn: JNE	12197 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0x117>::
0x12175:::0::Insn: XOR	%R13D,%R13D::
0x12178:::0::Insn: XOR	%EBP,%EBP::
0x1217a:::0::Insn: JMP	12117 <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0x97>::
0x1217c:::0::Insn: NOPL	(%RAX)::
0x12180:::0::Insn: MOV	$0x8,%R13D::
0x12186:::0::Insn: JMP	120ff <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0x7f>::
0x1218b:::0::Insn: LEA	0x7ed7(%RIP),%RDI::
0x12192:::0::Insn: CALL	36e0 <.plt.sec@start+0x120>::
0x12197:::0::Insn: CMP	%RDI,%RCX::
0x1219a:::0::Insn: CMOVBE	%RCX,%RDI::
0x1219e:::0::Insn: LEA	(,%RDI,8),%R13::
0x121a6:::0::Insn: JMP	120ff <_ZNSt6vectorIdSaIdEE12emplace_backIJdEEEvDpOT_+0x7f>::
0x121ab:::0::Insn: NOPL	(%RAX,%RAX,1)::
