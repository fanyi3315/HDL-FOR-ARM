//////////////////////////////////////////////////////////////////////////
//				ALU operation type			//
//									//
//author:ShengYu Shen from National University of Defence University	//
//create time:2001 3 22							//
//////////////////////////////////////////////////////////////////////////

//Null imply in ALUComb and SimpleALU
`define ALUType_Null	8'b0000_0000
//only for ALUComb	
`define ALUType_Add	8'b0000_0001
`define ALUType_Sub	8'b0000_0010
`define ALUType_And	8'b0000_0011
`define ALUType_Eor	8'b0000_0100
`define ALUType_Rsb	8'b0000_0101
`define ALUType_Adc	8'b0000_0110
`define ALUType_Sbc	8'b0000_0111
`define ALUType_Rsc	8'b0000_1000
`define ALUType_Tst	8'b0000_1001
`define ALUType_Teq	8'b0000_1010
`define ALUType_Cmp	8'b0000_1011
`define ALUType_Cmn	8'b0000_1100
`define ALUType_Orr	8'b0000_1101
`define ALUType_Mov	8'b0000_1110
`define ALUType_Bic	8'b0000_1111
`define ALUType_Mvn	8'b0001_0000
`define	ALUType_Mul	8'b0001_0110
`define	ALUType_Mla	8'b0001_0111
`define	ALUType_MULL	8'b0001_1000
`define	ALUType_MUAL	8'b0001_1001
`define	ALUType_MLALMul	8'b0001_1010
`define	ALUType_MLALAdd	8'b0001_1011
`define	ALUType_SWP	8'b0001_1100

`define	ALUType_BlankOp	8'b0001_1101


//only for SimpleAlu
//move left operand to output
`define ALUType_Mvl	8'b0001_0001
//move right operand to output
`define ALUType_Mvr	8'b0001_0010
`define	ALUType_MvCPSR	8'b0001_0011
`define	ALUType_MvSPSR	8'b0001_0100
`define	ALUType_MvNextInstructionAddress	8'b0001_0101
`define	ALUType_MovMULLHigh	8'b0001_1010


`define ALUEntryStatus_Empty		2'b00
`define ALUEntryStatus_WaitOprand	2'b01
`define ALUEntryStatus_Running		2'b10
`define ALUEntryStatus_WaitForTransfer	2'b11

`define ALUEntryNumber			4

`define	Def_CurrentALUOperationWantToForwardFromMEMToNextALUOperation	((MEMType==`MEMType_LoadMainWord || MEMType==`MEMType_LoadSimpleWord || MEMType==`MEMType_LoadMainByte || MEMType==`MEMType_LoadSimpleByte) && ( (MEMTargetRegister==in_ALULeftRegister && in_ALULeftFromImm==1'b0) || (MEMTargetRegister==in_ALURightRegister && in_ALURightFromImm==1'b0) || (MEMTargetRegister==in_ALUThirdRegister && in_ALUThirdFromImm==1'b0) )  )