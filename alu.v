module alu (
    input [3:0] a,b,
    input sel,
    output reg [3:0] y
);
    always @(*) begin
        if(sel) begin
            y <= a - b;
        end
        else begin
            y <= a + b;
        end
    end
endmodule