module datapath #(parameter N = 4) (
    input clk,
    input [N-1:0] a,
    input [N-1:0] b,
    input sftA, clrA, ldA,
    input sftQ, clrQ, ldQ,
    input ldM, clrff,
    input add_sub,
    input ldC, dec, enf,
    output q0, q1,
    output eqz,
    output [2*N-1:0] data_out

);

wire [N-1:0] M, Q, A; // inputs to M and Q registers
wire [N-1:0] alu_out; // output of ALU
wire [N-1:0] counter; // counter to keep track of number of operations


pipo #(N) M_reg(clk, ldM, a,M ); // multiplicand register
shiftreg #(N) Q_reg(clk, sftQ, clrQ, ldQ, A[0], b, Q ); // multiplier register
shiftreg #(N) A_reg(clk, sftA, clrA, ldA, A[N-1], alu_out, A ); // accumulator register
alu #(N) ALU(A, M, add_sub, alu_out); // ALU for addition/subtraction
dff q0_ff(clk, clrff, enf, Q[0], q0); // flip-flop to store Q0
counter #(N) count(clk, ldC, dec, counter); // counter to keep track of number of operations

assign eqz = (counter == 0) ? 1 : 0; // check if counter is zero
assign data_out = {A, Q}; // output concatenation of A and Q
assign q1 = Q[0]; // assign q0 to least significant bit of Q


endmodule
