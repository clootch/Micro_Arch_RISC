`timescale 1ns / 1ps

module Shifter(
    input[1:0] direction,
    input[4:0] SH,
    input[31:0] A,
    output reg[31:0] shiftOut
    );
    always @ (*)
    begin
        /*
        case(direction)
            2'b00: shiftOut = A;
            2'b01: shiftOut = A;
            2'b10: shiftOut = A>>SH | A<<(32-SH);// RIGHT Shift
            2'b11: shiftOut = A<<SH | A>>(32-SH); // LEFT Shift
        endcase
        */
        case(direction)
            2'b00: shiftOut = A;
            2'b01: shiftOut = A;
            2'b10: shiftOut = A>>SH;// RIGHT Shift
            2'b11: shiftOut = A<<SH; // LEFT Shift
        endcase
    end
endmodule