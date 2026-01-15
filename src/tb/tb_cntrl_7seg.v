`timescale 1ns/1ps

module tb_cntrl_7seg;

    reg clk = 0;
    reg rst = 1;
    reg [3:0] din0 = 4'h1;
    reg [3:0] din1 = 4'h2;

    wire [3:0] AN;
    wire [7:0] SEG;

    cntrl_7seg dut (
        .clk(clk),
        .rst(rst),
        .din0(din0),
        .din1(din1),
        .AN(AN),
        .SEG(SEG)
    );

    always #31.25 clk = ~clk; // ~16 MHz

    initial begin
        #200 rst = 0;
        #500000 $stop;
    end

endmodule
