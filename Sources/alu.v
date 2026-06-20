`timescale 1ns / 1ps

module alu(
    input  [7:0] a_in,
    input  [7:0] b_in,

    input  [2:0] alu_sel,

    output reg [7:0] result,
    output reg carry_out,
    output wire zero
);

reg [8:0] temp;

always @(*)
begin

    result    = 8'd0;
    carry_out = 1'b0;
    temp      = 9'd0;

    case(alu_sel)

        3'b000:
        begin
            temp      = a_in + b_in;
            result    = temp[7:0];
            carry_out = temp[8];
        end

        3'b001:
        begin
            temp      = a_in - b_in;
            result    = temp[7:0];
            carry_out = temp[8];
        end

        3'b010:
        begin
            temp      = a_in + 1'b1;
            result    = temp[7:0];
            carry_out = temp[8];
        end

        3'b011:
        begin
            temp      = a_in - 1'b1;
            result    = temp[7:0];
            carry_out = temp[8];
        end

        3'b100:
        begin
            result = a_in & b_in;
        end

        3'b101:
        begin
            result = a_in | b_in;
        end

        3'b110:
        begin
            result = a_in ^ b_in;
        end

        3'b111:
        begin
            result = ~a_in;
        end

        default:
        begin
            result    = 8'd0;
            carry_out = 1'b0;
        end

    endcase

end

assign zero = (result == 8'd0);

endmodule
