`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2024 19:17:22
// Design Name: 
// Module Name: traffic_ligth
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_ligth(input clk,input rst,output reg [2:0] LED_NS, LED_WE);
    


parameter S0 = 6'b000001,   //When NS is green and EW is red
	  S1 = 6'b000010,   //When NS is yellow and EW is red
	  S2 = 6'b000100,   //When NS is red and EW is red
	  S3 = 6'b001000,   //When NS is red and EW is green
	  S4 = 6'b010000,   //When NS is red and EW is yellow
	  S5 = 6'b100000;   //When NS is red and EW is red

reg [5:0] state;
reg [3:0] count;


always@(posedge clk or posedge rst)
begin
if(rst) begin    
state <= S0;
count <= 0; end
else 
begin
case(state)
S0: begin 
	if(count == 4'd14)
	begin count <= 0;
	state <= S1; end
	else begin 
	count = count + 1; 
	state <= S0; 
	end 
	end
S1: begin 
	if(count == 4'd2)
	begin count <= 0;
	state <= S2; 
	end
	else 
	begin 
	count = count + 1; 
	state <= S1; 
	end 
	end
S2: begin 
	if(count == 4'd2)
	begin count <= 0;
	state <= S3; 
	end
	else 
	begin 
	count = count + 1; 
	state <= S2; 
	end 
	end
S3: begin 
	if(count == 4'd14)
	begin 
	count <= 0;
	state <= S4; 
	end
	else 
	begin 
	count = count + 1; 
	state <= S3; 
	end 
	end
S4: begin 
	if(count == 4'd2)
	begin count <= 0;
	state <= S5; 
	end
	else 
	begin 
	count = count + 1; 
	state <= S4; 
	end 
	end
S5: begin 
	if(count == 4'd2)
	begin count <= 0;
	state <= S0; 
	end
	else 
	begin 
	count = count + 1; 
	state <= S5; 
	end 
	end
endcase
end
end

always@(*)
begin
case(state) 
S0: begin LED_NS = 3'b001;  LED_WE = 3'b100; end
S1: begin LED_NS = 3'b010;  LED_WE = 3'b100; end
S2: begin LED_NS = 3'b100;  LED_WE = 3'b100; end
S3: begin LED_NS = 3'b100;  LED_WE = 3'b001; end
S4: begin LED_NS = 3'b100;  LED_WE = 3'b010; end
S5: begin LED_NS = 3'b100;  LED_WE = 3'b100; end
endcase
end

endmodule

