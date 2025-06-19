`timescale 1ns / 1ps

module divider_21bits(clk, open, dividend_input, divisor_input, finish, quotient_output);
    input clk, open;
    input [20:0] dividend_input, divisor_input;
    output finish;
    output reg [20:0] quotient_output;
    wire [18:0] quotient_useless;
    wire [20:0] quotient;
    reg signed [20:0] dividend, divisor;
    
    always @(*) begin
        if(dividend_input < 21'b0)
            dividend = -dividend_input;
        else
            dividend = dividend_input;
        if(divisor_input == 21'b0) begin
            divisor = 21'b1;
        end else if(divisor_input < 21'b0)
            divisor = -divisor_input;
        else
            divisor = divisor_input;
        if(divisor_input == 21'b0)
            quotient_output = 21'b0;
        else if(dividend_input < 21'b0 ^ divisor_input < 21'b0)
            quotient_output = -quotient;
        else
            quotient_output = quotient;
    end

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
