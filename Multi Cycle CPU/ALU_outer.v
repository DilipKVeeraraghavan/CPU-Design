`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:28 09/30/2016 
// Design Name: 
// Module Name:    ALU_outer 
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
module ALU_outer(X, Y, Z, flags, funSel, clk);

input [15:0] X,Y;
input clk;
input [1:0] funSel;
output [3:0] flags;
output [15:0] Z;

wire [15:0]a,b,sum,notX,notY;
wire sumzero, notsumzero, nota15, notb15, notsum15;
wire cin,cout,Zero,Three,notThree,notfunSelzero,notfunSelone,One;
wire firstcase,secondcase,thirdcase,fourthcase;
reg [15:0] result;


RegisterBit ZFF(1'b1,Zip,clk,flags[0]);
RegisterBit CFF(1'b1,Cip,clk,flags[1]);
RegisterBit VFF(1'b1,Vip,clk,flags[2]);
RegisterBit SFF(1'b1,Sip,clk,flags[3]);
	
assign Z = result;

not(notX[0],X[0]);
not(notX[1],X[1]);
not(notX[2],X[2]);
not(notX[3],X[3]);
not(notX[4],X[4]);
not(notX[5],X[5]);
not(notX[6],X[6]);
not(notX[7],X[7]);
not(notX[8],X[8]);
not(notX[9],X[9]);
not(notX[10],X[10]);
not(notX[11],X[11]);
not(notX[12],X[12]);
not(notX[13],X[13]);
not(notX[14],X[14]);
not(notX[15],X[15]);

not(notY[0],Y[0]);
not(notY[1],Y[1]);
not(notY[2],Y[2]);
not(notY[3],Y[3]);
not(notY[4],Y[4]);
not(notY[5],Y[5]);
not(notY[6],Y[6]);
not(notY[7],Y[7]);
not(notY[8],Y[8]);
not(notY[9],Y[9]);
not(notY[10],Y[10]);
not(notY[11],Y[11]);
not(notY[12],Y[12]);
not(notY[13],Y[13]);
not(notY[14],Y[14]);
not(notY[15],Y[15]);

// 00 -> Add
// 01 -> Sub
// 10 -> TransX
// 11 -> Complement

RippleCarryAdder rca(a, b, cin, sum, cout);

triState ts1(X,a,notThree);
triState ts2(notX,a,Three);
triState ts3(Y,b,Zero);
triState ts4(notY,b,One);
triState ts5(16'b0,b,funSel[1]);

or(cin,funSel[0],1'b0);
and(Three,funSel[0],funSel[1]);
and(One,funSel[0],notfunSelone);
not(notfunSelzero,funSel[0]);
not(notfunSelone,funSel[1]);
not(nota15,a[15]);
not(notb15,b[15]);
not(notsum15,sum[15]);
or(Zip,1'b0,notsumzero);
and(Cip,cout,notfunSelone);
and(firstcase,nota15,notb15,sum[15],notfunSelzero,notfunSelone);
and(secondcase,a[15],b[15],notsum15,notfunSelzero,notfunSelone);
and(thirdcase,nota15,b[15],sum[15],funSel[0],notfunSelone);
and(fourthcase,a[15],notb15,notsum15,funSel[0],notfunSelone);
or(Vip,firstcase,secondcase,thirdcase,fourthcase);
nand(notThree,funSel[0],funSel[1]);
and(Zero,notfunSelone,notfunSelzero);
or(Sip,1'b0,sum[15]);

or(sumzero,sum[15],sum[14],sum[13],sum[12],sum[11],sum[10],sum[9],sum[8],sum[7],sum[6],sum[5],sum[4],sum[3],sum[2],sum[1],sum[0]);
not(notsumzero,sumzero);

always@(posedge clk)
begin 
	result[15:0] <= sum[15:0];
end

endmodule
