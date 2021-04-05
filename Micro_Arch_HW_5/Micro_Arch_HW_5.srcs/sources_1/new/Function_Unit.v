module Function_Unit(
	input clk,
	input reset,
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
wire[31:0] shiftval; 
reg checkV;
Shifter shifter(
.SH(SH),.A(A),.shiftOut(shiftval));
always @(*)
begin
	case(FS)
		5'b00000: F = A;
		5'b00010: {C,F} = {1'b0,A} + {1'b0,B};
		5'b00101: {C,F} = {1'b0,A} + {1'b0,B} + 1; //Need a special case here (Refer to Table 10-20)
		5'b01000: F = A & B;
		5'b01010: F = A | B;
		5'b01100: F = A ^ B;
		5'b01110: F = ~A;
		5'b00111: {C,F} = {1'b0,A} + 1;
		5'b10000: F = shiftval; //shifty stuff here
		5'b10001: F = shiftval; //shifty stuff here
		default: F = 1'bx;
	endcase
	case(FS)
	   5'b00010: checkV = 1;
	   5'b00101: checkV = 1;
	   5'b00111: checkV = 1;
	   default: checkV = 0;
	endcase
	//Zero
	if (F == 0)
	begin
		Z = 0;
	end
	//overflow 
	if(checkV)
	begin
	   case ({A[31],B[31],F[31]})
		  3'b110:	V = 1;
		  3'b001: V = 1;
		  default: V = 0;
	   endcase
	end
	else
	begin
	   V = 0;
	end
	//Negative 
	if(F[31] == 1)
	begin
		N = F[31];
	end
end
endmodule