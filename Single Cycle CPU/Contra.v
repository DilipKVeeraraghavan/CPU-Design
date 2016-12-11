`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:38 11/10/2016 
// Design Name: 
// Module Name:    Contra 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Contra(inOrNot,outOrNot,chooseOperand2,chooseWriteBack,ldRA,funSel,choosePCUpdate,rChooseOne,rChooseTwo,writeChoose,IR,MemRead,MemWrite,flags);


input[15:0] IR;
input[3:0] flags;
output inOrNot,outOrNot,chooseOperand2,chooseWriteBack,ldRA,MemRead,MemWrite;
output [1:0] funSel,choosePCUpdate;
output [2:0] rChooseOne,rChooseTwo,writeChoose;


reg inOrNotrg,outOrNotrg,chooseOperand2rg,chooseWriteBackrg,ldRArg,MemReadrg,MemWriterg;
reg [1:0] funSelrg,choosePCUpdaterg;
reg [2:0] rChooseOnerg,rChooseTworg,writeChooserg;

assign inOrNot = inOrNotrg;
assign outOrNot = outOrNotrg;
assign chooseOperand2= chooseOperand2rg;
assign chooseWriteBack = chooseWriteBackrg;
assign ldRA = ldRArg;
assign MemRead = MemReadrg;
assign MemWrite = MemWriterg;
assign funSel = funSelrg;
assign choosePCUpdate = choosePCUpdaterg;
assign rChooseOne = rChooseOnerg;
assign rChooseTwo = rChooseTworg;
assign writeChoose = writeChooserg;

always@(IR)begin 
	if(IR[15:11]==5'b00000)begin//li
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 1;
		outOrNotrg <= 0;
		chooseOperand2rg <= 0;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'b10;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= 3'd0;
		rChooseTworg <= 3'b0;
		writeChooserg <= IR[10:8];
	end

	else if(IR[15:11]==5'b00001)begin//lr
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 1;
		outOrNotrg <= 1;
		chooseOperand2rg <= 1;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'b10;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= 3'd0;
		rChooseTworg <= IR[10:8];
		writeChooserg <= IR[7:5];
	end
	else if(IR[15:11]==5'b00010)begin//str
		MemReadrg <= 0;
		MemWriterg <= 1;
		inOrNotrg <= 0;
		outOrNotrg <= 1;
		chooseOperand2rg <= 1;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'd0;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= IR[10:8];
		rChooseTworg <= IR[7:5];
		writeChooserg <= 3'b0;
	end
	else if(IR[15:11]==5'b01000)begin//addi
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 1;
		outOrNotrg <= 0;
		chooseOperand2rg <= 0;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'd0;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= IR[10:8];
		rChooseTworg <= 3'b0;
		writeChooserg <= IR[10:8];
	end
	else if(IR[15:11]==5'b01001)begin//subi
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 1;
		outOrNotrg <= 0;
		chooseOperand2rg <= 0;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'b01;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= IR[10:8];
		rChooseTworg <= 3'b0;
		writeChooserg <= IR[10:8];
	end
	else if(IR[15:11]==5'b01010)begin//mnsi
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 0;
		outOrNotrg <= 0;
		chooseOperand2rg <= 0;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'b01;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= IR[10:8];
		rChooseTworg <= 3'b0;
		writeChooserg <= 3'd0;
	end
	else if(IR[15:11]==5'b01100)begin//addr
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 1;
		outOrNotrg <= 1;
		chooseOperand2rg <= 1;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'd0;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= IR[10:8];
		rChooseTworg <= IR[7:5];
		writeChooserg <= IR[10:8];
	end
	else if(IR[15:11]==5'b01101)begin//subr
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 1;
		outOrNotrg <= 1;
		chooseOperand2rg <= 1;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'b01;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= IR[10:8];
		rChooseTworg <= IR[7:5];
		writeChooserg <= IR[10:8];
	end
	else if(IR[15:11]==5'b01110)begin//mnsr
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 0;
		outOrNotrg <= 1;
		chooseOperand2rg <= 1;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'b01;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= IR[10:8];
		rChooseTworg <= IR[7:5];
		writeChooserg <= 3'b0;
	end
	else if(IR[15:11]==5'b00001)begin//cmp
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 0;
		outOrNotrg <= 1;
		chooseOperand2rg <= 1;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'b11;
		choosePCUpdaterg <= 2'd2;
		rChooseOnerg <= 3'd0;
		rChooseTworg <= IR[10:8];
		writeChooserg <= IR[10:8];
	end
	else if(IR[15:11]==5'b11111)begin//j
		MemReadrg <= 0;
		MemWriterg <= 0;
		inOrNotrg <= 0;
		outOrNotrg <= 0;
		chooseOperand2rg <= 0;
		chooseWriteBackrg <= 0;
		ldRArg <= 0;
		
		funSelrg <= 2'd0;
		choosePCUpdaterg <= 2'b01;
		rChooseOnerg <= 3'd0;
		rChooseTworg <= 3'b0;
		writeChooserg <= 3'b0;
	end
	else if(IR[15:11]==5'b10001)begin//jz
		if(flags[0]==1)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
		else if(IR[15:11]==5'b10010)begin//jnz
		if(flags[0]==0)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
		else if(IR[15:11]==5'b10011)begin//jc
		if(flags[1]==1)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
		else if(IR[15:11]==5'b10100)begin//jnc
		if(flags[1]==0)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
		else if(IR[15:11]==5'b10101)begin//jv
		if(flags[2]==1)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
		else if(IR[15:11]==5'b10110)begin//jnv
		if(flags[2]==0)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
		else if(IR[15:11]==5'b10111)begin//jm
		if(flags[3]==1)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
		else if(IR[15:11]==5'b10000)begin//jnm
		if(flags[3]==0)begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
		else begin
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd2;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
		end
	end
	else if(IR[15:11]==5'b11011)begin//jal
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 1;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd1;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
	end
	else if(IR[15:11]==5'b11101)begin//jr
			MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd3;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
	end
	
	else begin 
				MemReadrg <= 0;
			MemWriterg <= 0;
			inOrNotrg <= 0;
			outOrNotrg <= 0;
			chooseOperand2rg <= 0;
			chooseWriteBackrg <= 0;
			ldRArg <= 0;
			
			funSelrg <= 2'd0;
			choosePCUpdaterg <= 2'd0;
			rChooseOnerg <= 3'd0;
			rChooseTworg <= 3'b0;
			writeChooserg <= 3'b0;
	end
end

endmodule
