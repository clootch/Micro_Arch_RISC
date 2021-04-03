`timescale 1ns / 1ps

module DOF(
    input[31:0] IR,
    input clk,
    input reset,
    output[31:0] PC_n1,
    output reg [31:0] PC_n2,
    output reg RW,
    output reg [6:0] DA, //6 bits? since its addr
    output reg [1:0] MD,
    output reg [1:0] BS,
    output reg PS,
    output reg MW,
    output reg [4:0] FS,
    output reg [4:0] SH,
    output reg [31:0] A,
    output reg [31:0] B
    );
    reg [14:0] IM;
    reg MA;
    reg MB;
    reg [6:0] AA;
    reg [6:0] BA;
    reg  CS;
    Instruction_Decoder Instruction_Decoder();
    //assign IM = IR[14:0];    
    always @ (negedge clk) begin
        
    end
    always @ (reset)
    begin
        if(reset)
        begin
            //Do the reset switch stuff here :)        
        end
    end
endmodule
