`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:13 10/27/2016 
// Design Name: 
// Module Name:    CPU 
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
module CPU(CPU_rst,clk,MDB,MAB,read_write,initiate_op,op_complete);
input clk,CPU_rst;
wire ldMDR, ldMAR,ldMDB, ldIR, ldPC, ldR, ldSP, ldYreg, tMDR, tMAR, tPC, tR,  treg, thash4, thash2, reg_write, reg_read, clk;
wire [2:0] rchoosein, rchooseout;
wire [2:0] funSel;
inout [15:0]  MDB;
output [15:0] MAB;
output read_write;
output initiate_op;
input op_complete;

wire [2:0]   dst, src1, src2;
wire [1:0]   addr_mode;
wire [3:0] flags;
wire [4:0] op_code;

reg rstrg;

Datapath path(rstrg,clk, ldMDR,ldMDB, ldMAR, ldIR, ldPC, ldR, ldSP, ldYreg, tMDR, tMAR, tPC, tR, treg, thash4, thash2, rchoosein, rchooseout, reg_write, reg_read, funSel, MDB, MAB, flags, op_code, addr_mode, dst, src1, src2);
Controller troller(rstrg,op_code,addr_mode,dst,src1,src2,treg,tMDR,tMAR,tPC,tR,thash4,thash2,ldYreg,funSel,Flags,ldR,ldPC,ldMAR,ldMDR,ldMDB,ldIR,reg_write,reg_read,read_write,initiate_op,rchoosein,rchooseout,clk,op_complete);

always@(posedge clk) begin
	if(CPU_rst) begin
		rstrg <= 1;
	end
	else begin
		rstrg <= 0;
	end
end

endmodule
