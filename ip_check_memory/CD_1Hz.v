`timescale 1ns / 1ps
module CD_1Hz(CLK, rst, clk);
    input CLK;
    input rst;
    output reg clk;
    
    reg [26:0] count;
    initial begin
        clk = 1'b1;
        count = 27'd0;
    end
        
    always @(posedge CLK or posedge rst)begin
        if(rst)begin
            clk <= 1'b1;
            count <= 27'd0;
        end else begin
            if(count >= 27'b0111111111_1111111111_1111111)begin
                clk <= ~clk;
                count <= 27'd0;
            end else begin
                clk <= clk;
                count <= count + 27'd1;
            end
        end
    end
    ////////////////////////////////////
endmodule
