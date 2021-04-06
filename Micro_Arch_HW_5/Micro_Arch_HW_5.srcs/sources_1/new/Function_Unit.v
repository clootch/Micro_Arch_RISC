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
wire[31:0] shiftval; 
reg [1:0] direction;
Shifter shifter(
.direction(direction),
.SH(SH),
.A(A),
.shiftOut(shiftval));
initial begin
Z = 0;
C = 0;
V = 0;
N = 0;
end

always @(*)
begin
    direction = ~FS[1:0];
	case(FS)
		5'b00000: begin
		F = A;
		V = 0;
		end
		5'b00010: begin
		{C,F} = {1'b0,A} + {1'b0,B};
		V = (A[31] == B[31]) && (A[31] != F[31]);
		end
		5'b00101: begin
		{C,F} = {1'b0,A} + {1'b0,B} + 1; //Need a special case here (Refer to Table 10-20)
		V = (A[31] == B[31]) && (A[31] != F[31]);
		end
		5'b01000: begin
		F = A & B;
		V =0;
		end
		5'b01010: begin
		F = A | B;
		V =0;
		end
		5'b01100: begin
		F = A ^ B;
		V =0;
		end
		5'b01110: begin
		F = ~A;
		V =0;
		end
		5'b00111: begin
		{C,F} = {1'b0,A} + 1;
		V = F[31] != A[31] && A[31] == 0;
		end
		5'b10000: begin
		F = shiftval; //left
		V =0;
		end
		5'b10001: begin
		F = shiftval; //right
		V =0;
		end
		default: begin
		F = 1'b0;
		V =0;
		end
	endcase
	//Zero
	if (F == 0)
	begin
		Z = 0;
	end
	//Negative 
	if(F[31] == 1)
	begin
		N = F[31];
	end
end
endmodule