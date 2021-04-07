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
    output reg RWo, //RW output
    output reg [4:0] DAo, //DA output
    output reg [1:0] MDo, //MD output
    output reg [31:0] data_out, //Output from Memory
    output reg [31:0] F, //To WB
    output reg NV, //XOR of N and V
    output reg Z,
    output [31:0] BrA, //Output to Mux C
    output [31:0] RAA
    );
    
    wire N_i, V_i, C_i, Z_i;
    reg N, V, C;
    wire [31:0] F_i;
    wire [31:0] data_out_i;
    
    initial begin
        {RWo, DAo, MDo, data_out, F, NV} = 0;
    end
    
    assign RAA = Bus_A;
    
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
        .data_out(data_out_i)
    );
    
    
    Function_Unit Function_Unit(
        .A(Bus_A),
        .B(Bus_B),
        .SH(SH),
        .FS(FS),
        .Z(Z_i),
        .N(N_i),
        .V(V_i),
        .C(C_i),
        .F(F_i)
    );
    
    reg void;
    
    always @ (negedge clk) begin
        if(!reset) begin
            //pull these registers along one tick
            RWo = RW;
            DAo = DA;
            MDo = MD;
            NV = V_i ^ N_i;
            F = F_i;
            {Z, V, N, C} = {Z_i, V_i, N_i, C_i};
            data_out = data_out_i;
        end else begin
            //do all the reset shit
        end  
    end
    
endmodule
