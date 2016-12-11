`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:04 10/27/2016 
// Design Name: 
// Module Name:    Register16_MDB 
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

module Register16_MDB(load,load2, ip, clk, out,MDB);
input load,load2;
input clk;
input [15:0] ip;
inout [15:0] MDB;


output [15:0] out;

reg [15:0] value;

assign out = value;
assign MDB = (load2 == 1) ? (16'bzzzzzzzzzzzzzzzz) : (value);

always@(posedge clk) begin
	if(load) begin
		  value <= ip;
	end
	else if (load2)begin
		value <= MDB;
	end
	else begin
		value <= value;
	end
end

endmodule