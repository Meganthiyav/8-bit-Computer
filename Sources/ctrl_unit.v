`timescale 1ns / 1ps

module control_unit(

    input clk,
    input rst,

    input [3:0] opcode,

    input z_flag,
    input c_flag,

    output reg pc_inc,
    output reg pc_load,

    output reg mar_load,

    output reg ir_load,

    output reg cpu_re,
    output reg cpu_we,

    output reg a_load,
    output reg b_load,

    output reg out_load,

    output reg flag_load,

    output reg [2:0] alu_sel,

    output reg [2:0] bus_sel,

    output reg halted
);

localparam T0 = 3'd0;
localparam T1 = 3'd1;
localparam T2 = 3'd2;
localparam T3 = 3'd3;
localparam T4 = 3'd4;

reg [2:0] state;

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= T0;
    else if(!halted)
    begin
        if(state == T4)
            state <= T0;
        else
            state <= state + 1'b1;
    end
end

always @(*)
begin

    pc_inc    = 0;
    pc_load   = 0;

    mar_load  = 0;

    ir_load   = 0;

    cpu_re    = 0;
    cpu_we    = 0;

    a_load    = 0;
    b_load    = 0;

    out_load  = 0;

    flag_load = 0;

    alu_sel   = 3'b000;

    bus_sel   = 3'b000;

    halted    = 0;

    case(state)

    //------------------------------------------------
    // T0 : PC -> MAR
    //------------------------------------------------

    T0:
    begin
        bus_sel  = 3'b000;
        mar_load = 1;
    end

    //------------------------------------------------
    // T1 : RAM -> IR , PC++
    //------------------------------------------------

    T1:
    begin
        cpu_re  = 1;
        ir_load = 1;
        pc_inc  = 1;
    end

    //------------------------------------------------
    // T2 : DECODE
    //------------------------------------------------

    T2:
    begin

        case(opcode)

        4'b0000, // LDA
        4'b0001, // ADD
        4'b0010, // SUB
        4'b0011: // STA
        begin
            bus_sel  = 3'b010;
            mar_load = 1;
        end

        4'b0100: // LDI
        begin
            bus_sel = 3'b010;
            a_load  = 1;
        end

        4'b0101: // JMP
        begin
            pc_load = 1;
        end

        4'b0110: // JC
        begin
            if(c_flag)
                pc_load = 1;
        end

        4'b0111: // JZ
        begin
            if(z_flag)
                pc_load = 1;
        end

        4'b1110: // OUT
        begin
            out_load = 1;
        end

        4'b1111: // HLT
        begin
            halted = 1;
        end

        endcase

    end

    //------------------------------------------------
    // T3
    //------------------------------------------------

    T3:
    begin

        case(opcode)

        //--------------------
        // LDA
        //--------------------

        4'b0000:
        begin
            cpu_re = 1;
            a_load = 1;
        end

        //--------------------
        // ADD
        //--------------------

        4'b0001:
        begin
            cpu_re = 1;
            b_load = 1;
        end

        //--------------------
        // SUB
        //--------------------

        4'b0010:
        begin
            cpu_re = 1;
            b_load = 1;
        end

        //--------------------
        // STA
        //--------------------

        4'b0011:
        begin
            cpu_we = 1;
        end

        endcase

    end

    //------------------------------------------------
    // T4 : ALU
    //------------------------------------------------

    T4:
    begin

        case(opcode)

        //--------------------
        // ADD
        //--------------------

        4'b0001:
        begin
            alu_sel   = 3'b000;
            bus_sel   = 3'b101;
            a_load    = 1;
            flag_load = 1;
        end

        //--------------------
        // SUB
        //--------------------

        4'b0010:
        begin
            alu_sel   = 3'b001;
            bus_sel   = 3'b101;
            a_load    = 1;
            flag_load = 1;
        end

        endcase

    end

    endcase

end

endmodule
