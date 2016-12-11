`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:36 09/29/2016 
// Design Name: 
// Module Name:    decoder 
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
module decoder(select,output_bits);
input [2:0]select;
output [7:0]output_bits;

wire  [2:0]notselect;

not(notselect[0],select[0]);
not(notselect[1],select[1]);
not(notselect[2],select[2]);

and(output_bits[0],notselect[0],notselect[1],notselect[2]);
and(output_bits[1],select[0],notselect[1],notselect[2]);
and(output_bits[2],notselect[0],select[1],notselect[2]);
and(output_bits[3],select[0],select[1],notselect[2]);
and(output_bits[4],notselect[0],notselect[1],select[2]);
and(output_bits[5],select[0],notselect[1],select[2]);
and(output_bits[6],notselect[0],select[1],select[2]);
and(output_bits[7],select[0],select[1],select[2]);

endmodule