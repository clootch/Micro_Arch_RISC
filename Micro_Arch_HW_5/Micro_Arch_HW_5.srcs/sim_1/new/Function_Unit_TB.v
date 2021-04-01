`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 11:38:36 AM
// Design Name: 
// Module Name: Function_Unit_TB
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


module Function_Unit_TB();
reg[31:0] A;
reg[31:0] B;
reg[4:0] SH;
reg[4:0] FS;
wire Z,N,V,C;
wire[31:0] F;

Function_Unit uut(
.A(A),
.B(B),
.SH(SH),
.FS(FS),
.Z(Z),
.N(N),
.V(V),
.C(C),
.F(F)
);
initial begin
    A = 32'd1;
    B = 32'd1;
    SH = 5'b1;
    for(integer i = 0; i < 32; i = i + 1)
    begin
        FS = i;
        #5;
    end
    A = 32'b11111111111111111111111111111111;
    B = 32'b11111111111111111111111111111111;
    for(integer i = 0; i < 32; i = i + 1)
    begin
        FS = i;
        #5;
    end
end

endmodule
