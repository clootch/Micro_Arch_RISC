`timescale 1ns / 1ps

module Shifter_TB();
    reg[4:0] SH;
    reg[31:0] A;
    reg[1:0] direction;
    wire[31:0] shiftOut;
    Shifter uut(
    .direction(direction),
    .SH(SH),
    .A(A),
    .shiftOut(shiftOut)
    );
    
    initial begin
        direction = 2'b10; //left 
        SH = 6'd3; //3 bits
        A = 5'b10000; //input
        #10; //wait :D
        A = 32'b11111111111111111111110001; //bigboi num
        SH = 6'd7; //shift 7 bits
        #5;
        direction = 2'b11; //right
        
    end
endmodule
