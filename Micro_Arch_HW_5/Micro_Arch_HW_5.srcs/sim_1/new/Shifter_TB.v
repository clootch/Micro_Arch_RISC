`timescale 1ns / 1ps

module Shifter_TB();
reg[4:0] SH;
reg[31:0] A;
wire[31:0] F;
Shifter uut(
.SH(SH),
.A(A),
.F(F)
);
initial begin
    SH = 6'd3;
    A = 5'b10000;
end
endmodule
