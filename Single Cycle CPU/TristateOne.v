`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:30 11/18/2016 
// Design Name: 
// Module Name:    TristateOne 
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
module TristateOne(in,out,enable);
input enable;
input in;
output out;

assign out = (enable == 1) ? in : 1'bz;


endmodule
