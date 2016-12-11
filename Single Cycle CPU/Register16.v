`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:50 11/04/2016 
// Design Name: 
// Module Name:    Register16 
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
module Register16(load, ip, clk, out);
input load;
input clk;
input [15:0] ip;

output [15:0] out;

reg [15:0] value = 16'b0;

assign out = value;

always@(negedge clk) begin
	if(load) begin
		  value <= ip;
	end
	else begin
		value <= value;
	end
end
	
endmodule
