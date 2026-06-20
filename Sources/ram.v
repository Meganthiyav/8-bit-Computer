`timescale 1ns / 1ps

module ram(
    input clk,
    input rst,

    // CPU PORT
    input cpu_we,
    input cpu_re,
    input [3:0] cpu_addr,
    input [7:0] cpu_din,
    output reg [7:0] cpu_dout,

    // FPGA LOADER PORT
    input ram_load,
    input [3:0] ram_addr,
    input [7:0] ram_data
);

reg [7:0] mem [0:15];

integer i;

always @(posedge clk)
begin

    if(rst)
    begin
        cpu_dout <= 8'd0;

        for(i=0;i<16;i=i+1)
            mem[i] <= 8'd0;
    end

    else
    begin

        // FPGA RAM PROGRAMMING

        if(ram_load)
            mem[ram_addr] <= ram_data;

        // CPU WRITE

        if(cpu_we)
            mem[cpu_addr] <= cpu_din;

        // CPU READ

        if(cpu_re)
            cpu_dout <= mem[cpu_addr];

    end

end

endmodule
