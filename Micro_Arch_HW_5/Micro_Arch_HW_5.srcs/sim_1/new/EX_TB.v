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
    
    reg [31:0] count =-1;

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
    always @(posedge clk) begin
        
        
        if (count==0) begin
            Bus_A = 32'b01111111111111111111111111111111;
            Bus_B = 32'b1;
            //ADD
            {RW, MD, BS, PS, MW, FS, void, void, void} =15'b1__00_00_0__0__00010_0__0__0; 
        end
        if (count == 1) begin
            //ST
            Bus_A = 32'b1;
            Bus_B = 32'b101010101;
            //#5;
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b0__00_00_0__1__00000_0__0__0;
        end
        if (count == 2) begin
            //#5;
            //LSL
            Bus_A = 32'b111110000111000011111;
            SH = 5;
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b1__00_00_0__0__10000_0__0__0;
        end
        if (count == 3) begin
            Bus_A = 1;
            //#5; 
            //LD
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b1__01_00_0__0__00000_0__0__0;
        end
        if (count == 4) begin
            //#5;
            //BNZ
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b0__00_01_0__0__00000_1__0__1;
        end
        if (count == 5) begin
            //#5;
            //MOV
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b1__00_00_0__0__00000_0__0__0;
        end
        if (count == 6) begin
            //#5;
            //JMP
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b0__00_11_0__0__00000_1__0__1;
        end
        if (count == 7) begin
            //#5;
            //NOP
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b0__00_00_0__0__00000_0__0__0;
        end
        if (count == 8) begin
            //#5;
            //ADI
            Bus_A = 32'b10000000000000000000000000000000;
            Bus_B = 32'b1;
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b1__00_00_0__0__00010_1__0__1;
        end
        if ( count == 9) begin
            //#5;
            //AND
            {RW, MD, BS, PS, MW, FS, void, void, void} = 15'b1__00_00_0__0__01000_0__0__0;
        end        
    end
    always @(negedge clk) count = count + 1;
    always @(negedge clk) PC_n2=PC_n2+1;
    always #5 clk = ~clk;
    
endmodule
