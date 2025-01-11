module datapath (
    input clk,ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,add_sub,ldC,dec,enf,
    output reg q0,qm1,
    output eqz,
    input [3:0] data_M,data_Q,
    output  [7:0] data_out
);

wire [3:0] M,Q,A,Z;
wire [2:0] counter;

//combinational 
assign eqz = (counter ==0)?1:0;
assign data_out = {A,Q};

//sequencial 
always @(posedge clk) begin
    q0 <= Q[0];
    qm1 <= Qm1;
end

shiftreg sA(clk,sftA,clrA,ldA,A[3],Z,A);
shiftreg sQ(clk,sftQ,clrQ,ldQ,A[0],data_Q,Q);
pipo m(clk,ldM,data_M,M);
alu a(A,M,add_sub,Z);
dff qms1(clk,clrff,enf,q0,Qm1);
counter c(clk,ldC,dec,counter);

endmodule
