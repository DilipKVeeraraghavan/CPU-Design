`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:32 10/27/2016 
// Design Name: 
// Module Name:    Register16_PC 
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
module Register16_PC(rst,load, ip, clk, out);
input load;
input clk,rst;
input [15:0] ip;

output [15:0] out;

reg [15:0] value;

assign out = value;

always@(posedge clk) begin
	if(rst) begin
		value <= 16'b0;
	end
	else if(load) begin
		 value <= ip;
	end
end


endmodule
