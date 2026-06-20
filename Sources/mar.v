`timescale 1ns / 1ps

module mar(
    input clk,
    input rst,

    input mar_load,

    input [3:0] data_in,

    output reg [3:0] mar_out
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        mar_out <= 4'b0000;

    else if(mar_load)
        mar_out <= data_in;
end

endmodule
