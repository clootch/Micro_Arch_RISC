`timescale 1ns / 1ps

module WB_TB();
    reg RW,NV,clk;
    reg [4:0] DA;
    reg [1:0] MD;
    reg [31:0] F, DATA;
    
    wire [4:0] DA_o;
    wire [31:0] BUS_D;
    wire RW_o;
    
    WB uut(
        .RW(RW),
        .DA(DA),
        .MD(MD),
        .F(F),
        .NV(NV),
        .DATA(DATA),
        .clk(clk),
        .DA_o(DA_o),
        .RW_o(RW_o),
        .BUS_D(BUS_D)
    );

    Register_File RF(
            .DA(DA_o),
            .clk(clk),
            .RW(RW_o),
            .D(BUS_D)
        );

    initial begin
        clk = 0;
        DATA = 32'd123;
        DA = 32'd4;
        NV = 0;
        F = 0;
    end
    
    reg [31:0] count = 0;
    
    always @(negedge clk) begin
        if(count == 1) begin
            MD = 1;
            RW = 1;
            DA = 1;
            F = 11;
            NV = 0;
            
        end
        
        
        
        count = count + 1;
    end

    always #5 clk = ~clk;
endmodule
