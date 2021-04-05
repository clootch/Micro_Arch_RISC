`timescale 1ns / 1ps

module IF_TB();
    reg [31:0] PC;
    reg clk;
    reg reset;
    wire [31:0] PC_n1;
    wire [31:0] IR;
    
    IF uut(
        .PC(PC),
        .clk(clk),
        .reset(reset),
        .PC_n1(PC_n1),
        .IR(IR));
    
    initial begin
        clk = 0;
        reset = 0;
        PC = 0;
    end

    always #10 clk = ~clk;
    
    always @(negedge clk) begin
        PC = PC + 1;
    end

endmodule
