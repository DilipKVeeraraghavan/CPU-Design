`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:38 09/30/2016 
// Design Name: 
// Module Name:    InsDecoder 
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
module InsDecoder(ip,op_code,addr_mode,dst,src1,src2);
input [15:0] ip;

output [4:0] op_code;
output [2:0] dst,src1,src2;
output [1:0] addr_mode;

assign op_code = ip[15:11];
assign addr_mode = ip[10:9];
assign dst = ip[8:6];
assign src1 = ip[5:3];
assign src2 = ip[2:0];

endmodule
