module register_file(
	input AA[4:0],
	input BA[4:0],
	input DA[4:0],
	input RW,
	input clk,
	input D[31:0],
	output A[31:0],
	output B[31:0]
);
	//All the necessary registers.
	reg registers[31:0][31:0];
	/*
	reg r0[31:0];
	reg r1[31:0];
	reg r2[31:0];
	reg r3[31:0];
	reg r4[31:0];
	reg r5[31:0];
	reg r6[31:0];
	reg r7[31:0];
	reg r8[31:0];
	reg r9[31:0];
	reg r10[31:0];
	reg r11[31:0];
	reg r12[31:0];
	reg r13[31:0];
	reg r14[31:0];
	reg r15[31:0];
	reg r16[31:0];
	reg r17[31:0];
	reg r18[31:0];
	reg r19[31:0];
	reg r20[31:0];
	reg r21[31:0];
	reg r22[31:0];
	reg r23[31:0];
	reg r24[31:0];
	reg r25[31:0];
	reg r26[31:0];
	reg r27[31:0];
	reg r28[31:0];
	reg r29[31:0];
	reg r30[31:0];
	reg r31[31:0];*/
	reg addrA;
	reg addrB;
	//Now to do the real work here.
	initial begin
	/*
		r0 = 0;
		r1 = 0;
		r2 = 0;
		r3 = 0;
		r4 = 0;
		r5 = 0;
		r6 = 0;
		r7 = 0;
		r8 = 0;
		r9 = 0;
		r10 = 0;
		r11 = 0;
		r12 = 0;
		r13 = 0;
		r14 = 0;
		r15 = 0;
		r16 = 0;
		r17 = 0;
		r18 = 0;
		r19 = 0;
		r20 = 0;
		r21 = 0;
		r22 = 0;
		r23 = 0;
		r24 = 0;
		r25 = 0;
		r26 = 0;
		r27 = 0;
		r28 = 0;
		r29 = 0;
		r30 = 0;
		r31 = 0;
		*/
	for (int i = 0;i<=31;i++)
		begin
			//This might work. Im not exactly sure.
			registers[i] = i[31:0];
		end
	end
	assign addrA = AA;
	assign addrB = BA;
	assign A = registers[addrA];
	assign B = registers[addrB];
	always @ (negedge clk)
	begin
		if(RW)
		begin
			registers[DA] = D;
		end
	end
endmodule