`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:17 09/30/2016 
// Design Name: 
// Module Name:    ALU_inner 
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
module ALU_inner(xin,yin,zout,functionchoose);

input [15:0]xin;
input [15:0]yin;
input functionchoose;

output[15:0]zout;

wire cout;
wire[15:0] secondin;
wire[15:0] negativey;

not(negativey[0],yin[0]);
not(negativey[1],yin[1]);
not(negativey[2],yin[2]);
not(negativey[3],yin[3]);
not(negativey[4],yin[4]);
not(negativey[5],yin[5]);
not(negativey[6],yin[6]);
not(negativey[7],yin[7]);
not(negativey[8],yin[8]);
not(negativey[9],yin[9]);
not(negativey[10],yin[10]);
not(negativey[11],yin[11]);
not(negativey[12],yin[12]);
not(negativey[13],yin[13]);
not(negativey[14],yin[14]);
not(negativey[15],yin[15]);

Multiplexer32_16 mux(yin, negativey, functionchoose, secondin);
RippleCarryAdder adder(xin, secondin, functionchoose, zout, cout);

endmodule


