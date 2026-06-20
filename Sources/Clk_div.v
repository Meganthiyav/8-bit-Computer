
`timescale 1ns / 1ps

module clock_divider(
    input  clk,
    input  rst,
    output reg slow_clk
);

    // 100 MHz -> 6 Hz
    // Toggle every 8,333,333 cycles

    localparam DIVISOR = 8333333;

    reg [23:0] count;

    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            count    <= 24'd0;
            slow_clk <= 1'b0;
        end
        else
        begin
            if(count == DIVISOR-1)
            begin
                count    <= 24'd0;
                slow_clk <= ~slow_clk;
            end
            else
            begin
                count <= count + 1'b1;
            end
        end
    end

endmodule
