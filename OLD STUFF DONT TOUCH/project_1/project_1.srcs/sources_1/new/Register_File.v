module Register_File(
	input[4:0] AA,
	input[4:0] BA,
	input[4:0] DA,
	input RW,
	input clk,
	input[31:0] D,
	output[31:0] A,
	output[31:0] B
);
	//All the necessary registers.
	reg[31:0] registers[31:0];
	reg[4:0] addrA;
	reg[4:0] addrB;
	//Now to do the real work here.
	initial begin
	registers[0] = 32'b0;
	registers[1] = 32'b11100;
	registers[2] = 32'b0;
	registers[3] = 32'b0;
	registers[4] = 32'b0;
	registers[5] = 32'b0;
	registers[6] = 32'b0;
	registers[7] = 32'b0;
	registers[8] = 32'b0;
	registers[9] = 32'b0;
	registers[10] = 32'b0;
	registers[11] = 32'b0;
	registers[12] = 32'b0;
	registers[13] = 32'b0;
	registers[14] = 32'b0;
	registers[15] = 32'b0;
	registers[16] = 32'b0;
	registers[17] = 32'b0;
	registers[18] = 32'b0;
	registers[19] = 32'b0;
	registers[20] = 32'b0;
	registers[21] = 32'b0;
	registers[22] = 32'b0;
	registers[23] = 32'b0;
	registers[24] = 32'b0;
	registers[25] = 32'b0;
	registers[26] = 32'b0;
	registers[27] = 32'b0;
	registers[28] = 32'b0;
	registers[29] = 32'b0;
	registers[30] = 32'b0;
	registers[31] = 32'b0;
	end
	
	
	assign A = registers[addrA];
	assign B = registers[addrB];
	always @ (negedge clk)
	begin
	   addrA = AA;
	   addrB = BA;
		if(RW)
		begin
			registers[DA][31:0] = D;
		end
	end
endmodule