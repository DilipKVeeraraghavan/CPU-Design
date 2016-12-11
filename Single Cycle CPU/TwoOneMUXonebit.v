`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:34 11/04/2016 
// Design Name: 
// Module Name:    TwoOneMUXonebit 
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
module TwoOneMUXonebit(select, d, q);

input select;
input[1:0] d;
output     q;

wire       q, q1, q2, NOTselect0;

not n1( NOTselect0, select);

and a1( q1, NOTselect0, d[0]  );
and a2( q2,  select, d[1]  );

or o1( q, q1, q2 );

endmodule
