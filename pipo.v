module pipo #(parameter N = 4) (
    input clk, ld,
    input [N-1:0] data_in,
    output reg [N-1:0] data_out
);
    always @(posedge clk) begin
        if(ld) begin
            data_out <= data_in;
        end
    end
endmodule