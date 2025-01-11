module dff (
    input clk,clr,en,
    input d,
    output reg q
);
    always @(posedge clk) begin
        if(clr) q <= 0;
        else if(en)
            q <= d;
    end
endmodule