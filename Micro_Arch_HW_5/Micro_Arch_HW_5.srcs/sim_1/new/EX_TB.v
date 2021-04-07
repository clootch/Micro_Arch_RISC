`timescale 1ns / 1ps

module EX_TB();

    reg clk,reset,RW,PS,MW;
    reg [31:0] PC_n2,Bus_A,Bus_B;
    reg [4:0] DA, FS;
    reg [1:0] MD,BS;
    reg [5:0] SH;

    wire RWo,NV,Z;
    wire [1:0] MDo;
    wire [4:0] DAo;
    wire [31:0] BrA, RAA, data_out, F;
    
    reg [31:0] count =0;

    integer i;
    
    EX ex0 (
        .clk(clk),
        .reset(reset),
        .PC_n2(PC_n2),
        .RW(RW),
        .DA(DA),
        .MD(MD),
        .BS(BS),
        .PS(PS),
        .MW(MW),
        .FS(FS),
        .SH(SH),
        .Bus_A(Bus_A),
        .Bus_B(Bus_B),
        .RWo(RWo),
        .DAo(DAo),
        .MDo(MDo),
        .data_out(data_out),
        .F(F),
        .NV(NV),
        .Z(Z),
        .BrA(BrA),
        .RAA(RAA)
    );

    initial begin
        clk = 0;
        PC_n2 = 0;
        Bus_A = 1;
        Bus_B = 1;
        FS = 0;   
        {clk,reset,RW,PS,MW} = 0;
        SH = 0;
        {DA,FS} = 0;     
    end
    
    reg void;
    always @(negedge clk) begin
        if (count==0) begin
            Bus_A = 1;
            Bus_B = 1;
            {RW, MD, BS, PS, MW, FS, void, void, void} =15'b1__00_00_0__0__00010_0__0__0;
            
        end
        
        
        count = count + 1;
    end

    always @(negedge clk) PC_n2=PC_n2+1;
    always #5 clk = ~clk;
    
endmodule
