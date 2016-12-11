`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:27:46 09/30/2016
// Design Name:   Datapath
// Module Name:   E:/FPGA/CPU/TestDatapath.v
// Project Name:  CPU
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
	reg clk;
	reg ldMDR;
	reg ldMDB;
	reg ldMAR;
	reg ldIR;
	reg ldPC;
	reg ldR;
	reg ldSP;
	reg ldYreg;
	reg tMDR;
	reg tMAR;
	reg tPC;
	reg tR;
	reg tSP;
	reg treg;
	reg thash4;
	reg thash2;
	reg [2:0] rchoosein;
	reg [2:0] rchooseout;
	reg reg_write;
	reg reg_read;
	reg [1:0] funSel;
	reg [15:0]MDB_reg;
	reg inOrOut;

	// Outputs
	wire [15:0] MAB;
	wire [3:0] flags;
	wire [4:0] op_code;
	wire [2:0] addr_mode;
	wire [2:0] dst;
	wire [2:0] src1;
	wire [2:0] src2;

	// Bidirs
	wire [15:0] MDB;
	
	assign MDB[15:0] = (inOrOut) ? (16'bzzzzzzzzzzzzzzzz):(MDB_reg[15:0]);
	
	initial begin
	clk <= 0;
	forever #5 clk <= ~clk;
	end

	// Instantiate the Unit Under Test (UUT)
	Datapath uut (
		.clk(clk), 
		.ldMDR(ldMDR), 
		.ldMDB(ldMDB), 
		.ldMAR(ldMAR), 
		.ldIR(ldIR), 
		.ldPC(ldPC), 
		.ldR(ldR), 
		.ldSP(ldSP), 
		.ldYreg(ldYreg), 
		.tMDR(tMDR), 
		.tMAR(tMAR), 
		.tPC(tPC), 
		.tR(tR), 
		.tSP(tSP), 
		.treg(treg), 
		.thash4(thash4), 
		.thash2(thash2), 
		.rchoosein(rchoosein), 
		.rchooseout(rchooseout), 
		.reg_write(reg_write), 
		.reg_read(reg_read), 
		.funSel(funSel), 
		.MDB(MDB), 
		.MAB(MAB), 
		.flags(flags), 
		.op_code(op_code), 
		.addr_mode(addr_mode), 
		.dst(dst), 
		.src1(src1), 
		.src2(src2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		MDB_reg  = 16'd72;
		ldMDB = 1;
		inOrOut = 0;
		#10;
		
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		
		tMDR = 1;
		funSel = 2'd2;
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		ldPC = 1;
		#10;
		
		
      ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		thash4 = 1;
		ldYreg = 1;
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		tPC = 1;
		funSel = 2'b00;
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		ldPC = 1;
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		tPC = 1;
		funSel = 2'd2;
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		ldR = 1;
		reg_write = 1;
		rchoosein = 3'd2;
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 1;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 1;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		reg_read = 1;
		rchooseout = 3'd2;
		
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 1;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 2'd1;
		inOrOut = 1;
		
		reg_read = 1;
		rchooseout = 3'd2;
		
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 1;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		reg_read = 1;
		rchooseout = 3'd2;
		
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 1;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 2'd3;
		inOrOut = 1;
		
		reg_read = 1;
		rchooseout = 3'd2;
		
		
		#10;
		
		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 1;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
		reg_read = 1;
		rchooseout = 3'd2;
		
		#10;

		ldMDR = 0;
		ldMDB = 0;
		ldMAR = 0;
		ldIR = 0;
		ldPC = 0;
		ldR = 0;
		ldSP = 0;
		ldYreg = 0;
		tMDR = 0;
		tMAR = 0;
		tPC = 0;
		tR = 0;
		tSP = 0;
		treg = 0;
		thash4 = 0;
		thash2 = 0;
		rchoosein = 0;
		rchooseout = 0;
		reg_write = 0;
		reg_read = 0;
		funSel = 0;
		inOrOut = 1;
		
	end
endmodule