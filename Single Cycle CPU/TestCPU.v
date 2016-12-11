`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:03 11/18/2016
// Design Name:   CPU
// Module Name:   Z:/Xilinx/SingleCycles/TestCPU.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestCPU;

	// Inputs
	reg rst;
	reg clk;
	reg [15:0] MDB_IR;
	reg [15:0] ReadData_dm;

	// Outputs
	wire [15:0] MAB_IR;
	wire [15:0] IR;
	wire [15:0] Data_dm;
	wire [15:0] Address_dm;
	wire MemRead,MemWrite;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.rst(rst), 
		.clk(clk), 
		.MDB_IR(MDB_IR), 
		.ReadData_dm(ReadData_dm), 
		.MAB_IR(MAB_IR), 
		.IR(IR), 
		.Data_dm(Data_dm), 
		.Address_dm(Address_dm),
		.MemRead(MemRead),
		.MemWrite(MemWrite)
	);

		
	initial begin
	clk <= 0;
	forever #500 clk <= ~clk;
	end


	initial begin
		// Initialize Inputs
		rst = 1;
		
		#1200;
      rst = 0;
		MDB_IR = 16'b0000000111110001;//li
		ReadData_dm = 0;
		
		#1000;
      rst = 0;
		MDB_IR = 16'b0000100101010001;//lr
		ReadData_dm = 0;
		
		#1000;
      rst = 0;
		MDB_IR = 16'b0001000101010001;//str
		ReadData_dm = 0;
		
		#1000;
      rst = 0;
		MDB_IR = 16'b0110000101010001;//addr
		ReadData_dm = 0;
		
		#1000;
      rst = 0;
		MDB_IR = 16'b1001000100001111;//jnz
		ReadData_dm = 0;
		
		
		#1000;
      rst = 0;
		MDB_IR = 16'b1101100111110011;//jal
		ReadData_dm = 0;
		
		#4000;
      rst = 0;
		MDB_IR = 16'b1110100111110011;//jr
		ReadData_dm = 0;
		
	end
endmodule

