module Memory(
    input clk,
    input A,
    input B,
    //input Bus_A,
    //input Bus_B,
    //input [9:0] address_in,
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
        //data_out = 32'd0;
    end

    assign data_out = memory[A];

    always @(negedge clk) if(MW) memory[A] = B;

endmodule