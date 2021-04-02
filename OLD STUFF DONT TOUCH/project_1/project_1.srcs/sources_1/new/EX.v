`timescale 1ns / 1ps
module EX(
    input[31:0] PC_n2,
    input RW,
    input DA,
    input MD,
    input BS,
    input PS,
    input MW,
    input [5:0] FS,
    input [5:0] SH,
    input [31:0] A,
    input [31:0] B,
    output RWo, //RW output
    output DAo, //DA output
    output MDo, //MD output
    output Mem, //Output from Memory
    output [31:0] F,
    output NV //XOR of N and V
    );
    Adder Adder();
    Memory Memory();
endmodule
