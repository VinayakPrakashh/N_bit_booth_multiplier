module alu #(parameter N = 4) (
    input [N-1:0] a, b,
    input sel,
    output reg [N-1:0] y
);
    always @(*) begin
        if(sel) begin
            y = a - b;
        end
        else begin
            y = a + b;
        end
    end
endmodule