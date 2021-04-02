`timescale 1ns / 1ps

module IF(
    input[31:0] PC,
    input clk,
    output reg [31:0] PC_n1,
    output reg [31:0] IR
    );
    reg [31:0] temp_IR;
    Instruction_Memory Instruction_Memory(
    .PC(PC),
    .temp_IR(IR),
    .clk(clk));
    always @ (negedge clk) begin
        assign PC_n1 = PC + 1;
        assign IR = temp_IR;
    end
    //assign PC_n1 = PC + 1; //update PC for IF time 
endmodule

