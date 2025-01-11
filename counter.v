module counter #(parameter N = 4) (
    input clk, ld, dec,
    output reg [N-1:0] data_out
);
    always @(posedge clk) begin
        if(ld) data_out <= {N{1'b0}} + 1;
        else if(dec) data_out <= data_out - 1;
    end
endmodule