module Memory(
    input clk,
    input [31:0] A,
    input [31:0] B,
    input MW,
    output [31:0] data_out
);

    reg [31:0] memory [1023:0];
    integer i;

    //Initialize everything to 0
    initial begin
        for(i=0; i<1024; i=i+1)
        begin
            memory[i] = 32'd0;
        end
    end

    assign data_out = memory[A];

    always @(posedge clk) if(MW) memory[A] = B;

endmodule