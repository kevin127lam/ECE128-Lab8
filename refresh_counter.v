`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 11:08:37 AM
// Design Name: 
// Module Name: refresh_counter
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


module refresh_counter(input clk, output reg[1:0] cnt_q =0);
    reg [1:0] cnt_d = 0;
    
    always @(posedge clk)
    begin
    
    if(cnt_d == 2'b11)
        cnt_d = 2'b0;
        
    else
    
        cnt_d = cnt_d+1'b1;
        cnt_q<=cnt_d;
    end

endmodule




///////////////////////////



module decoder24_behaviour(
   // input port
   input [1:0] in,

   // use reg to store the output value
   output reg [3:0]y
   // always is used in design block 
   // only in Behavioural modeling.
   );
   
   always @(in)
     begin
           case(in)
                2'b00: y = 4'b1110;
                2'b00: y = 4'b1101;
                2'b00: y = 4'b1011;
                2'b00: y = 4'b0111;
           endcase
     end
endmodule