`timescale 1ns / 1ps

module seven_seg_controller(
    input clk,
    input rst,

    input [7:0] data_in,

    output reg [7:0] seg,
    output reg [3:0] an
);

reg [16:0] refresh_counter;
reg [1:0] digit_sel;

reg [3:0] digit;

reg [3:0] hundreds;
reg [3:0] tens;
reg [3:0] ones;

integer value;

always @(*)
begin

    value = data_in;

    hundreds = value / 100;
    value    = value % 100;

    tens     = value / 10;
    ones     = value % 10;

end

always @(posedge clk or posedge rst)
begin
    if(rst)
        refresh_counter <= 0;
    else
        refresh_counter <= refresh_counter + 1;
end

always @(posedge refresh_counter[16] or posedge rst)
begin
    if(rst)
        digit_sel <= 0;
    else
        digit_sel <= digit_sel + 1;
end

always @(*)
begin

    case(digit_sel)

    2'b00:
    begin
        an    = 4'b1110;
        digit = ones;
    end

    2'b01:
    begin
        an    = 4'b1101;
        digit = tens;
    end

    2'b10:
    begin
        an    = 4'b1011;
        digit = hundreds;
    end

    2'b11:
    begin
        an    = 4'b0111;
        digit = 4'd0;
    end

    endcase

end

always @(*)
begin

    case(digit)

    4'd0 : seg = 8'b00111111;
    4'd1 : seg = 8'b00000110;
    4'd2 : seg = 8'b01011011;
    4'd3 : seg = 8'b01001111;
    4'd4 : seg = 8'b01100110;
    4'd5 : seg = 8'b01101101;
    4'd6 : seg = 8'b01111101;
    4'd7 : seg = 8'b00000111;
    4'd8 : seg = 8'b01111111;
    4'd9 : seg = 8'b01101111;

    default : seg = 8'b00000000;

    endcase

end

endmodule
