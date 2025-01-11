module datapath #(parameter N = 4) (
    input clk, ldA, clrA, sftA, ldQ, clrQ, sftQ, ldM, clrff, add_sub, ldC, dec, enf,
    output reg q0, qm1,
    output eqz,
    input [N-1:0] data_M, data_Q,
    output [2*N-1:0] data_out
);

wire [N-1:0] M, Q, A, Z;
wire [N-1:0] counter;

//combinational 
assign eqz = (counter == 0) ? 1 : 0;
assign data_out = {A, Q};

//sequential 
always @(posedge clk) begin
    q0 <= Q[0];
    qm1 <= Qm1;
end

shiftreg #(N) sA(clk, sftA, clrA, ldA, A[N-1], Z, A);
shiftreg #(N) sQ(clk, sftQ, clrQ, ldQ, A[0], data_Q, Q);
pipo #(N) m(clk, ldM, data_M, M);
alu #(N) a(A, M, add_sub, Z);
dff qms1(clk, clrff, enf, q0, Qm1);
counter #(N) c(clk, ldC, dec, counter);

endmodule
