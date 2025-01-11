module controller (
    input clk,
    output reg ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,add_sub,ldC,dec,enf,
    input q0,qm1,eqz,start,
    output reg done
);

parameter S0 =3'b000, S1 =3'b001, S2 =3'b010, S3 =3'b011, S4 =3'b100, S5 =3'b101, S6 =3'b110;
reg [2:0] state;

always @(posedge clk) begin
    case (state)
        S0: if(start) state<=S1;
        S1: state<=S2;
        S2:  begin  if({q0,qm1}==2'b01) state<=S3;
            else if({q0,qm1}==2'b10) state<=S4;
            else state<=S5;
        end
        S3: state<=S5;
        S4: state<=S5;
        S5:  begin  if({q0,qm1}==2'b01 && !eqz) state<=S3;
            else if({q0,qm1}==2'b10 && !eqz) state<=S4;
            else if(eqz) state<=S6;
        end
        S6: state<=S6;
        default: state<= S0;
    endcase
end

always @(state) begin
    case (state)
        S0: begin
            ldA=0;clrA=0;sftA=0;ldQ=0;clrQ=0;sftQ=0;ldM=0;clrff=0;add_sub=0;ldC=0;dec=0;done=0;enf=0;
        end 
        S1: begin
            clrA=1;clrff=1;ldC=1;ldM=1;ldQ=1;
        end
        S2: begin
            clrA=0;clrff=0;ldC=0;ldQ=0;ldM=0;
        end
        S3: begin
            ldA=1;ldQ =0;add_sub=0;sftA=0;sftQ=0;dec=0;clrff=0;enf=0;
        end
        S4: begin
            ldA=1;ldQ =0;add_sub=1;sftA=0;sftQ=0;dec=0;clrff=0;enf=0;
        end
        S5: begin
            sftA=1;sftQ=1;ldA=0;ldQ=0;dec=1;clrff=0;enf=1;
        end
        S6: begin
            done=1;ldA=0;clrA=0;sftA=0;ldQ=0;clrQ=0;sftQ=0;ldM=0;clrff=0;add_sub=0;ldC=0;dec=0;enf=0;
        end
        default: begin ldA=0;clrA=0;sftA=0;ldQ=0;clrQ=0;sftQ=0;ldM=0;clrff=0;add_sub=0;ldC=0;dec=0;done=0;enf=0; end
    endcase
end

endmodule
