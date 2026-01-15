module cntrl_7seg (
    input        clk,
    input        rst,
    input  [3:0] din0,
    input  [3:0] din1,
    output [3:0] AN,
    output [7:0] SEG
);

    // Clock divider (16 MHz -> ~2 kHz enable)
    reg [12:0] q;
    always @(posedge clk) begin
        if (rst)
            q <= 13'd0;
        else
            q <= q + 1'b1;
    end

    wire en = (q == 13'd7999);

    // Digit select shift register (active-low)
    reg [3:0] shr;
    always @(posedge clk) begin
        if (rst)
            shr <= 4'b1110;
        else if (en)
            shr <= {shr[2:0], shr[3]};
    end
    assign AN = shr;

    // Digit counter
    reg [1:0] cntr;
    always @(posedge clk) begin
        if (rst)
            cntr <= 2'd0;
        else if (en)
            cntr <= cntr + 1'b1;
    end

    // Digit multiplexer
    reg [3:0] dmux;
    always @(*) begin
        case (cntr)
            2'b00: dmux = din0;
            2'b01: dmux = din1;
            default: dmux = 4'd0;
        endcase
    end

    // Simple hex to 7-seg decoder (active-low)
    reg [7:0] seg_r;
    always @(*) begin
        case (dmux)
            4'h0: seg_r = 8'b11000000;
            4'h1: seg_r = 8'b11111001;
            4'h2: seg_r = 8'b10100100;
            4'h3: seg_r = 8'b10110000;
            default: seg_r = 8'b11111111;
        endcase
    end

    assign SEG = seg_r;

endmodule
