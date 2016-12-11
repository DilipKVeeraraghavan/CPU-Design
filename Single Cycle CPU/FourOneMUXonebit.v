`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:26 11/04/2016 
// Design Name: 
// Module Name:    FourOneMUXonebit 
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
//////////////////////////////////////////////////////////////////////////////////
module FourOneMUXonebit(select, d, q );

input[1:0] select;
input[3:0] d;
output     q;
//in,out,enable

TristateOne one1(d[0],q,zero);
TristateOne two2(d[1],q,one);
TristateOne three3(d[2],q,two);
TristateOne four4(d[3],q,three);

not(notselectzero,select[0]);
not(notselectone,select[1]);

and(zero,notselectzero,notselectone);
and(one,notselectone,select[0]);
and(two,notselectzero,select[1]);
and(three,select[0],select[1]);

endmodule

