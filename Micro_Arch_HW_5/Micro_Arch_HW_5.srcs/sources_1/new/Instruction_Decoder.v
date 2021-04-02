module Instruction_Decoder(
    input clk,
	input [6:0] opcode,
	output reg [14:0] CW
);
//takes in opcode, decides everything based on that.
/*
assign opcode = instruction[31:25];
assign RW = instruction[24];
assign MD = instruction[23:22];
assign BS = instruction[21:20];
assign PS = instruction[19];
assign MW = instruction[18];
assign FS = instruction[17:13];
assign MA = instruction[12];
assign MB = instruction[11];
assign AA = instruction[10:6];
assign BA = instruction[5:1];
assign CS = instruction[0];
*/
    always @(posedge clk) begin
        case(opcode)
            //                RW MD BS PS MW FS    MB MA CS
            0000000: CW = 15'b0__00_00_0__0__00000_0__0__0; //NOP            
            0000010: CW = 15'b1__00_00_0__0__00010_0__0__0; //ADD
            0000101: CW = 15'b1__00_00_0__0__00101_0__0__0; //SUB
            1100101: CW = 15'b1__10_00_0__0__00101_0__0__0; //SLT      
            0001000: CW = 15'b1__00_00_0__0__01000_0__0__0; //AND      
            0001010: CW = 15'b1__00_00_0__0__01010_0__0__0; //OR      
            0001100: CW = 15'b1__00_00_0__0__01100_0__0__0; //XOR       
            0000001: CW = 15'b0__00_00_0__1__00000_0__0__0; //ST      
            0100001: CW = 15'b1__01_00_0__0__00000_0__0__0; //LD       
            0100010: CW = 15'b1__00_00_0__0__00010_0__0__0; //ADI       
            0100101: CW = 15'b1__00_00_0__0__00101_0__0__0; //SBI       
            0101110: CW = 15'b1__00_00_0__0__01110_0__0__0; //NOT      
            0101000: CW = 15'b1__00_00_0__0__01000_0__0__0; //ANI      
            0101010: CW = 15'b1__00_00_0__0__01010_0__0__0; //ORI      
            0101100: CW = 15'b1__00_00_0__0__01100_0__0__0; //XRI      
            1100010: CW = 15'b1__00_00_0__0__00010_0__0__0; //AIU      
            1000101: CW = 15'b1__00_00_0__0__00101_0__0__0; //SIU      
            1000000: CW = 15'b1__00_00_0__0__00000_0__0__0; //MOV      
            0110000: CW = 15'b1__00_00_0__0__10000_0__0__0; //LSL      
            0110001: CW = 15'b1__00_00_0__0__10001_0__0__0; //LSR      
            1100001: CW = 15'b0__00_10_0__0__00000_0__0__0; //JMR      
            0100000: CW = 15'b0__00_01_0__0__00000_0__0__0; //BZ  
            1100000: CW = 15'b0__00_01_1__0__00000_0__0__0; //BNZ    
            1000100: CW = 15'b0__00_11_0__0__00000_0__0__0; //JMP   
            0000111: CW = 15'b1__00_11_0__0__00111_0__0__0; //JML
            default: CW = 15'b0;
        endcase
    end
endmodule