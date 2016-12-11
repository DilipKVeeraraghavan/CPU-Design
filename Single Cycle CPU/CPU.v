`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:36 11/17/2016 
// Design Name: 
// Module Name:    CPU 
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
module CPU(rst,clk,MDB_IR,ReadData_dm,MAB_IR,IR,Data_dm,Address_dm,MemRead,MemWrite);

input rst,clk;
input [15:0] MDB_IR,ReadData_dm;

output [15:0] MAB_IR,IR,Data_dm,Address_dm;
output MemRead,MemWrite;

//wire[15:0] IR;
wire inOrNot,outOrNot,chooseOperand2,chooseWriteBack,ldRA;
wire [1:0] funSel,choosePCUpdate;
wire [2:0] rChooseOne,rChooseTwo,writeChoose;
wire [3:0]flags;


Contra   controller(inOrNot,outOrNot,chooseOperand2,chooseWriteBack,ldRA,funSel,choosePCUpdate,rChooseOne,rChooseTwo,writeChoose,IR,MemRead,MemWrite,flags);
Datapath datapath(writeChoose,rChooseOne,rChooseTwo,MDB_IR,MAB_IR,IR,clk,choosePCUpdate,chooseOperand2,funSel,inOrNot,outOrNot,flags,chooseWriteBack,Data_dm,Address_dm,ReadData_dm,ldRA,rst);

endmodule
