`timescale 1ns / 1ps

module sim_divider_16bits();
    reg clk, open;
    reg signed [20:0] dividend, divisor;
    wire finish;
    wire [20:0] quotient;

    divider_21bits test(clk, open, dividend, divisor, finish, quotient);
    
    always begin
        #1 clk = ~clk;
    end
    
    initial begin
        clk = 1'b0;
        dividend = 21'b0;
        divisor = 21'b0;
        open = 1'b0;
        #10
            dividend = 21'h1;
            divisor = -21'h1;
        #50 
            open = 1'b1;
        #50
            open = 1'b0;
        #100
            $finish;
    end
    
endmodule
