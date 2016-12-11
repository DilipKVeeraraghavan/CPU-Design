`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:19 09/29/2016 
// Design Name: 
// Module Name:    RegisterBank 
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
module RegisterBank(clk, rchoosein,rchooseout,reg_read,reg_write,input_wire,RegBank_out);
input [2:0] rchoosein,rchooseout;
input clk;
input reg_read,reg_write;
input [15:0] input_wire;
output [15:0] RegBank_out;

wire [7:0]loadbits;
wire [7:0]tbits;
wire [7:0]ldr;
wire [7:0]tr;

wire [15:0] r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out;

decoder indecoder(rchoosein,loadbits);
decoder outdecoder(rchooseout,tbits);

and(ldr[0],loadbits[0],reg_write);
and(ldr[1],loadbits[1],reg_write);
and(ldr[2],loadbits[2],reg_write);
and(ldr[3],loadbits[3],reg_write);
and(ldr[4],loadbits[4],reg_write);
and(ldr[5],loadbits[5],reg_write);
and(ldr[6],loadbits[6],reg_write);
and(ldr[7],loadbits[7],reg_write);

and(tr[0],tbits[0],reg_read);
and(tr[1],tbits[1],reg_read);
and(tr[2],tbits[2],reg_read);
and(tr[3],tbits[3],reg_read);
and(tr[4],tbits[4],reg_read);
and(tr[5],tbits[5],reg_read);
and(tr[6],tbits[6],reg_read);
and(tr[7],tbits[7],reg_read);

Register16 r_0(ldr[0], input_wire, clk, r0_out);
Register16 r_1(ldr[1], input_wire, clk, r1_out);
Register16 r_2(ldr[2], input_wire, clk, r2_out);
Register16 r_3(ldr[3], input_wire, clk, r3_out);
Register16 r_4(ldr[4], input_wire, clk, r4_out);
Register16 r_5(ldr[5], input_wire, clk, r5_out);
Register16 r_6(ldr[6], input_wire, clk, r6_out);
Register16 r_7(ldr[7], input_wire, clk, r7_out);

triState ts0(r0_out,RegBank_out,tr[0]);
triState ts1(r1_out,RegBank_out,tr[1]);
triState ts2(r2_out,RegBank_out,tr[2]);
triState ts3(r3_out,RegBank_out,tr[3]);
triState ts4(r4_out,RegBank_out,tr[4]);
triState ts5(r5_out,RegBank_out,tr[5]);
triState ts6(r6_out,RegBank_out,tr[6]);
triState ts7(r7_out,RegBank_out,tr[7]);

endmodule