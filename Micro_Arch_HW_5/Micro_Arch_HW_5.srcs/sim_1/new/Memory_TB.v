`timescale 1ns / 1ps

module Memory_TB();
    reg clk = 0;
    reg [31:0] A = 0;
    reg [31:0] B = 0;
    reg MW = 0;  
    wire [31:0] data_out;
    reg [31:0] count = 0;
    
    Memory uut(
        .clk(clk),
        .A(A),
        .B(B),
        .MW(MW),
        .data_out(data_out)
    );
    
    always #5 clk = ~clk;

    //Count initialized to 0
    //Set values based on count to verify
    //Correct output from TB
    always @(posedge clk) begin 
        if(count==1) begin
            A = 1;
            B = 69;
            MW = 1;
        end
        if(count == 2) begin
            A = 2;
            B = 420;
            MW = 1;
        end
        if(count == 3) begin
            A = 3;
            B = 69420;
            MW = 1;
        end
        if(count == 4) begin
            A = 2;
            B = 69420;
            MW = 0;
        end
        if(count == 6) begin
            A = 3;
            B = 69420;
            MW = 0;
        end
        if(count == 10) begin
            A = 1;
            B = 69420; //shoudn't matter
            MW = 0;
        end
        
        count = count+1; //Count++ every time
    end
endmodule

