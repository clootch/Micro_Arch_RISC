module Adder(
	input[31:0] PC,
	input[31:0] B,
	output[31:0] BrA
);
	assign BrA = PC + B;
endmodule
