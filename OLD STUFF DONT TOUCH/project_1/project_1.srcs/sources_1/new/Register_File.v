module Register_File(
	input[4:0] AA,
	input[4:0] BA,
	input[4:0] DA,
	input RW,
	input clk,
	input[31:0] D,
	output[31:0] A,
	output[31:0] B
	//needs ZVNC or ALU does that
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
	   
	   //constant arithmetic registers for ALU testing
	   registers[1] = 4;
	   registers[2] = -1;
	   registers[3] = 1001;
	   registers[4] = -4350;
	end
	
	assign A = registers[AA];
	assign B = registers[BA];
	
	always @ (posedge clk) begin
	   if(RW==1 && DA!=0)
			registers[DA] = D;
	end
endmodule