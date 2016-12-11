`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:46 10/27/2016
// Design Name:   CPU
// Module Name:   E:/FPGA/CPU/TestCPU.v
// Project Name:  CPU
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
	reg CPU_rst;
	reg clk;
	reg op_complete;
	reg [15:0] MDBrg;
	reg rw;

	// Outputs
	wire [15:0] MAB;
	wire read_write;
	wire initiate_op;

	// Bidirs
	wire [15:0] MDB;

	assign MDB = (rw==1)?MDBrg:16'bzzzzzzzzzzzzzzzz;
	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CPU_rst(CPU_rst), 
		.clk(clk), 
		.MDB(MDB), 
		.MAB(MAB), 
		.read_write(read_write), 
		.initiate_op(initiate_op), 
		.op_complete(op_complete)
	);

	initial begin
	clk <= 0;
	forever #5 clk <= ~clk;
	end


	initial begin
		// Initialize Inputs
		CPU_rst = 1;
		op_complete = 0;
		rw = 0;
		// Wait 100 ns for global reset to finish
		#100;
		CPU_rst = 0; 
		#120;
		MDBrg[15:0] = 16'b0000000001000000;
		rw = 1;
		#10;
		op_complete = 1;
		#20;
		rw = 0;
		op_complete = 0;
		// Add stimulus here
		
		#120;
		MDBrg[15:0] = 16'b1111111111111111;
		rw = 1;
		#10;
		op_complete = 1;
		#20;
		rw = 0;
		op_complete = 0;
		
		
		#120;
		MDBrg[15:0] = 16'b0100000001001001;
		rw = 1;
		#10;
		op_complete = 1;
		#20;
		rw = 0;
		op_complete = 0;
		
		#120;
		MDBrg[15:0] = 16'b11111111111111111111;
		rw = 1;
		#10;
		op_complete = 1;
		#20;
		rw = 0;
		op_complete = 0;
	end
      
endmodule

