`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:39 09/29/2016 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(rst,clk, ldMDR,ldMDB, ldMAR, ldIR, ldPC, ldR, ldSP, ldYreg, tMDR, tMAR, tPC, tR, treg, thash4, thash2, rchoosein, rchooseout, reg_write, reg_read, funSel, MDB, MAB, flags, op_code, addr_mode, dst, src1, src2);

input rst;
input ldMDR, ldMAR,ldMDB, ldIR, ldPC, ldR, ldSP, ldYreg, tMDR, tMAR, tPC, tR, treg, thash4, thash2, reg_write, reg_read, clk;
input [2:0] rchoosein, rchooseout;
input [1:0] funSel;
inout [15:0]  MDB;

output [1:0]addr_mode;
output [15:0] MAB;
output [2:0]   dst, src1, src2;
output [4:0] op_code;
output [3:0] flags;

wire [4:0] op_code_out;
wire [15:0] Xwire,Ywire,Zwire,IR_out,MDR_out,MAR_out,PC_out,R_out, Yreg_out,RegBank_out;

assign op_code = op_code_out;
assign MAB     = MAR_out;
assign Ywire   = Yreg_out;

RegisterBank rb(clk,rchoosein,rchooseout,reg_read,reg_write,Zwire,RegBank_out);
InsDecoder ins(IR_out,op_code_out,addr_mode,dst,src1,src2);
ALU_outer alu(Xwire, Ywire, Zwire, flags, funSel, clk);

Register16 IR(ldIR, Zwire, clk, IR_out);
Register16_MDB MDR(ldMDR,ldMDB, Zwire, clk, MDR_out,MDB);
Register16 MAR(ldMAR, Zwire, clk, MAR_out);
Register16_PC PC(rst,ldPC, Zwire, clk, PC_out);
Register16 R(ldR, Zwire, clk, R_out);
Register16 Yreg(ldYreg, Xwire, clk, Yreg_out);

triState ts1(MDR_out,Xwire,tMDR);
triState ts2(MAR_out,Xwire,tMAR);
triState ts3(PC_out,Xwire,tPC);
triState ts4(R_out,Xwire,tR);
triState ts6(16'd4,Xwire,thash4);
triState ts7(16'd2,Xwire,thash2);
triState ts8(RegBank_out,Xwire,treg);

endmodule
