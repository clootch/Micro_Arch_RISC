`timescale 1ns / 1ps

module IF(
    input PC,
    output PC_n1
    );
    
    assign PC_n1 = PC + 1; //update PC for IF time 
endmodule

