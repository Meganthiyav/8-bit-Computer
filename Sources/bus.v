`timescale 1ns / 1ps

module bus_mux(
    input [3:0] pc_out,

    input [7:0] ram_out,
    input [7:0] ir_out,

    input [7:0] a_out,
    input [7:0] b_out,

    input [7:0] alu_out,
    input [7:0] out_reg,

    input [2:0] bus_sel,

    output reg [7:0] bus_out
);

always @(*)
begin

    case(bus_sel)

        3'b000:
            bus_out = {4'b0000, pc_out};

        3'b001:
            bus_out = ram_out;

        3'b010:
            bus_out = ir_out;

        3'b011:
            bus_out = a_out;

        3'b100:
            bus_out = b_out;

        3'b101:
            bus_out = alu_out;

        3'b110:
            bus_out = out_reg;

        default:
            bus_out = 8'b00000000;

    endcase

end

endmodule
