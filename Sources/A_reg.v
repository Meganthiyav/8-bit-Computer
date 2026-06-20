`timescale 1ns / 1ps

module a_register(
    input clk,
    input rst,

    input a_load,

    input [7:0] data_in,

    output [7:0] a_out
);

reg [7:0] a_reg;

always @(posedge clk or posedge rst)
begin
    if(rst)
        a_reg <= 8'd0;

    else if(a_load)
        a_reg <= data_in;
end

assign a_out = a_reg;

endmodule
