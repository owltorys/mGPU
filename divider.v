`timescale 1ns / 1ps

module divider(clk, open, dividend, divisor, finish, quotient);
    input clk, open;
    input [15:0] dividend, divisor;
    output finish;
    output [15:0] quotient;
    wire [15:0] remainder;

    divider_1 divider_test (
        .aclk(clk),
        .s_axis_dividend_tvalid(open),
        .s_axis_dividend_tdata(dividend),
        .s_axis_divisor_tvalid(open),
        .s_axis_divisor_tdata(divisor),
        .m_axis_dout_tvalid(finish),
        .m_axis_dout_tdata({quotient, remainder})
    );

endmodule
