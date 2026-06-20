`timescale 1ns / 1ps

module ir(
    input clk,
    input rst,

    input ir_load,

    input [7:0] data_in,

    output [7:0] ir_out,

    output [3:0] opcode,
    output [3:0] operand
);

reg [7:0] ir_reg;

always @(posedge clk or posedge rst)
begin
    if(rst)
        ir_reg <= 8'b00000000;

    else if(ir_load)
        ir_reg <= data_in;
end

assign ir_out  = ir_reg;
assign opcode  = ir_reg[7:4];
assign operand = ir_reg[3:0];

endmodule
