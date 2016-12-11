`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:24 11/04/2016 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(writeChoose,rChooseOne,rChooseTwo,MDB_IR,MAB_IR,IR,clk,choosePCUpdate,chooseOperand2,funSel,inOrNot,outOrNot,flags,chooseWriteBack,Data_dm,Address_dm,ReadData_dm,ldRA,rst);

input clk,inOrNot,outOrNot,chooseOperand2,chooseWriteBack,ldRA,rst;
input [15:0] MDB_IR,ReadData_dm;
input [1:0] funSel,choosePCUpdate;
input [2:0] rChooseOne,rChooseTwo,writeChoose;
output [3:0]flags;
output [15:0] MAB_IR,IR,Data_dm,Address_dm;

wire [15:0]RAip,RA_out,IR_out,input_wire,out1,out2,PC_out,sum_one,sum_two,Xwire,Ywire,PC_in;
wire out,cout_two;

assign MAB_IR = PC_out;
assign IR = IR_out;
assign Data_dm = out1;
assign RAip = sum_two;
assign Xwire = out1;


Register16 RA(ldRA,RAip,clk,RA_out);

FourOneMUX16 MUXPC(choosePCUpdate, RA_out, sum_two, sum_one, out1, PC_in);

TwoOneMUX16 aluSecondOperand(chooseOperand2, out2, {IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[6],IR_out[5],IR_out[4],IR_out[3],IR_out[2],IR_out[1],IR_out[0]}, Ywire);
TwoOneMUX16 SecondOperand(chooseWriteBack, ReadData_dm, Address_dm ,input_wire);

ALU_outer alu(Ywire,Xwire, Address_dm, flags, funSel, clk);

Reg16LoadlessIR IR_Register(MDB_IR, IR_out);
Reg16Loadless PC_Register(PC_in, clk, PC_out,rst);

RippleCarryAdder one(PC_out, {IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[7],IR_out[6],IR_out[5],IR_out[4],IR_out[3],IR_out[2],IR_out[1],IR_out[0]},1'b0,sum_one, cout);
RippleCarryAdder two(PC_out, 16'd2,1'b0,sum_two,cout_two);
RegisterBank rb(rChooseOne,rChooseTwo,writeChoose,inOrNot,outOrNot,input_wire,out1,out2,clk);
endmodule
