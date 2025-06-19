`timescale 1ns / 1ps

module divider_21bits(clk, open, dividend, divisor_input, finish, quotient_output);
    input clk, open;
    input [20:0] dividend, divisor_input;
    output finish;
    output reg [20:0] quotient_output;
    wire [18:0] quotient_useless;
    wire [20:0] quotient;
    reg [20:0] divisor;
    
    always @(*) begin
        if(divisor_input == 21'b0) begin
            divisor = 21'b1;
            quotient_output = 21'b0;
        end else begin
            divisor = divisor_input;
            quotient_output = quotient;
        end
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
