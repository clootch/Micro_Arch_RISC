`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 01:49:48 PM
// Design Name: 
// Module Name: Instruction_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Instruction_Decoder(
    input[31:0] instruction,
    output[6:0] opcode,
    output RW,
    output[1:0] MD,
    output[1:0] BS,
    output PS,
    output MW,
    output[4:0] FS,
    output MB,
    output MA,
    output CS
    );
    assign opcode = instruction[31:25];
    assign RW = instruction[24];
    //assign DA = instruction[something];
    //assign AA = instruction[something];
    //assign BA = instruction[something];
    assign CS = instruction[0];
endmodule
