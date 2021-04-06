`timescale 1ns / 1ps
module EX(
    input clk,
    input reset,
    input[31:0] PC_n2,
    input RW,
    input DA,
    input MD,
    input BS,
    input PS,
    input MW,
    input [5:0] FS,
    input [5:0] SH,
    input [31:0] Bus_A,
    input [31:0] Bus_B,
    output reg RWo, //RW output
    output reg DAo, //DA output
    output reg MDo, //MD output
    output reg Mem, //Output from Memory
    output reg [31:0] F, //To WB
    output reg NV, //XOR of N and V
    output [31:0] BrA, //Output to Mux C
    output [31:0] RAA
    );
    
    reg N, V, C, Z;
    
    
    Adder Adder(
        .B(B),
        .PC_n2(PC),
        .BrA(BrA)
    );
    Memory Memory(
        .clk(clk),
        .reset(reset),
        .A(Bus_A)
    );
    
    Function_Unit Function_Unit(
        .clk(clk),
        .reset(reset),
        .A(Bus_A),
        .B(Bus_B),
        .SH(SH),
        .FS(FS),
        .Z(Z),
        .N(N),
        .V(V),
        .C(C),
        .F(F)
    );
    
    reg void;
    
    always @ (negedge clk) begin
        if(!reset) begin
            //pull these registers along one tick
            RWo = RW;
            DAo = DA;
            MDo = MD;
            NV = V ^ N;
        end else begin
            //do all the reset shit
        end  
    end
    
endmodule
