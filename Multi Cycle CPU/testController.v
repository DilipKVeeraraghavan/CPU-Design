`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:20:10 10/27/2016
// Design Name:   Controller
// Module Name:   E:/FPGA/Controller/TestController.v
// Project Name:  Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controller
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
	reg [4:0] op_code;
	reg [1:0] add_mode;
	reg [2:0] dst;
	reg [2:0] src1;
	reg [2:0] src2;
	reg [3:0] Flags;
	reg clk;
	reg rst;
	reg op_complete;

	// Outputs
	wire tReg;
	wire tMDR;
	wire tMAR;
	wire tPC;
	wire tR;
	wire thash4;
	wire thash2;
	wire ldYreg;
	wire [2:0] funSel;
	wire ldR;
	wire ldPC;
	wire ldMAR;
	wire ldMDR;
	wire ldMDB;
	wire ldIR;
	wire reg_write;
	wire reg_read;
	wire read_write;
	wire initiate_op;
	wire [2:0] rchoosein;
	wire [2:0] rchooseout;

	// Instantiate the Unit Under Test (UUT)
	Controller uut (
		.rst(rst),
		.op_code(op_code), 
		.add_mode(add_mode), 
		.dst(dst), 
		.src1(src1), 
		.src2(src2), 
		.tReg(tReg), 
		.tMDR(tMDR), 
		.tMAR(tMAR), 
		.tPC(tPC), 
		.tR(tR), 
		.thash4(thash4), 
		.thash2(thash2), 
		.ldYreg(ldYreg), 
		.funSel(funSel), 
		.Flags(Flags), 
		.ldR(ldR), 
		.ldPC(ldPC), 
		.ldMAR(ldMAR), 
		.ldMDR(ldMDR), 
		.ldMDB(ldMDB), 
		.ldIR(ldIR), 
		.reg_write(reg_write), 
		.reg_read(reg_read), 
		.read_write(read_write), 
		.initiate_op(initiate_op), 
		.rchoosein(rchoosein), 
		.rchooseout(rchooseout), 
		.clk(clk), 
		.op_complete(op_complete)
	);
	
	initial begin
	clk <= 0;
	forever #2 clk <= ~clk;
	end

	initial begin
		// Initialize Inputs
		op_code = 5'b00000;
		add_mode = 2'b00;
		dst = 3'b001;
		src1 = 3'b010;
		src2 = 3'b100;
		Flags = 4'b0;
		op_complete = 0;
		rst = 1;
		
		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
      op_complete = 1;  
		// Add stimulus here
	end
      
endmodule

