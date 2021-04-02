`timescale 1ns / 1ps

module Shifter(
    input[4:0] SH,
    input[31:0] A,
    output[31:0] shiftOut
    );
    assign shiftOut = A>>SH | A<<(6'd32-SH);
endmodule
