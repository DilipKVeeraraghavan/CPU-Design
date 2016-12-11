`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:56 11/04/2016 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(a, b, cin, sum, cout);

input a;
input b;
input cin;

output sum;
output cout;

wire aAndB,bAndCin,aAndCin;

and(aAndB,a,b);
and(bAndCin,b,cin);
and(aAndCin,a,cin);
xor(sum,a,b,cin);
or(cout,aAndB,bAndCin,aAndCin);

endmodule
