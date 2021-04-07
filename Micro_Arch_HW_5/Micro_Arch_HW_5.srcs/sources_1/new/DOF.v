`timescale 1ns / 1ps

module DOF(
    input[31:0] IR,
    input clk,
    input reset,
    input [31:0] PC_n1,
    output reg [31:0] PC_n2 = 0,
    output reg [4:0] DA = 0, //5 bits since its reg index not addr
    output reg [1:0] MD = 0,
    output reg [1:0] BS = 0,
    output reg PS = 0,
    output reg MW = 0,
    output reg [4:0] FS = 0, 
    output reg [5:0] SH = 0,
    output reg [31:0] BUS_A = 0,
    output reg [31:0] BUS_B =0,
    //register stuff
    output reg [4:0] AA=0, BA=0,
    output reg RW=0,
    input [31:0] A,B
    );
    
    reg [14:0] IM;
    reg MA;
    reg MB;
    reg CS;
    reg [31:0] CU; //constant unit output
	wire [14:0] CW;
    reg [4:0] FS_int;


    
    Instruction_Decoder Instruction_Decoder(
		clk,
		IR[31:25],
		CW
	);
    
    
    
    //assign IM = IR[14:0];    
    always @ (negedge clk) begin
        if(!reset) begin
            PC_n2 = PC_n1;
            {RW, MD, BS, PS, MW, FS_int, MB, MA, CS} <= CW; 
            {DA, AA, BA} = IR[24:10]; //DA/SA/SB
            IM = IR[14:0];
            SH = IR[4:0];
            //padding out IM to 32 bits based on CS
            CU = (CS && IM[14]) ? 
                {17'h1FFFF, IM} : {17'b0, IM};
            
            BUS_A = (MA) ? PC_n1 : A; //finished
            BUS_B = (MB) ? CU : B; //finished
            
            FS <= FS_int;
            
        end else begin
            PC_n2 = 0;
            {DA, RW, MD, BS, PS, MW, FS, MB, MA, CS, FS, SH} = 0; 
            {AA, BA} = 0; //SA/SB
            {BUS_A, BUS_B} = 0;
            
        end
    end
endmodule
