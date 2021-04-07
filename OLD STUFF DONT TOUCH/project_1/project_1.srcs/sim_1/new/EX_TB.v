`timescale 1ns / 1ps

module EX_TB();

reg clk,reset,RW,PS,MW;
reg [31:0] PC_n2,Bus_A,Bus_B;
reg [4:0] DA;
reg [1:0] MD,BS;
reg [5:0] FS, SH;

wire RWo,NV,Z;
wire [1:0] MDo;
wire [4:0] DAo;
wire [31:0] BrA, RAA, data_out, F;

integer i;

initial begin
    clk = 0;
    PC_n2 = 0;
    Bus_A = 1;
    Bus_B = 1;
    for(i = 0; i<32; i = i +1) begin
        FS = i;
    end
    
end

always @(posedge clk) PC_n2=PC_n2+1;
always #5 clk = ~clk;
endmodule
