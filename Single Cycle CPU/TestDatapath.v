`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:58:37 11/04/2016
// Design Name:   Datapath
// Module Name:   D:/dc/Xilinx/projects/SingleCycle/TestDatapath.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestDatapath;

	// Inputs
	reg [2:0] rChooseOne;
	reg [2:0] rChooseTwo;
	reg [15:0] MDB_IR;
	reg clk;
	reg [1:0] choosePCUpdate;
	reg chooseOperand2;
	reg [1:0] funSel;
	reg inOrNot;
	reg outOrNot;
	reg chooseWriteBack;
	reg [15:0] ReadData_dm;
	reg ldRA;
	reg rst;

	// Outputs
	wire [15:0] MAB_IR;
	wire [15:0] IR;
	wire [3:0] flags;
	wire [15:0] Data_dm;
	wire [15:0] Address_dm;

	// Instantiate the Unit Under Test (UUT)
	Datapath uut (
		.rChooseOne(rChooseOne), 
		.rChooseTwo(rChooseTwo), 
		.MDB_IR(MDB_IR), 
		.MAB_IR(MAB_IR), 
		.IR(IR), 
		.clk(clk), 
		.choosePCUpdate(choosePCUpdate), 
		.chooseOperand2(chooseOperand2), 
		.funSel(funSel), 
		.inOrNot(inOrNot), 
		.outOrNot(outOrNot), 
		.flags(flags), 
		.chooseWriteBack(chooseWriteBack), 
		.Data_dm(Data_dm), 
		.Address_dm(Address_dm), 
		.ReadData_dm(ReadData_dm), 
		.ldRA(ldRA), 
		.rst(rst)
	);
	
	initial begin
	clk <= 0;
	forever #50 clk <= ~clk;
	end

	initial begin
		// Initialize Inputs
		rChooseOne = 0;
		rChooseTwo = 0;
		MDB_IR = 0;
		clk = 0;
		choosePCUpdate = 0;
		chooseOperand2 = 0;
		funSel = 0;
		inOrNot = 0;
		outOrNot = 0;
		chooseWriteBack = 0;
		ReadData_dm = 0;
		ldRA = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
       
		// 00 -> Add
		// 01 -> Sub
		// 10 -> TransX
		// 11 -> Complement
		
		#20;
		//first cycle
		rst = 0;
		rChooseOne = 3'b000;
		rChooseTwo = 3'b011;
		MDB_IR = 16'b0000001100001111;
		choosePCUpdate = 2'b10;
		chooseOperand2 = 1'b0;
		funSel = 2'b10;
		inOrNot = 1;
		outOrNot = 0;
		chooseWriteBack = 1'b0;
		ReadData_dm = 0;
		ldRA = 0;
		
		//second cycle
		#100;
		rChooseOne = 3'b011;
		rChooseTwo = 0;
		MDB_IR = 16'b0000000000000111;
		choosePCUpdate = 2'b10;
		chooseOperand2 = 0;
		funSel = 0;
		inOrNot = 1;
		outOrNot = 0;
		chooseWriteBack = 0;
		ReadData_dm = 0;
		ldRA = 0;
		
		//thirdcycle
		#100;
		
		rChooseOne = 0;
		rChooseTwo = 3'b011;
		MDB_IR = 0;
		clk = 0;
		choosePCUpdate = 2'd00;
		chooseOperand2 = 0;
		funSel = 0;
		inOrNot = 0;
		outOrNot = 1;
		chooseWriteBack = 0;
		ReadData_dm = 0;
		ldRA = 1;
		// Add stimulus here

	end
      
endmodule

