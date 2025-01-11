module counter (
    input clk,ld,dec,
    output reg [2:0] data_out
);
    always @(posedge clk) begin
        if(ld) data_out <= 3'b100;
        else if(dec) data_out <= data_out - 1;
    end
endmodule