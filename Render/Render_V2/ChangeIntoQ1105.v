`timescale 1ns / 1ps
module ChangeIntoQ11010(
    h_cnt, v_cnt,
    h_cnt_Q, v_cnt_Q
    );
    input [9:0] h_cnt, v_cnt;
    output signed[20:0] h_cnt_Q, v_cnt_Q;
    
    assign
        h_cnt_Q = {1'b0, h_cnt, 10'b0},
        v_cnt_Q = {1'b0, v_cnt, 10'b0};
endmodule
