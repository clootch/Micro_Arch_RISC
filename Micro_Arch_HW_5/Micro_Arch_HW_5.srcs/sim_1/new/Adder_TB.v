`timescale 1ns / 1ps

module Adder_TB();
reg[31:0] PC;
reg [31:0] B;
wire[31:0] BrA;
Adder uut(
.PC(PC),
.B(B),
.BrA(BrA));

//We load several values into inputs to verify
//that the output is adding correctly
initial begin
   PC = 32'd123; //PC gets 123
   B = 32'd5; //B gets 5
   #10; //Pause while BrA displays output
   PC = 32'd145; //145 into PC
   B = 32'd1; //1 into B
end
endmodule
