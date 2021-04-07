`timescale 1ns / 1ps

module RISC_Machine(
        input reset
    );
    
    reg clk;
    
    //declarations for Register File
    wire [4:0] top_AA, top_BA, top_DA;
    wire [31:0] top_D, top_A, top_B;

    Register_File RF(
        .AA(top_AA),
        .BA(top_BA),
        .DA(top_DA),
        .clk(clk),
        .RW(RW),
        .D(top_D),
        .A(top_A),
        .B(top_B)
    );
    
    
    //declarations for IF
    wire [31:0] top_PC_n1,top_IR,top_PC;    
    
    IF IF(); //include register shit
    
    
    DOF DOF();
    
    
    EX EX();
    
    
    WB WB();
    
    
    
    initial begin 
        clk = 0;
    end
    
    always #5 clk = ~clk;

endmodule
