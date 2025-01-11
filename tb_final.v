`timescale 1ns / 1ps

module tb_final;

    parameter N = 4;

    // Inputs
    reg clk;
    reg start;
    reg [N-1:0] data_M;
    reg [N-1:0] data_Q;

    // Outputs
    wire [N-1:0] counter;
    wire [2*N-1:0] data_out;
    wire done;

    // Instantiate the Unit Under Test (UUT)
    top #(N) uut (
        .clk(clk),
        .start(start),
        .data_M(data_M),
        .data_Q(data_Q),
        .data_out(data_out),
        .done(done)
    );

    assign counter = uut.dp.counter;

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        start = 0;
        data_M = 0;
        data_Q = 0;

        // Apply test vectors
        data_M = -6; 
        data_Q = -3; 
        #10;

        start = 1;
        #10 start = 0;

        // Wait for the done signal to become 1
        wait(done == 1);

        // Finish simulation
        #10;
        $finish;
    end

endmodule
