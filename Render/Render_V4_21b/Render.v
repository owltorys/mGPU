`timescale 1ns / 1ps
module Render(
    CLK, pclk, fclk, rst,
    h_cnt, v_cnt,
    VGAvalid,
    vga_data,
    matrixState,
    mtrxIn
    );
    /////////////////////////////VGA IO setup
    input CLK, pclk, fclk, rst;
    input [9:0] h_cnt, v_cnt;
    input VGAvalid;
    output reg [11:0] vga_data;
    /////////////////////////////VGA IO setup end
    //null
    //null
    /////////////////////////////Render IO setup
    input [3:0] matrixState;
    input [335:0] mtrxIn;
    wire signed [20:0]
        d11, d12, d13, d14,
        d21, d22, d23, d24,
        d31, d32, d33, d34,
        d41, d42, d43, d44;
    assign {
        d11, d21, d31, d41,
        d12, d22, d32, d42,
        d13, d23, d33, d43,
        d14, d24, d34, d44
    } = mtrxIn;
    /////////////////////////////Render IO setup end
    //null
    //null
    /////////////////////////////ChangeIntoQ1.10.5
    wire signed [20:0] h_cnt_Q, v_cnt_Q;
    ChangeIntoQ11010 uChangeQ(
        .h_cnt(h_cnt), .v_cnt(v_cnt),
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q)
    );
    /////////////////////////////ChangeIntoQ1105 end
    //null
    //null
    /////////////////////////////Normalization
    //vtx=vertex(頂點)
    wire signed[20:0]
        vtx1_X_raw, vtx1_Y_raw, vtx1_Z_raw,
        vtx2_X_raw, vtx2_Y_raw, vtx2_Z_raw,
        vtx3_X_raw, vtx3_Y_raw, vtx3_Z_raw,
        vtx4_X_raw, vtx4_Y_raw, vtx4_Z_raw;
    Normalization uNorm(
        .CLK(CLK), .rst(rts),
        .d11(d11), .d12(d12), .d13(d13), .d14(d14),
        .d21(d21), .d22(d22), .d23(d23), .d24(d24),
        .d31(d31), .d32(d32), .d33(d33), .d34(d34),
        .d41(d41), .d42(d42), .d43(d43), .d44(d44),
        .vtx1_X(vtx1_X_raw), .vtx1_Y(vtx1_Y_raw), .vtx1_Z(vtx1_Z_raw),
        .vtx2_X(vtx2_X_raw), .vtx2_Y(vtx2_Y_raw), .vtx2_Z(vtx2_Z_raw),
        .vtx3_X(vtx3_X_raw), .vtx3_Y(vtx3_Y_raw), .vtx3_Z(vtx3_Z_raw),
        .vtx4_X(vtx4_X_raw), .vtx4_Y(vtx4_Y_raw), .vtx4_Z(vtx4_Z_raw),
        .matrix_state(matrixState)
    );
    /////////////////////////////Normalization end
    //null
    //null
    /////////////////////////////Scaling
    wire signed[20:0]
        vtx1_X_scaled, vtx1_Y_scaled, vtx1_Z_scaled,
        vtx2_X_scaled, vtx2_Y_scaled, vtx2_Z_scaled,
        vtx3_X_scaled, vtx3_Y_scaled, vtx3_Z_scaled,
        vtx4_X_scaled, vtx4_Y_scaled, vtx4_Z_scaled;
    Scaling uScal(
        .vtx1_X_raw(vtx1_X_raw), .vtx1_Y_raw(vtx1_Y_raw), .vtx1_Z_raw(vtx1_Z_raw),
        .vtx2_X_raw(vtx2_X_raw), .vtx2_Y_raw(vtx2_Y_raw), .vtx2_Z_raw(vtx2_Z_raw),
        .vtx3_X_raw(vtx3_X_raw), .vtx3_Y_raw(vtx3_Y_raw), .vtx3_Z_raw(vtx3_Z_raw),
        .vtx4_X_raw(vtx4_X_raw), .vtx4_Y_raw(vtx4_Y_raw), .vtx4_Z_raw(vtx4_Z_raw),
        .vtx1_X_scaled(vtx1_X_scaled), .vtx1_Y_scaled(vtx1_Y_scaled), .vtx1_Z_scaled(vtx1_Z_scaled),
        .vtx2_X_scaled(vtx2_X_scaled), .vtx2_Y_scaled(vtx2_Y_scaled), .vtx2_Z_scaled(vtx2_Z_scaled),
        .vtx3_X_scaled(vtx3_X_scaled), .vtx3_Y_scaled(vtx3_Y_scaled), .vtx3_Z_scaled(vtx3_Z_scaled),
        .vtx4_X_scaled(vtx4_X_scaled), .vtx4_Y_scaled(vtx4_Y_scaled), .vtx4_Z_scaled(vtx4_Z_scaled)
    );
    /////////////////////////////Scaling end
    //null
    //null
    /////////////////////////////ShiftingTheOrigin
    //vtx=vertex(頂點)
    wire signed[20:0]
        vtx1_X, vtx1_Y, vtx1_Z,
        vtx2_X, vtx2_Y, vtx2_Z,
        vtx3_X, vtx3_Y, vtx3_Z,
        vtx4_X, vtx4_Y, vtx4_Z;
    ShiftingTheOrigin uShift(
        .vtx1_X_scaled(vtx1_X_scaled), .vtx1_Y_scaled(vtx1_Y_scaled), .vtx1_Z_scaled(vtx1_Z_scaled),
        .vtx2_X_scaled(vtx2_X_scaled), .vtx2_Y_scaled(vtx2_Y_scaled), .vtx2_Z_scaled(vtx2_Z_scaled),
        .vtx3_X_scaled(vtx3_X_scaled), .vtx3_Y_scaled(vtx3_Y_scaled), .vtx3_Z_scaled(vtx3_Z_scaled),
        .vtx4_X_scaled(vtx4_X_scaled), .vtx4_Y_scaled(vtx4_Y_scaled), .vtx4_Z_scaled(vtx4_Z_scaled),
        .vtx1_X(vtx1_X), .vtx1_Y(vtx1_Y), .vtx1_Z(vtx1_Z),
        .vtx2_X(vtx2_X), .vtx2_Y(vtx2_Y), .vtx2_Z(vtx2_Z),
        .vtx3_X(vtx3_X), .vtx3_Y(vtx3_Y), .vtx3_Z(vtx3_Z),
        .vtx4_X(vtx4_X), .vtx4_Y(vtx4_Y), .vtx4_Z(vtx4_Z)
    );
    /////////////////////////////ShiftingTheOrigin end
    //null
    //null
    /////////////////////////////calculate the lines
    wire onLine1, onLine2, onLine3, onLine4, onLine5, onLine6;
    LinesCheck uLines(
      .CLK(CLK), .rst(rst),
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtx1_X(vtx1_X), .vtx1_Y(vtx1_Y), .vtx1_Z(vtx1_Z),
        .vtx2_X(vtx2_X), .vtx2_Y(vtx2_Y), .vtx2_Z(vtx2_Z),
        .vtx3_X(vtx3_X), .vtx3_Y(vtx3_Y), .vtx3_Z(vtx3_Z),
        .vtx4_X(vtx4_X), .vtx4_Y(vtx4_Y), .vtx4_Z(vtx4_Z),
        .onLine1(onLine1), .onLine2(onLine2), .onLine3(onLine3),
        .onLine4(onLine4), .onLine5(onLine5), .onLine6(onLine6)
    );
    /////////////////////////////calculate the lines end
    //null
    //null
    /////////////////////////////calculate the points
    wire onP1, onP2, onP3, onP4;
    PointsCheck uPointsCheck(
        .CLK(CLK), .rst(rst),
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtx1_X(vtx1_X), .vtx1_Y(vtx1_Y),
        .vtx2_X(vtx2_X), .vtx2_Y(vtx2_Y),
        .vtx3_X(vtx3_X), .vtx3_Y(vtx3_Y),
        .vtx4_X(vtx4_X), .vtx4_Y(vtx4_Y),
        .onP1(onP1), .onP2(onP2), .onP3(onP3), .onP4(onP4)
    );
    /////////////////////////////calculate the points end
    //null
    //null
    ////////////////////////////onWhichLineWithPriority
    wire [9:0] onWhichLine, onWhichLineWithPriority;
    assign onWhichLine = {
        onP1, onP2, onP3, onP4,
        onLine1, onLine2, onLine3, onLine4, onLine5, onLine6
    };
    
    MSB_arbiter uarbiter(
        .in(onWhichLine),
        .out(onWhichLineWithPriority)
    );
    ////////////////////////////onWhichLineWithPriority end
    //null
    //null
    /////////////////////////////VGA data output
    always@(posedge pclk or posedge rst) begin
        if(rst) begin
            vga_data<= 12'h000;
        end else begin
            if(VGAvalid) begin // send data
                case(onWhichLineWithPriority)
                    //points
                    10'b1000_0000_00: vga_data<= 12'h000;//blck
                    10'b0100_0000_00: vga_data<= 12'h000;//blck
                    10'b0010_0000_00: vga_data<= 12'h000;//blck
                    10'b0001_0000_00: vga_data<= 12'h000;//blck
                    //lines
                    10'b0000_1000_00: vga_data<= 12'hf00;//red
                    10'b0000_0100_00: vga_data<= 12'h0F0;//green
                    10'b0000_0010_00: vga_data<= 12'h00F;//blue
                    10'b0000_0001_00: vga_data<= 12'hFF0;//yellow
                    10'b0000_0000_10: vga_data<= 12'hF0F;//洋紅
                    10'b0000_0000_01: vga_data<= 12'h0FF;//青色
                    default: vga_data<= 12'h49C;//backround 淺藍
                endcase
            end else  vga_data<= 12'h000;
        end
    end
    /////////////////////////////VGA data output end
endmodule
