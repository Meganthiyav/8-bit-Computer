`timescale 1ns / 1ps

module flag_register(
    input clk,
    input rst,

    input flag_load,

    input zero_in,
    input carry_in,

    output reg z_flag,
    output reg c_flag
);

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        z_flag <= 1'b0;
        c_flag <= 1'b0;
    end

    else if(flag_load)
    begin
        z_flag <= zero_in;
        c_flag <= carry_in;
    end
end

endmodule
