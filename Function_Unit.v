module Function_Unit(
	input[31:0] A,
	input[31:0] B,
	input[4:0] SH,
	input[4:0] FS,
	output reg Z,
	output reg N,
	output reg V,
	output reg C,
	output reg[31:0] F 
);
reg[31:0] shiftOut;
Shifter shiftyboi(
.SH(SH),.A(A),.shiftOut(F));
always @(*)
begin
	case(FS)
		5'b00000: F = A;
		5'b00010: {C,F} = {1'b0,A} + {1'b0,B};
		5'b00101: {C,F} = {1'b0,A} + {1'b0,B} + 1; //Need a special case here (Refer to Table 10-20)
		5'b01000: F = A && B;
		5'b01010: F = A || B;
		5'b01100: F = A ^ B;
		5'b01110: F = A;
		5'b00111: {C,F} = {1'b0,A} + 1;
		5'b10000: F = A; //shifty stuff here
		5'b10001: F = A; //shifty stuff here
		default: F = A;
	endcase
	//Zero
	if (F == 0)
	begin
		Z = 0;
	end
	//overflow 
	case ({A[31],B[31],F[31]})
		3'b110:	V = 1;
		3'b001: V = 1;
		default: V = 0;
	endcase
	//Negative 
	if(F[31] == 1)
	begin
		N = F[31];
	end
end
endmodule