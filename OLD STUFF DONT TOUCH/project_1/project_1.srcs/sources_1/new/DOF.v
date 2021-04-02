`timescale 1ns / 1ps

module DOF(
    input[31:0] IR,
    input clk,
    input reset,
    output[31:0] PC_n1,
    output reg [31:0] PC_n2,
    output reg RW,
    output reg DA,
    output reg MD,
    output reg BS,
    output reg PS,
    output reg MW,
    output reg FS,
    output reg SH,
    output reg [31:0] A,
    output reg [31:0] B
    );
    reg [14:0] IM;
    reg MA;
    reg MB;
    reg AA;
    reg BA;
    reg CS;
    Register_File Register_File();
    Instruction_Decoder Instruction_Decoder();
    //assign IM = IR[14:0];    
    always @ (negedge clk) begin
        //Do the Latch assignmtnets here :)
    end
    always @ (reset)
    begin
        if(reset)
        begin
            //Do the reset switch stuff here :)        
        end
    end
endmodule
