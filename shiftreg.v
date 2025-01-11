module shiftreg (
    input clk,sft,clr,ld,s_in,
    input [3:0] data_in,
    output reg [3:0] data_out
);

always @(posedge clk) begin
    if(clr) begin
        data_out <= 4'b0000;
    end
    else if(ld) begin
        data_out <= data_in;
    end
    else if(sft) begin
        data_out <= {s_in,data_out[3:1]};
end
end
    
endmodule