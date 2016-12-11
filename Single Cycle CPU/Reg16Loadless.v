`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:26 11/04/2016 
// Design Name: 
// Module Name:    Reg16Loadless 
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
module Reg16Loadless(ip, clk, out,rst);
input clk,rst;
input [15:0] ip;

output [15:0] out;

reg [15:0] value;

assign out = value;

always@(negedge clk) begin
	if(rst) begin
	value <= 16'd0;
	end
	else begin
	value <= ip;
	end
end

endmodule


