`timescale 1ns / 1ps
module rotateY_matrix(
    CLK, rst, valid, angle,
    rotYMtrx
    );
    //////////////////////////////////////////////IO setup
    input CLK, rst, valid;
    //Q1.2.13
    //angle in radian
    input signed [15:0] angle;
    output [255:0] rotYMtrx;
    //////////////////////////////////////////////IO setup end
    //null
    //null
    //////////////////////////////////////////////wire connection
    //Q1.1.14 -> Q1.10.5
    wire signed [15:0]
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44;
        
    wire valid_out;
    wire signed [15:0] sin_out, cos_out;
    wire signed [15:0] neg_sin_out;
    assign neg_sin_out = -sin_out;
    
    assign
        do11 = cos_out >>> 9,//cos in Q1.10.5
        do12 = 16'h0000,
        do13 = sin_out >>> 9,//sin in Q1.10.5
        do14 = 16'h0000,
        
        do21 = 16'h0000,
        do22 = 16'h0020,
        do23 = 16'h0000,
        do24 = 16'h0000,
        
        do31 = neg_sin_out >>> 9,//-sin in Q1.10.5
        do32 = 16'h0000,
        do33 = cos_out >>> 9,///////cos in Q1.10.5
        do34 = 16'h0000,

        do41 = 16'h0000,
        do42 = 16'h0000,
        do43 = 16'h0000,
        do44 = 16'h0020;
        
     assign rotYMtrx = {
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44
        };
    //////////////////////////////////////////////wire connection end
    //null
    //null
    //////////////////////////////////////////////cordic ip
    cordic_sin_cos ucordic_angleY(
    .aclk(CLK),
    .s_axis_phase_tvalid(valid),
    .s_axis_phase_tdata(angle),
    .m_axis_dout_tvalid(valid_out),
    .m_axis_dout_tdata({sin_out, cos_out})
    );
    //////////////////////////////////////////////cordic ip end
endmodule
