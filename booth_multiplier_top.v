module top (
    input clk,start,
    input [3:0] data_M,data_Q,
    output  [7:0] data_out,
    output done
);

wire ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,add_sub,ldC,dec,q0,qm1,eqz,enf;

datapath dp(clk,ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,add_sub,ldC,dec,enf,q0,qm1,eqz,data_M,data_Q,data_out);
controller c(clk,ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,add_sub,ldC,dec,enf,q0,qm1,eqz,start,done);
    
    
endmodule
