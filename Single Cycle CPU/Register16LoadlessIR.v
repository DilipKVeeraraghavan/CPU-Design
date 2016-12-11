`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:43:45 11/04/2016 
// Design Name: 
// Module Name:    Register16LoadlessIR 
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
module Reg16LoadlessIR(ip, out);
input [15:0] ip;

output [15:0] out;

reg [15:0] value;

assign out = value;

always@(ip) begin
	value <= ip;
end

endmodule

