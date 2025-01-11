module pipo (
    input clk,ld,
    input [3:0] data_in,
    output reg [3:0] data_out
);
    always @(posedge clk) begin
        if(ld) begin
            data_out <= data_in;
        end
    end
endmodule