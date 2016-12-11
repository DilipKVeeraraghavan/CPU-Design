`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:14 10/06/2016 
// Design Name: 
// Module Name:    Regsiter16 
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

reg [15:0] value;

assign out = value;

always@(posedge clk) begin
	if(load) begin
		  value <= ip;
	end
end

endmodule

