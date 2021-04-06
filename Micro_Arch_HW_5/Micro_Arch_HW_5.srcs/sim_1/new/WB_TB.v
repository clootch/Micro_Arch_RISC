`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 11:09:45 AM
// Design Name: 
// Module Name: WB_TB
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


module WB_TB();
reg RW,NV,clk;
reg [4:0] DA;
reg [1:0] MD;
reg [31:0] F, DATA;
WB uut(
.RW(RW),
.DA(DA),
.MD(MD),
.F(F),
.NV(NV),
.DATA(DATA),
.clk(clk)
);

Register_File RF(
        .DA(DA),
        .clk(clk),
        .RW(RW),
        .D(D)
    );

initial begin
    clk = 0;
    DATA = 32'd123;
    DA = 32'd4;
    NV = 0;
    
end

always #5 clk = ~clk;
endmodule
