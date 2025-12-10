module top #(
    parameter N = 4
) (
    input clk, start,
    input [N-1:0] a, b,
    output [2*N-1:0] data_out,
    output done
);



datapath #(N) dp (
    .clk(clk),
    .a(a),
    .b(b),
    .sftA(sftA),
    .clrA(clrA),
    .ldA(ldA),
    .sftQ(sftQ),
    .clrQ(clrQ),
    .ldQ(ldQ),
    .ldM(ldM),
    .clrff(clrff),
    .add_sub(add_sub),
    .ldC(ldC),
    .dec(dec),
    .enf(enf),
    .q0(q0),
    .q1(q1),
    .eqz(eqz),
    .data_out(data_out)
);

controller c (
    .clk(clk),
    .q0(q0),
    .q1(q1),
    .eqz(eqz),
    .start(start),
    .ldA(ldA),
    .clrA(clrA),
    .sftA(sftA),
    .ldQ(ldQ),
    .clrQ(clrQ),
    .sftQ(sftQ),
    .ldM(ldM),
    .clrff(clrff),
    .add_sub(add_sub),
    .ldC(ldC),
    .dec(dec),
    .enf(enf),
    .done(done)
);

endmodule
