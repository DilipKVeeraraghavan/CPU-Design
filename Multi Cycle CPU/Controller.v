`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:39 10/20/2016 
// Design Name: 
// Module Name:    Controller 
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
// 00 -> Add
// 01 -> Sub
// 10 -> TransX
// 11 -> Complement
module Controller(rst,op_code,add_mode,dst,src1,src2,tReg,tMDR,tMAR,tPC,tR,thash4,thash2,ldYreg,funSel,Flags,ldR,ldPC,ldMAR,ldMDR,ldMDB,ldIR,reg_write,reg_read,read_write,initiate_op,rchoosein,rchooseout,clk,op_complete);
input rst;
input[4:0] op_code;
input[1:0] add_mode;
input[2:0] dst,src1,src2;
output tReg,tMDR,tMAR,tPC,tR,thash4,thash2,ldYreg;
output[2:0] funSel;
input[3:0] Flags;
output ldR,ldPC,ldMAR,ldMDR,ldMDB,ldIR,reg_write,reg_read,read_write,initiate_op;
output[2:0] rchoosein,rchooseout;
input clk,op_complete;

reg tRegrg,tMDRrg,tMARrg,tPCrg,tRrg,thash4rg,thash2rg,ldYregrg;
reg [1:0] funSelrg;
reg ldRrg,ldPCrg,ldMARrg,ldMDRrg,ldMDBrg,ldIRrg,reg_writerg,reg_readrg,read_writerg,initiate_oprg;
reg [2:0] rchooseinrg,rchooseoutrg;
reg[9:0] state;

assign ldMDR = ldMDRrg;
assign ldMDB = ldMDBrg;
assign ldMAR = ldMARrg;
assign ldIR = ldIRrg;
assign ldPC = ldPCrg;
assign ldR = ldRrg;
assign ldYreg = ldYregrg;
assign tMDR = tMDRrg;
assign tMAR = tMARrg;
assign tPC = tPCrg;
assign tR = tRrg;

assign tReg = tRegrg;
assign thash4 = thash4rg;
assign thash2 = thash2rg;
assign rchoosein = rchooseinrg;
assign rchooseout = rchooseoutrg;
assign reg_write = reg_writerg;
assign reg_read = reg_readrg;
assign read_write = read_writerg;
assign initiate_op = initiate_oprg;
assign funSel = funSelrg;

always@(negedge clk) begin
if(rst) begin
	state <= 10'd1;
end
else begin
	case(state)
		10'd1 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 1;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd2;
		end
		10'd2 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 1;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd3;
		end
		10'd3 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 1;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 1;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 1;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd4;
		end	
		10'd4 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 1;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			if(op_complete == 0) begin
				state <= 10'd4;
			end
			else begin
				state <= 10'd5;
			end
		end
		10'd5 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 1;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd6;
		end		
		10'd6 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 1;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd500;
		end
10'd500 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			if(op_code == 5'b00000 && add_mode == 2'b00) begin
				state <= 10'd7;
			end
			else if(op_code == 5'b01001 && add_mode == 2'b00) begin
				state <= 10'd18;
			end
			else if(op_code == 5'b01000 && add_mode == 2'b00) begin
				state <= 10'd18;
			end
		end		
		10'd18 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 1;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd19;
		end	
		10'd19 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 1;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd20;
		end	
		10'd20 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 1;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd21;
		end
		10'd21 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 1;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 1;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 1;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd22;
		end
		10'd22: begin
			if(op_complete == 0) begin
				state <= 10'd22;
			end
			else begin
				state <= 10'd24;
			end
		end
		10'd24 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 1;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= src1;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 1;
			funSelrg <= 2'd2;
			state <= 10'd25;
		end
		10'd25 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 1;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			if(op_code[0] == 0) begin
				state <= 10'd27;
			end
			else begin
				state <= 10'd34;
			end
		end
		10'd27 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 1;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd28;
		end
		10'd28 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 1;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd29;
		end
		10'd34 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 1;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd1;
			state <= 10'd35;
		end
		10'd35 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 1;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd1;
			state <= 10'd29;
		end
		10'd29 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 1;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 1;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd26;
		end
		10'd26 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= dst;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 1;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd30;
		end
		10'd30 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 1;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd1;
			state <= 10'd31;
		end
		10'd31 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 1;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd32;
		end
		10'd32 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 1;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd1;
		end
		//li instruction
		10'd7 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 1;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd8;
		end
10'd8 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 1;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd9;
		end	
10'd9 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 1;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd10;
		end	
10'd10 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 1;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 1;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 1;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd11;
		end
10'd11 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 1;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			if(op_complete == 0) begin
				state <= 10'd11;
			end
			else begin
				state <= 10'd12;
			end
		end		
10'd12 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 1;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd14;
		end	
10'd14: begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= dst;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 1;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd15;
		end	
10'd15: begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 1;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd16;
		end	
10'd16: begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 1;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd17;
		end	
10'd17 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 1;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd1;
		end	



//lr instruction

10'd301 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 1;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= src1;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 1;
			funSelrg <= 2'd2;
			state <= 10'd302;
		end	
10'd302: begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= dst;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 1;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd303;
		end	
10'd303 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 1;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd304;
		end	
10'd304: begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 1;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd305;
		end	
10'd305 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 1;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd1;
		end	









//lx instruction
10'd306 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 1;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd307;
		end	
10'd307 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 1;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd308;
		end		
10'd308 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 1;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd309;
		end		
10'd309 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 1;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 1;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 1;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd310;
		end	
10'd310 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			if(op_complete==1)begin
				state <= 10'd311;
			end
			else begin
				state <= 10'd10;
			end
		end	
10'd311: begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 1;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd312;
		end	
10'd312 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 1;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd313;
		end	
10'd313 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 1;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= src1;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 1;
			funSelrg <= 2'd0;
			state <= 10'd314;
		end	
10'd314: begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 1;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd315;
		end	
10'd315 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 1;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd316;
		end	
10'd316 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 1;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 1;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= src2;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 1;
			funSelrg <= 2'd0;
			state <= 10'd317;
		end	
10'd317 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 1;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd318;
		end	
10'd318 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 1;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd319;
		end	
10'd319 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 1;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd2;
			state <= 10'd320;
		end	
10'd320 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 1;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd321;
		end	
10'd321 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 1;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 1;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 1;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd322;
		end	
10'd322 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 0;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= 3'd0;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 0;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			if(op_complete==1)begin
				state <= 10'd323;
			end
			else begin
				state <= 10'd322;
			end
		end	
10'd323 : begin
			ldMDRrg <= 0;
			ldMDBrg <= 0;
			ldMARrg <= 0;
			ldIRrg <= 0;
			ldPCrg <= 0;
			ldRrg <= 0;
			ldYregrg <= 0;
			tMDRrg <= 1;
			tMARrg <= 0;
			tPCrg <= 0;
			tRrg <= 0;
			
			tRegrg <= 0;
			thash4rg <= 0;
			thash2rg <= 0;
			read_writerg <= 0;
			rchooseinrg <= dst;
			rchooseoutrg <= 3'd0;
			reg_writerg <= 1;
			initiate_oprg <= 0;
			reg_readrg <= 0;
			funSelrg <= 2'd0;
			state <= 10'd324;
		end	
//ldn instruction
10'd327 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd328;
	end	

10'd328 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd329;
	end	

10'd329 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd330;
	end	
10'd330 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd331;
	end	
10'd331 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd332;
	end
	else begin
	state <= 10'd331;
	end
	end	

10'd332 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd333;
	end	
10'd333 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd334;
	end
10'd334 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src1;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd335;
	end	
10'd335 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd336;
	end	
10'd336 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd337;
	end	
10'd337 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src2;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd338;
	end
10'd338 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd339;
	end	
10'd339 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd340;
	end	
10'd341 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd342;
	end	
10'd342 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd343;
	end	
10'd343 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin 
	state<= 10'd344;
	end
	else begin
	state <= 10'd343;
	end
	end	
10'd344: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd345;
	end	
10'd345 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd346;
	end	
10'd346 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd347;
	end	
10'd347 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	


//li instruction
10'd7 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd8;
	end
10'd8 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd9;
	end	
10'd9 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd10;
	end	
10'd10 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd11;
	end	
10'd12 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd14;
	end	
10'd14: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd15;
	end	
10'd15: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd16;
	end	
10'd16: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd17;
	end	
10'd17 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	



//lr instruction

10'd301 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src1;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd2;
	state <= 10'd302;
	end	
10'd302: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd303;
	end	
10'd303 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd304;
	end	
10'd304: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd305;
	end	
10'd305 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	









//lx instruction
10'd306 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd307;
	end	
10'd307 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd308;
	end	
10'd308 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd309;
	end	
10'd309 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd310;
	end	
10'd310 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd311;
	end
	else begin
	state <= 10'd10;
	end
	end	
10'd311: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd312;
	end	
10'd312 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd313;
	end	
10'd313 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src1;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd314;
	end	
10'd314: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd315;
	end	
10'd315 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd316;
	end	
10'd316 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src2;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd317;
	end	
10'd317 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd318;
	end	
10'd318 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd319;
	end	
10'd319 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd320;
	end	
10'd320 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd321;
	end	
10'd321 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd322;
	end	
10'd322 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd323;
	end
	else begin
	state <= 10'd322;
	end
	end	
10'd323 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd324;
	end	
10'd324 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd325;
	end	
10'd325 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd326;
	end	

10'd326 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	



















//ldn instruction
10'd327 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd328;
	end	

10'd328 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd329;
	end	

10'd329 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd330;
	end	
10'd330 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd331;
	end	
10'd331 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd332;
	end
	else begin
	state <= 10'd331;
	end
	end	

10'd332 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd333;
	end	
10'd333 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd334;
	end
10'd334 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src1;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd335;
	end	
10'd335 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd336;
	end	
10'd336 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd337;
	end	
10'd337 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src2;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd338;
	end
10'd338 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd339;
	end	
10'd339 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd340;
	end	
10'd341 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd342;
	end	
10'd342 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd343;
	end	
10'd343 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin 
	state<= 10'd344;
	end
	else begin
	state <= 10'd343; 
	end
	end	
10'd344: begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd345;
	end	
10'd345 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd346;
	end	
10'd346 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd347;
	end	
10'd347 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	
































//stx instruction
10'd348 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd349;
	end	

10'd349 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd350;
	end	

10'd350 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd351;
	end	
10'd351 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd352;
	end	
10'd352 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd332;
	end
	else begin
	state <= 10'd353;
	end
	end	

10'd353 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd354;
	end	
10'd354 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd355;
	end
10'd355 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src1;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd356;
	end	
10'd356 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd357;
	end	
10'd357 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd358;
	end	
10'd358 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd359;
	end	
10'd359 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd360;
	end	
10'd360 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd361;
	end	
10'd361 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd362;
	end
	else begin
	state <= 10'd361;
	end
	end	
10'd362 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd363;
	end	
10'd363 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd364;
	end	
10'd364 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd365;
	end	
10'd365 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd366;
	end	
10'd366 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd367;
	end	
10'd367 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd368;
	end
	else begin
	state <= 10'd367;
	end
	end	
10'd368 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd369;
	end	
10'd369 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd370;
	end	
10'd370 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd371;
	end	
10'd371 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	


































//stn instruction
10'd372 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd373;
	end	
	10'd373 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd374;
	end	
	10'd374 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd375;
	end	
10'd375 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd376;
	end	
10'd376 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd332;
	end
	else begin
	state <= 10'd377;
	end
	end	

10'd377 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd378;
	end	
10'd378 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd379;
	end
10'd379 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 1;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= src1;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 1;
	funSelrg <= 2'd0;
	state <= 10'd380;
	end	
10'd380 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd381;
	end	
	10'd381 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd382;
	end	
10'd382 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd383;
	end	
10'd383 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd384;
	end	
	10'd384 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd385;
	end	
10'd385 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd386;
	end
	else begin
	state <= 10'd385;
	end
	end	
	10'd386 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd387;
	end	
10'd387 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd388;
	end	
	10'd388 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd389;	
	end
10'd389 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd390;
	end	
10'd390 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd391;
	end	
10'd391 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd392;
	end
	else begin
	state <= 10'd391;
	end
	end	
10'd392 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd393;
	end	
10'd393 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 1;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd394;
	end	
10'd394 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 1;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd395;
	end	
10'd396 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd397;
	end	
10'd397 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd398;
	end
	else begin 
	state <= 10'd397;
	end
	end	
10'd398 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd399;
	end	
10'd399 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd400;
	end	
10'd400 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd401;
	end	
10'd401 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	



//jump
10'd402 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 10;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd403;
	end	
10'd403 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd404;
	end	
10'd404 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd410;
	end	
10'd410 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd411;
	end
	else begin
	state <= 10'd410;
	end
	end	
10'd411 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_code==5'd10001) begin             //jz
	if(Flags[0]==1)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	else if(op_code==5'd10010) begin	//jnz
	if(Flags[0]==0)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	else if(op_code==5'd10011) begin	//jc
	if(Flags[1]==1)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	else if(op_code==5'd10100) begin 	//jnc
	if(Flags[1]==0)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	else if(op_code==5'd10111)begin	//jm
	if(Flags[2]==1)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	else if(op_code==5'd10000)begin 	//jnm
	if(Flags[2]==0)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	else if(op_code==5'd10101)begin	//jm
	if(Flags[3]==1)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	else if(op_code==5'd10110)begin 	//jnm
	if(Flags[3]==0)begin
	state <= 10'd408;
	end
	else begin
	state <= 10'd405;
	end
	end
	end	
10'd405 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd406;
	end	
10'd406 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd407;
	end	
10'd407 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	
10'd408 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd409;
	end	
10'd409 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 1;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd410;
	end	






//j

10'd412 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd413;
	end	
10'd413 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd414;
	end	
10'd414 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd415;
	end	
10'd415 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd416;
	end	
10'd416 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==1)begin
	state <= 10'd417;
	end
	else begin 
	state <= 10'd416;
	end
	end	
10'd417 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 1;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd2;
	state <= 10'd418;
	end	
10'd418 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 10;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd1;
	end	
10'd418 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 1;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd419;
	end	
10'd419 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd420;
	end	
10'd420 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 1;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 1;
	read_writerg <= 0;
	rchooseinrg <= dst;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 1;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd421;
	end	
10'd421 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 1;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd422;
	end	
10'd422 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 1;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd423;
	end	
10'd423 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 1;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 1;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 1;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	state <= 10'd424;
	end	
10'd424 : begin
	ldMDRrg <= 0;
	ldMDBrg <= 0;
	ldMARrg <= 0;
	ldIRrg <= 0;
	ldPCrg <= 0;
	ldRrg <= 0;
	ldYregrg <= 0;
	tMDRrg <= 0;
	tMARrg <= 0;
	tPCrg <= 0;
	tRrg <= 0;
	
	tRegrg <= 0;
	thash4rg <= 0;
	thash2rg <= 0;
	read_writerg <= 0;
	rchooseinrg <= 3'd0;
	rchooseoutrg <= 3'd0;
	reg_writerg <= 0;
	initiate_oprg <= 0;
	reg_readrg <= 0;
	funSelrg <= 2'd0;
	if(op_complete==10'd424)
	state <= 10'd425;
	end	





endcase
end
end
endmodule
