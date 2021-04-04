`timescale 1ns / 1ps

module IF(
    input[31:0] PC,
    input clk,
    input reset,
    output reg [31:0] PC_n1,
    output reg [31:0] IR
    );
    
    wire [31:0] temp_IR;
    
    Instruction_Memory Instruction_Memory(
    .PC(PC),
    .IR(temp_IR), 
    .clk(clk));
    
    always @ (negedge clk) begin
        if(!reset) begin
            PC_n1 = PC + 1;
            IR = temp_IR;//opcode+extras into Instruction Register (IR)
        end else begin
            PC_n1 = 0;
            IR = 0;
        end
    end
endmodule

