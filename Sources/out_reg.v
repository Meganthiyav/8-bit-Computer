`timescale 1ns / 1ps

module output_register(
    input clk,
    input rst,

    input out_load,

    input [7:0] data_in,

    output [7:0] data_out
);

reg [7:0] out_reg;

always @(posedge clk or posedge rst)
begin
    if(rst)
        out_reg <= 8'd0;

    else if(out_load)
        out_reg <= data_in;
end

assign data_out = out_reg;

endmodule
