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
integer i;
initial begin
    clk = 0;
    reset = 0;
    for(i = 0; i < 73; i = i + 1)
    begin
        PC = i;
        #10;
    end
    reset = 1;
    for(i = 0; i < 73; i = i + 1)
    begin
        PC = i;
        #10;
    end
end
always
begin
    clk = ~clk;
    #5;
end
endmodule
