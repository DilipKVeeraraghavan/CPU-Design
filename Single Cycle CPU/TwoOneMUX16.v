`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:32 11/04/2016 
// Design Name: 
// Module Name:    TwoOneMUX16 
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
module TwoOneMUX16(select, d1, d2, q);

input select;
input [15:0] d1,d2;
output   [15:0]  q;

TwoOneMUXonebit zero(select, {d1[0],d2[0]}, q[0] );
TwoOneMUXonebit one(select, {d1[1],d2[1]}, q[1] );
TwoOneMUXonebit two(select, {d1[2],d2[2]}, q[2] );
TwoOneMUXonebit three(select, {d1[3],d2[3]}, q[3] );
TwoOneMUXonebit four(select, {d1[4],d2[4]}, q[4] );
TwoOneMUXonebit five(select, {d1[5],d2[5]}, q[5] );
TwoOneMUXonebit six(select, {d1[6],d2[6]}, q[6] );
TwoOneMUXonebit seven(select, {d1[7],d2[7]}, q[7] );
TwoOneMUXonebit eight(select, {d1[8],d2[8]}, q[8] );
TwoOneMUXonebit nine(select, {d1[9],d2[9]}, q[9] );
TwoOneMUXonebit ten(select, {d1[10],d2[10]}, q[10] );
TwoOneMUXonebit eleven(select, {d1[11],d2[11]}, q[11] );
TwoOneMUXonebit twelve(select, {d1[12],d2[12]}, q[12] );
TwoOneMUXonebit thirteen(select, {d1[13],d2[13]}, q[13] );
TwoOneMUXonebit fourteen(select, {d1[14],d2[14]}, q[14] );
TwoOneMUXonebit fifteen(select, {d1[15],d2[15]}, q[15] );
	 
endmodule
