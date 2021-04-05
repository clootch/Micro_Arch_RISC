`timescale 1ns / 1ps

module DOF_TB();
    reg [31:0] IR,PC_n1,A,B;
    reg clk,reset;
    wire [1:0] MD,BS;
    wire [4:0] AA,BA,DA,FS,SH;
    wire [31:0] BUS_A, BUS_B,PC_n2;
    wire RW,PS,MW;
    
    DOF uut(
    .IR(IR),
    .PC_n1(PC_n1),
    .A(A),
    .B(B),
    .clk(clk),
    .reset(reset),
    .MD(MD),
    .BS(BS),
    .AA(AA),
    .BA(BA),
    .DA(DA),
    .FS(FS),
    .SH(SH),
    .BUS_A(BUS_A),
    .BUS_B(BUS_B),
    .PC_n2(PC_n2),
    .RW(RW),
    .PS(PS),
    .MW(MW)
    );
    initial begin
        reset = 0;
        clk = 0;
        PC_n1 = 32'b111;
        #2;
        PC_n1 = 32'b101;
        //tests the PC_n2 connection to PC_n1 
        IR = 32'b0000010_00101_00001_00010_0000000000;
    end
    
    always #5 clk = ~clk;
endmodule
