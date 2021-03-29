module Instuction_Decoder(
	input [31:0] instruction,
	output[6:0] opcode,
	output RW,
	output[1:0] MD,
	output[1:0] BS,
	output PS,
	output MW,
	output[4:0] FS,
	output MA,
	output MB,
	output[4:0] AA,
	output[4:0] BA,
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