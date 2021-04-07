`timescale 1ns / 1ps

module RISC_Machine(
        input reset
    );
    
    reg clk;
    
    //declarations for Register File
    wire [4:0] top_AA, top_BA, top_DA, top_DA_inter, top_DA_inter2;
    wire [31:0] top_D, top_A, top_B;
    wire top_RW, top_RW_inter, top_RW_inter2;

    Register_File RF(
        .AA(top_AA),
        .BA(top_BA),
        .DA(top_DA),
        .clk(clk),
        .RW(top_RW),
        .D(top_D),
        .A(top_A),
        .B(top_B)
    );
    
    
    //declarations for IF
    wire [31:0] top_PC_n1,top_IR;    
    reg [31:0] top_PC;
    
    
    IF IF(
        .PC(top_PC),
        .clk(clk),
        .reset(reset),
        .PC_n1(top_PC_n1),
        .IR(top_IR)
    ); //include register shit
    
    
    wire [31:0] top_PC_n2, top_BUS_A, top_BUS_B;
    wire [4:0] top_FS;
    wire [1:0] top_MD, top_MD_inter;
    wire [1:0] top_BS, top_BS_inter;
    wire [5:0] top_SH;
    wire top_PS, top_PS_inter, top_MW;
    DOF DOF(
        .IR(top_IR),
        .clk(clk),
        .reset(reset),
        .PC_n1(top_PC_n1),
        .PC_n2(top_PC_n2),
        .DA(top_DA_inter),
        .MD(top_MD_inter),
        .BS(top_BS_inter),
        .PS(top_PS_inter),
        .MW(top_MW),
        .FS(top_FS),
        .SH(top_SH),
        .BUS_A(top_BUS_A),
        .BUS_B(top_BUS_B),
        .AA(top_AA),
        .BA(top_BA),
        .RW(top_RW_inter),
        .A(top_A),
        .B(top_B)
    );
    
    wire [31:0] top_data_out, top_BrA, top_RAA;
    wire [31:0] top_F;
    wire top_NV;
    wire top_Z;
    
    EX EX(
        .clk(clk),
        .reset(reset),
        .PC_n2(top_PC_n2),
        .RW(top_RW_inter),
        .DA(top_DA_inter),
        .MD(top_MD_inter),
        .BS(top_BS_inter),
        .PS(top_PS_inter),
        .MW(top_MW),
        .FS(top_FS),
        .SH(top_SH),
        .Bus_A(top_BUS_A),
        .Bus_B(top_BUS_B),
        .RWo(top_RW_inter2),
        .DAo(top_DA_inter2),
        .MDo(top_MD),
        .data_out(top_data_out),
        .F(top_F),
        .NV(top_NV),
        .Z(top_Z),
        .BrA(top_BrA),
        .RAA(top_RAA),
        .BS_out(top_BS),
        .PS_out(top_PS)        
    );
    
    
    WB WB(
        .RW(top_RW_inter2),
        .DA(top_DA_inter2),
        .MD(top_MD),
        .F(top_F),
        .NV(top_NV),
        .DATA(top_data_out),
        .clk(clk),
        .DA_o(top_DA),
        .RW_o(top_RW),
        .BUS_D(top_D)
    );
    
    
    
    initial begin 
        clk = 0;
    end
    
    always #5 clk = ~clk;
    
    wire [31:0] PC_temp;
    assign PC_temp = {top_BS[1], (((top_PS ^ top_Z) | top_BS[1]) & top_BS[0])};
    always @(negedge clk) top_PC = (PC_temp==0) ? 
                                    top_PC_n1 : (PC_temp==1 || PC_temp==3) ?
                                        top_BrA : top_RAA;
endmodule
