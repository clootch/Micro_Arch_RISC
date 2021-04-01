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
	integer i;
	//Now to do the real work here.
	initial begin
	   for(i = 0; i < 32; i = i+1) begin 
	     registers[i] = 0;
	   end
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