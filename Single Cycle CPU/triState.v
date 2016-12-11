`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:24 11/04/2016 
// Design Name: 
// Module Name:    triState 
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
module triState(in,out,enable);
input enable;
input[15:0] in;
output[15:0] out;

assign out = (enable == 1) ? in : 16'bzzzzzzzzzzzzzzzz;

endmodule

