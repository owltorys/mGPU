`timescale 1ns / 1ps
module rotateX_matrix(
    CLK, rst, valid, angle,
    rotXMtrx
    );
    //////////////////////////////////////////////IO setup
    input CLK, rst, valid;
    //Q1.2.13
    //angle in radian
    input signed [15:0] angle;
    output [335:0] rotXMtrx;
    //////////////////////////////////////////////IO setup end
    //null
    //null
    //////////////////////////////////////////////wire connection
    //Q1.1.14 -> Q1.10.10
    wire signed [20:0]
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44;
    
    wire valid_out;
    wire signed [15:0] sin_out, cos_out;
    wire signed [15:0] neg_sin_out;
    assign neg_sin_out = -sin_out;
    
    assign
        do11 = 21'h000400,//1
        do12 = 21'h000000,
        do13 = 21'h000000,
        do14 = 21'h000000,
        
        do21 = 21'h000000,
        do22 = {{5{cos_out[15]}}, cos_out >>> 4},//////////cos in Q1.10.10
        do23 = {{5{neg_sin_out[15]}}, neg_sin_out >>> 4},//-sin in Q1.10.10
        do24 = 21'h000000,
        
        do31 = 21'h000000,
        do32 = {{5{sin_out[15]}}, sin_out >>> 4},//sin in Q1.10.10
        do33 = {{5{cos_out[15]}}, cos_out >>> 4},//cos in Q1.10.10
        do34 = 21'h000000,
        
        do41 = 21'h000000,
        do42 = 21'h000000,
        do43 = 21'h000000,
        do44 = 21'h000400;//1
        
    assign rotXMtrx = {
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44
        };
    //////////////////////////////////////////////wire connection end
    //null
    //null
    //////////////////////////////////////////////cordic ip
    cordic_sin_cos ucordic_angleX(
    .aclk(CLK),
    .s_axis_phase_tvalid(valid),
    .s_axis_phase_tdata(angle),
    .m_axis_dout_tvalid(valid_out),
    .m_axis_dout_tdata({sin_out, cos_out})
    );
    //////////////////////////////////////////////cordic ip end
endmodule
