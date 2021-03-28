module Adder(
	input PC[31:0],
	input B[31:0],
	output BrA[31:0]
);
	assign BrA = PC + B;
endmodule
