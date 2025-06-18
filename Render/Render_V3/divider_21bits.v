`timescale 1ns / 1ps

module divider_21bits(clk, open, dividend, divisor, finish, quotient);
    input clk, open;
    input [20:0] dividend, divisor;
    output finish;
    output [20:0] quotient;
    wire [20:0] remainder;

    ip_divider_21bits core(
        .aclk(clk),
        .s_axis_dividend_tvalid(open),
        .s_axis_dividend_tdata(dividend),
        .s_axis_divisor_tvalid(open),
        .s_axis_divisor_tdata(divisor),
        .m_axis_dout_tvalid(finish),
        .m_axis_dout_tdata({quotient, remainder})
    );

endmodule
