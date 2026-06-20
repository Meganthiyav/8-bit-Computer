`timescale 1ns / 1ps

module computer_top_tb;

reg clk;
reg rst;
reg start;

reg ram_load;
reg [7:0] ram_data;
reg [3:0] ram_addr;

wire [3:0] anodes;
wire [7:0] seg;

computer_top DUT(
    .clk(clk),
    .rst(rst),
    .start(start),

    .ram_load(ram_load),
    .ram_data(ram_data),
    .ram_addr(ram_addr),

    .anodes(anodes),
    .seg(seg)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    start = 0;

    ram_load = 0;
    ram_addr = 0;
    ram_data = 0;

    #50;
    rst = 0;

    //--------------------------------------------------
    // Program Loading
    //--------------------------------------------------
    // Address 0 : LDI 5
    // Address 1 : OUT
    // Address 2 : HLT
    //--------------------------------------------------

    ram_load = 1;

    ram_addr = 4'd0;
    ram_data = 8'h45;
    #10;

    ram_addr = 4'd1;
    ram_data = 8'hE0;
    #10;

    ram_addr = 4'd2;
    ram_data = 8'hF0;
    #10;

    ram_load = 0;

    //--------------------------------------------------
    // Start CPU
    //--------------------------------------------------

    start = 1;

    #5000;

    $finish;

end

endmodule
