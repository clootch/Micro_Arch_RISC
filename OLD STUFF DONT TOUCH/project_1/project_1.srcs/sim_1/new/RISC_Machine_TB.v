`timescale 1ns / 1ps

module RISC_Machine_TB();
    
    reg reset = 0;
    RISC_Machine uut(
        .reset(reset)
    );
    
    
endmodule
