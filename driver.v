`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 11:07:29 AM
// Design Name: 
// Module Name: driver
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


module driver(
input clk,
 input [15:0] bcd_in,
 output [3:0] sseg_a_o,
 output [6:0] sseg_c_o);

parameter g_s = 5;
parameter gt = 4;

wire [6:0] sseg_o;
reg [3:0] anode =4'b0001;
reg [3:0] bcd_seg =4'b0000;
reg [g_s-1:0] g_count =0;
wire [1:0] cnt_q;

Seven_seg_decoder uut1(.clk(clk), .bcd(bcd_seg), .seg(sseg_o)); // input clk, 4:1 mux out, output 7seg

//refresh_counter uut2(.clk(clk), .cnt_q(cnt_q));

//decoder24_behaviour uut3(.in(cnt_q), .y(sseg_a_o));

    always @(posedge clk)
    begin
    g_count =g_count+1;
        if(g_count == 0)
            begin
            if(anode == 4'b0001)
                begin
                anode = 4'b1000;
                end   
            else 
                begin
                anode = anode >>1;
                end
             end
         if(&g_count[g_s-1:gt])
            begin
            case (anode) //case statement
                4'b0001: bcd_seg = bcd_in[3:0];
                4'b0010: bcd_seg = bcd_in[7:4];
                4'b0100: bcd_seg = bcd_in[11:8];
                4'b1000: bcd_seg = bcd_in[15:12];
                default : bcd_seg = 4'b1111; 
            endcase
         end 
         
         else 
            begin
            bcd_seg = 4'b1111; 
            end 
          end


assign  sseg_a_o = ~anode;
assign  sseg_c_o = sseg_o;  
       
endmodule


//////////////////////////////////////////////////////////////


module Seven_seg_decoder(clk, bcd, seg); 
input clk; 
input [3:0] bcd; 
output reg[6:0] seg;// 
//output [3:0] an;// 
//assign an = 4'b1110;     //always block for converting bcd digit into 7 segment format    

always @(posedge clk)    
begin        
case (bcd) //case statement                   
      4'b0000: seg = 7'b0000001; 
      4'b0001: seg = 7'b1001111;  
      4'b0010: seg = 7'b0010010;
      4'b0011: seg = 7'b0000110;
      4'b0100: seg = 7'b1001100;
      4'b0101: seg = 7'b0100100;
      4'b0110: seg = 7'b1100000;
      4'b0111: seg = 7'b0001111;
      4'b1000: seg = 7'b0000000;
      4'b1001: seg = 7'b0001100;
default : seg = 7'b1111111;                     
endcase               
end                
endmodule