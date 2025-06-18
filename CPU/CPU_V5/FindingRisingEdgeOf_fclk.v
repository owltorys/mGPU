`timescale 1ns / 1ps
module FindingRisingEdgeOf_fclk(
    CLK, fclk, rst, risingEdge_fclk
    );
    input CLK, fclk, rst;
    output reg risingEdge_fclk;
    
    reg pre_fclk;
    always@(posedge CLK or posedge rst)begin
        if(rst)begin
            pre_fclk <= 1'b0;
            risingEdge_fclk <= 1'b0;
        end else begin
            if(pre_fclk == 1'b0 & fclk == 1'b1)begin
                risingEdge_fclk <= 1'b1;
            end else begin
                risingEdge_fclk <= 1'b0;
            end
            pre_fclk <= fclk;
        end
    end
endmodule
