`timescale 1ns / 1ps

module computer_top(
    input clk,
    input rst,

    input start,

    input ram_load,
    input [7:0] ram_data,
    input [3:0] ram_addr,

    output [3:0] anodes,
    output [7:0] seg
);

//====================================================
// CLOCK
//====================================================

wire cpu_clk;

clock_divider CLK_DIV(
    .clk(clk),
    .rst(rst),
    .slow_clk(cpu_clk)
);

//====================================================
// PC
//====================================================

wire [3:0] pc_out;

wire pc_inc;
wire pc_load;

wire [3:0] operand;

pc PC(
    .clk(cpu_clk),
    .rst(rst),

    .pc_inc(pc_inc),
    .pc_load(pc_load),

    .data_in(operand),

    .pc_out(pc_out)
);

//====================================================
// MAR
//====================================================

wire [3:0] mar_out;
wire mar_load;

mar MAR(
    .clk(cpu_clk),
    .rst(rst),

    .mar_load(mar_load),

    .data_in(bus_out[3:0]),

    .mar_out(mar_out)
);

//====================================================
// RAM
//====================================================

wire cpu_re;
wire cpu_we;

wire [7:0] ram_out;

ram RAM(
    .clk(cpu_clk),
    .rst(rst),

    .cpu_we(cpu_we),
    .cpu_re(cpu_re),

    .cpu_addr(mar_out),

    .cpu_din(a_out),

    .cpu_dout(ram_out),

    .ram_load(ram_load),
    .ram_addr(ram_addr),
    .ram_data(ram_data)
);

//====================================================
// IR
//====================================================

wire ir_load;

wire [7:0] ir_out;
wire [3:0] opcode;

ir IR(
    .clk(cpu_clk),
    .rst(rst),

    .ir_load(ir_load),

    .data_in(ram_out),

    .ir_out(ir_out),

    .opcode(opcode),
    .operand(operand)
);

//====================================================
// A REGISTER
//====================================================

wire a_load;
wire [7:0] a_out;

a_register A_REG(
    .clk(cpu_clk),
    .rst(rst),

    .a_load(a_load),

    .data_in(bus_out),

    .a_out(a_out)
);

//====================================================
// B REGISTER
//====================================================

wire b_load;
wire [7:0] b_out;

b_register B_REG(
    .clk(cpu_clk),
    .rst(rst),

    .b_load(b_load),

    .data_in(bus_out),

    .b_out(b_out)
);

//====================================================
// ALU
//====================================================

wire [2:0] alu_sel;

wire [7:0] alu_result;
wire carry_out;
wire zero;

alu ALU(
    .a_in(a_out),
    .b_in(b_out),

    .alu_sel(alu_sel),

    .result(alu_result),

    .carry_out(carry_out),

    .zero(zero)
);

//====================================================
// FLAGS
//====================================================

wire flag_load;

wire z_flag;
wire c_flag;

flag_register FLAGS(
    .clk(cpu_clk),
    .rst(rst),

    .flag_load(flag_load),

    .zero_in(zero),
    .carry_in(carry_out),

    .z_flag(z_flag),
    .c_flag(c_flag)
);

//====================================================
// OUTPUT REGISTER
//====================================================

wire out_load;
wire [7:0] out_data;

output_register OUT_REG(
    .clk(cpu_clk),
    .rst(rst),

    .out_load(out_load),

    .data_in(a_out),

    .data_out(out_data)
);

//====================================================
// BUS
//====================================================

wire [2:0] bus_sel;
wire [7:0] bus_out;

bus_mux BUS(
    .pc_out(pc_out),

    .ram_out(ram_out),
    .ir_out(ir_out),

    .a_out(a_out),
    .b_out(b_out),

    .alu_out(alu_result),
    .out_reg(out_data),

    .bus_sel(bus_sel),

    .bus_out(bus_out)
);

//====================================================
// CONTROL UNIT
//====================================================

wire halted;

control_unit CU(
    .clk(cpu_clk),
    .rst(rst),

    .opcode(opcode),

    .z_flag(z_flag),
    .c_flag(c_flag),

    .pc_inc(pc_inc),
    .pc_load(pc_load),

    .mar_load(mar_load),

    .ir_load(ir_load),

    .cpu_re(cpu_re),
    .cpu_we(cpu_we),

    .a_load(a_load),
    .b_load(b_load),

    .out_load(out_load),

    .flag_load(flag_load),

    .alu_sel(alu_sel),

    .bus_sel(bus_sel),

    .halted(halted)
);

//====================================================
// DISPLAY
//====================================================

seven_seg_controller DISPLAY(
    .clk(clk),
    .rst(rst),

    .data_in(out_data),

    .seg(seg),
    .an(anodes)
);

endmodule
