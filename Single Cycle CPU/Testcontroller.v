`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:45:36 11/17/2016
// Design Name:   Contra
// Module Name:   Z:/Xilinx/SingleCycles/TestController.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Contra
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestController;

	// Inputs
	reg [15:0] IR;
	reg [3:0] flags;

	// Outputs
	wire inOrNot;
	wire outOrNot;
	wire chooseOperand2;
	wire chooseWriteBack;
	wire ldRA;
	wire rst;
	wire [1:0] funSel;
	wire [1:0] choosePCUpdate;
	wire [2:0] rChooseOne;
	wire [2:0] rChooseTwo;
	wire [2:0] writeChoose;
	wire MemRead;
	wire MemWrite;

	// Instantiate the Unit Under Test (UUT)
	Contra uut (
		.inOrNot(inOrNot), 
		.outOrNot(outOrNot), 
		.chooseOperand2(chooseOperand2), 
		.chooseWriteBack(chooseWriteBack), 
		.ldRA(ldRA), 
		.rst(rst), 
		.funSel(funSel), 
		.choosePCUpdate(choosePCUpdate), 
		.rChooseOne(rChooseOne), 
		.rChooseTwo(rChooseTwo), 
		.writeChoose(writeChoose), 
		.IR(IR), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.flags(flags)
	);

	initial begin
		// Initialize Inputs
		IR = 16'b0;
		flags = 0;
		
		// Wait 100 ns for global reset to finish
		#10;
      IR = 16'b0000100000000000;
		flags = 0;  
		// Add stimulus here
		#10;
      IR = 16'b0000100000000000;
		flags = 0;  
		
		#10;
      IR = 16'b0000100000000000;
		flags = 0;  
		
		#10;
      IR = 16'b0100000000000000;
		flags = 0;  
		
		#10;
      IR = 16'b0100100000000000;
		flags = 0;  
		
		#10;
      IR = 16'b0101000000000000;
		flags = 0;  
		
		#10;
      IR = 16'b1111100000000000;
		flags = 0;  
		
		#10;
      IR = 16'b1000100000000000;
		flags = 4'b0001;
		
		#10;
      IR = 16'b1001000000000000;
		flags = 4'b0000;
		
		#10;
      IR = 16'b1001100000000000;
		flags = 4'b0001;
		
		#10;
      IR = 16'b1010000000000000;
		flags = 4'b0000;
		
	end
      
endmodule

