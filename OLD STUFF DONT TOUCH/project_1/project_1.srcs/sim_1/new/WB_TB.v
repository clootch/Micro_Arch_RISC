`timescale 1ns / 1ps

module WB_TB();
reg RW,NV,clk;
reg [4:0] DA;
reg [1:0] MD;
reg [31:0] F, DATA;
WB uut(
.RW(RW),
.DA(DA),
.MD(MD),
.F(F),
.NV(NV),
.DATA(DATA),
.clk(clk)
);

Register_File RF(
        .DA(DA),
        .clk(clk),
        .RW(RW),
        .D(D)
    );

initial begin
    clk = 0;
    DATA = 32'd123;
    DA = 5'd4;
    NV = 0;
    
end

always #5 clk = ~clk;
endmodule
