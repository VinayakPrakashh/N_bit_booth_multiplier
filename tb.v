`timescale 1ns / 1ps

module booth_multiplier_tb;

    parameter N = 4;

    // Signals
    reg clk;
    reg start;
    reg signed [N-1:0] a;      // Multiplicand (-7)
    reg signed [N-1:0] b;      // Multiplier (3)
    wire signed [2*N-1:0] data_out;
    wire done;

    // DUT instantiation
    top #(N) dut (
        .clk(clk),
        .start(start),
        .a(a),
        .b(b),
        .data_out(data_out),
        .done(done)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test: -7 x 3 = -21
    initial begin
        start = 1'b0;
        #20;

        // Setup inputs
        a = 6;   // -7 in 4-bit two's complement (1001)
        b = 4;    // 3 in 4-bit two's complement (0011)
        start = 1'b1;
        #10 start = 1'b0;

        // Wait for completion
        wait(done);
        @(posedge clk);

        // Display results
        $display("Input:  a = %d, b = %d", a, b);
        $display("Output: %d x %d = %d (Expected: -21)", a, b, data_out);

        if (data_out == -21)
            $display("✓ TEST PASSED");
        else
            $display("✗ TEST FAILED (Got %d instead of -21)", data_out);

        #20 $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | start=%b | done=%b | a=%d | b=%d | out=%d",
                 $time, start, done, a, b, data_out);
    end

    // Waveform dump
    initial begin
        $dumpfile("booth.vcd");
        $dumpvars(0, booth_multiplier_tb);
    end

endmodule