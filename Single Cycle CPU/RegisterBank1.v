`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:55 11/04/2016 
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
module RegisterBank(rChooseOne,rChooseTwo,writeChoose,inOrNot,outOrNot,input_wire,out1,out2,clk);

input [2:0] rChooseOne,rChooseTwo,writeChoose;
input inOrNot,outOrNot,clk;
input [15:0] input_wire;

output [15:0]out1,out2;

wire [15:0] r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out;
wire [7:0]loadbits;
wire [7:0]tbits_one;
wire [7:0]tbits_two;
wire [7:0]ldr;
wire [7:0]tr_one;
wire [7:0]tr_two;

decoder indecoder(writeChoose,loadbits);
decoder outdecoderone(rChooseOne,tbits_one);
decoder outdecodertwo(rChooseTwo,tbits_two);

and(ldr[0],loadbits[0],inOrNot);
and(ldr[1],loadbits[1],inOrNot);
and(ldr[2],loadbits[2],inOrNot);
and(ldr[3],loadbits[3],inOrNot);
and(ldr[4],loadbits[4],inOrNot);
and(ldr[5],loadbits[5],inOrNot);
and(ldr[6],loadbits[6],inOrNot);
and(ldr[7],loadbits[7],inOrNot);

and(tr_one[0],tbits_one[0],1'b1);
and(tr_one[1],tbits_one[1],1'b1);
and(tr_one[2],tbits_one[2],1'b1);
and(tr_one[3],tbits_one[3],1'b1);
and(tr_one[4],tbits_one[4],1'b1);
and(tr_one[5],tbits_one[5],1'b1);
and(tr_one[6],tbits_one[6],1'b1);
and(tr_one[7],tbits_one[7],1'b1);

and(tr_two[0],tbits_two[0],outOrNot);
and(tr_two[1],tbits_two[1],outOrNot);
and(tr_two[2],tbits_two[2],outOrNot);
and(tr_two[3],tbits_two[3],outOrNot);
and(tr_two[4],tbits_two[4],outOrNot);
and(tr_two[5],tbits_two[5],outOrNot);
and(tr_two[6],tbits_two[6],outOrNot);
and(tr_two[7],tbits_two[7],outOrNot);


Register16 r_0(ldr[0], input_wire, clk, r0_out);
Register16 r_1(ldr[1], input_wire, clk, r1_out);
Register16 r_2(ldr[2], input_wire, clk, r2_out);
Register16 r_3(ldr[3], input_wire, clk, r3_out);
Register16 r_4(ldr[4], input_wire, clk, r4_out);
Register16 r_5(ldr[5], input_wire, clk, r5_out);
Register16 r_6(ldr[6], input_wire, clk, r6_out);
Register16 r_7(ldr[7], input_wire, clk, r7_out);


triState ts0(r0_out,out1,tr_one[0]);
triState ts1(r1_out,out1,tr_one[1]);
triState ts2(r2_out,out1,tr_one[2]);
triState ts3(r3_out,out1,tr_one[3]);
triState ts4(r4_out,out1,tr_one[4]);
triState ts5(r5_out,out1,tr_one[5]);
triState ts6(r6_out,out1,tr_one[6]);
triState ts7(r7_out,out1,tr_one[7]);

triState ts8(r0_out,out2,tr_two[0]);
triState ts9(r1_out,out2,tr_two[1]);
triState ts10(r2_out,out2,tr_two[2]);
triState ts11(r3_out,out2,tr_two[3]);
triState ts12(r4_out,out2,tr_two[4]);
triState ts13(r5_out,out2,tr_two[5]);
triState ts14(r6_out,out2,tr_two[6]);
triState ts15(r7_out,out2,tr_two[7]);



endmodule
