`timescale 1ns / 1ps

module divider_21bits(clk, open, dividend, divisor, finish, quotient);
    input clk, open;
    input [20:0] dividend, divisor;
    output finish;
    output [20:0] quotient;
    wire [18:0] quotient_useless;

    ip_divider_21bits core(
        .aclk(clk),
        .s_axis_dividend_tvalid(open),
        .s_axis_dividend_tdata({{3{dividend[20]}}, dividend}),
        .s_axis_divisor_tvalid(open),
        .s_axis_divisor_tdata({{3{divisor[20]}}, divisor}),
        .m_axis_dout_tvalid(finish),
        .m_axis_dout_tdata({quotient_useless[18:1], quotient[20:18], quotient_useless[0], quotient[17:0]})
    );

endmodule
