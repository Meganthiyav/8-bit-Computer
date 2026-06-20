`timescale 1ns / 1ps

module b_register(
    input clk,
    input rst,

    input b_load,

    input [7:0] data_in,

    output [7:0] b_out
);

reg [7:0] b_reg;

always @(posedge clk or posedge rst)
begin
    if(rst)
        b_reg <= 8'd0;

    else if(b_load)
        b_reg <= data_in;
end

assign b_out = b_reg;

endmodule
