`timescale 1ns / 1ps

module pc(
    input clk,
    input rst,

    input pc_inc,          // Increment PC
    input pc_load,         // Load new address (Jump)

    input [3:0] data_in,   // Jump Address

    output reg [3:0] pc_out
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        pc_out <= 4'b0000;

    else if(pc_load)
        pc_out <= data_in;

    else if(pc_inc)
        pc_out <= pc_out + 1'b1;
end

endmodule
