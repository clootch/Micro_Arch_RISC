`timescale 1ns / 1ps
module EX(
    input clk,
    input reset,
    input[31:0] PC_n2,
    input RW,
    input [4:0] DA,
    input [1:0] MD,
    input [1:0] BS,
    input PS,
    input MW,
    input [4:0] FS,
    input [5:0] SH,
    input [31:0] Bus_A,
    input [31:0] Bus_B,
    output reg RWo=0, //RW output
    output reg [4:0] DAo=0, //DA output
    output reg [1:0] MDo=0, //MD output
    output [31:0] data_out, //Output from Memory
    output [31:0] F, //To WB
    output NV, //XOR of N and V
    output reg Z = 0,
    output [31:0] BrA, //Output to Mux C
    output [31:0] RAA,
    output reg [1:0] BS_out = 0,
    output reg PS_out =0
    );
    
    wire N, V, C, Z_i;
    //reg N, V, C;
    
    
    initial begin
        {RWo, DAo, MDo} = 0;
    end
    
    assign RAA = Bus_A;
    //assign BS_out = BS;
    //assign PS_out = PS;
    
    Adder Adder(
        .B(Bus_B),
        .PC(PC_n2),
        .BrA(BrA)
    );
    
    Memory Memory(
        .clk(clk),
        .A(Bus_A),
        .B(Bus_B),
        .MW(MW),
        .data_out(data_out)
    );
    
    
    Function_Unit Function_Unit(
        .A(Bus_A),
        .B(Bus_B),
        .SH(SH),
        .FS(FS),
        .Z(Z_i),
        .N(N),
        .V(V),
        .C(C),
        .F(F)
    );
    
    reg void;
    
    assign NV = V ^ N;
    always @ (negedge clk) begin
        if(!reset) begin
            //pull these registers along one tick
            RWo = RW;
            DAo = DA;
            MDo = MD;
            Z = Z_i;
            BS_out = BS;
            PS_out = PS;
            //NV = V_i ^ N_i;
            //F = F_i;
            //{Z, V, N, C} = {Z_i, V_i, N_i, C_i};
        end else begin
            //do all the reset shit
        end  
    end
    
endmodule
