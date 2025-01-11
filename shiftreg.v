module shiftreg #(parameter N = 4) (
    input clk, sft, clr, ld, s_in,
    input [N-1:0] data_in,
    output reg [N-1:0] data_out
);

always @(posedge clk) begin
    if(clr) begin
        data_out <= {N{1'b0}};
    end
    else if(ld) begin
        data_out <= data_in;
    end
    else if(sft) begin
        data_out <= {s_in, data_out[N-1:1]};
    end
end

endmodule