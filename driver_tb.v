`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 11:10:43 AM
// Design Name: 
// Module Name: driver_tb
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


module drive_tb;

reg clk;
reg [15:0] bcd_in;
wire [3:0] sseg_a_o;
wire [6:0] sseg_c_o;

// Instantiate the driver module
driver uut (
    .clk(clk),
    .bcd_in(bcd_in),
    .sseg_a_o(sseg_a_o),
    .sseg_c_o(sseg_c_o)
);

// Clock generation
always begin
    #5 clk = ~clk; // Toggle the clock every 5 ns
end

// Stimulus generation
initial begin
    clk = 0;
    bcd_in = 16'h0123; // Set your desired input value
    
    // Provide a test stimulus
    #10 bcd_in = 16'h4567;
    #10 bcd_in = 16'h89AB;
    // Add more test cases as needed
    
    // Add a stop time or a trigger condition to end simulation
    #100;
    $finish;
end

// Display simulation results
initial begin
    $display("Time = %0t, sseg_a_o = %b, sseg_c_o = %b", $time, sseg_a_o, sseg_c_o);
end

endmodule
