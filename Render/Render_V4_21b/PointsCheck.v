`timescale 1ns / 1ps
module PointsCheck(
    CLK, rst,
    h_cnt_Q, v_cnt_Q,
    vtx1_X, vtx1_Y,
    vtx2_X, vtx2_Y,
    vtx3_X, vtx3_Y,
    vtx4_X, vtx4_Y,
    onP1, onP2, onP3, onP4
    );
    /////////////////////////////////////////////////IO setup
    input CLK, rst;
    input signed [20:0] h_cnt_Q, v_cnt_Q;
    //vtx=vertex(頂點)
    input signed[20:0]
        vtx1_X, vtx1_Y,
        vtx2_X, vtx2_Y,
        vtx3_X, vtx3_Y,
        vtx4_X, vtx4_Y;
    output reg onP1, onP2, onP3, onP4;
    /////////////////////////////////////////////////IO setup end
    //null
    //null
    /////////////////////////////////////////////////points check
    always@(posedge CLK or posedge rst)begin
        if(rst)begin
            onP1 <= 1'b0;
            onP2 <= 1'b0;
            onP3 <= 1'b0;
            onP4 <= 1'b0;
        end else begin
            //P1
            if(h_cnt_Q[20:10] == vtx1_X[20:10])begin
                if(v_cnt_Q[20:10] == vtx1_Y[20:10])begin
                    onP1 <= 1'b1;
                end else begin
                    onP1 <= 1'b0;
                end
            end else begin
                onP1 <= 1'b0;
            end
            //P2
            if(h_cnt_Q[20:10] == vtx2_X[20:10])begin
                if(v_cnt_Q[20:10] == vtx2_Y[20:10])begin
                    onP2 <= 1'b1;
                end else begin
                    onP2 <= 1'b0;
                end
            end else begin
                onP2 <= 1'b0;
            end
            //P3
            if(h_cnt_Q[20:10] == vtx3_X[20:10])begin
                if(v_cnt_Q[20:10] == vtx3_Y[20:10])begin
                    onP3 <= 1'b1;
                end else begin
                    onP3 <= 1'b0;
                end
            end else begin
                onP3 <= 1'b0;
            end
            //P4
            if(h_cnt_Q[20:10] == vtx4_X[20:10])begin
                if(v_cnt_Q[20:10] == vtx4_Y[20:10])begin
                    onP4 <= 1'b1;
                end else begin
                    onP4 <= 1'b0;
                end
            end else begin
                onP4 <= 1'b0;
            end
        end
    end
    /////////////////////////////////////////////////points check end
endmodule
