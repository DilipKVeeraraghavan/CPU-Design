`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:07 11/04/2016 
// Design Name: 
// Module Name:    FourOneMUX16 
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
module FourOneMUX16(select, d1, d2, d3, d4, q);

input[1:0] select;
input [15:0] d1,d2,d3,d4;
output   [15:0]  q;

FourOneMUXonebit zero(select, {d1[0],d2[0],d3[0],d4[0]}, q[0] );
FourOneMUXonebit one(select, {d1[1],d2[1],d3[1],d4[1]}, q[1] );
FourOneMUXonebit two(select, {d1[2],d2[2],d3[2],d4[2]}, q[2] );
FourOneMUXonebit three(select, {d1[3],d2[3],d3[3],d4[3]}, q[3] );
FourOneMUXonebit four(select, {d1[4],d2[4],d3[4],d4[4]}, q[4] );
FourOneMUXonebit five(select, {d1[5],d2[5],d3[5],d4[5]}, q[5] );
FourOneMUXonebit six(select, {d1[6],d2[6],d3[6],d4[6]}, q[6] );
FourOneMUXonebit seven(select, {d1[7],d2[7],d3[7],d4[7]}, q[7] );
FourOneMUXonebit eight(select, {d1[8],d2[8],d3[8],d4[8]}, q[8] );
FourOneMUXonebit nine(select, {d1[9],d2[9],d3[9],d4[9]}, q[9] );
FourOneMUXonebit ten(select, {d1[10],d2[10],d3[10],d4[10]}, q[10] );
FourOneMUXonebit eleven(select, {d1[11],d2[11],d3[11],d4[11]}, q[11] );
FourOneMUXonebit twelve(select, {d1[12],d2[12],d3[12],d4[12]}, q[12] );
FourOneMUXonebit thirteen(select, {d1[13],d2[13],d3[13],d4[13]}, q[13] );
FourOneMUXonebit fourteen(select, {d1[14],d2[14],d3[14],d4[14]}, q[14] );
FourOneMUXonebit fifteen(select, {d1[15],d2[15],d3[15],d4[15]}, q[15] );
	 
endmodule