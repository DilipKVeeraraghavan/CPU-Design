`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:53 11/04/2016 
// Design Name: 
// Module Name:    RegisterBit 
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
module RegisterBit(load, ip, clk, out);
input load;
input clk;
input ip;

output out;

reg value;

assign out = value;

always@(posedge clk) begin
	if(load) begin
		  value <= ip;
	end
end

endmodule