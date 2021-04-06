module Memory(
    input clk,
	input reset,
    input A,
    //input Bus_A,
    //input Bus_B,
    //input [9:0] address_in,
    output MW,
    output reg [31:0] data_out
);

    reg [31:0] memory [1024:0];
    integer i;

    //Initialize everything to 0
    initial begin
        for(i=0; i<1023; i=i+1)
        begin
            memory[i] = 32'd0;
        end
        data_out = 32'd0;
    end

    always @ (negedge clk)
    begin
        if(!reset)
        begin
            //Do stuff
        end else begin
            //Same loop as initial begin, set everything to 0
            for(i=0; i<1023; i=i+1)
            begin
                memory[i] = 32'd0;
            end
        end
    end

endmodule