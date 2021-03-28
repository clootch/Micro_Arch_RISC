module Instuction_Decoder(
	input [31:0] instruction,
	output opcode[6:0],
	output RW,
	output MD[1:0],
	output BS[1:0],
	output PS,
	output MW,
	output FS[4:0],
	output MA,
	output MB,
	output AA[4:0],
	output BA[4:0],
	output CS
	//Not 100% sure about what goes where.
);
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

endmodule