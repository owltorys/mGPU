`timescale 1ns / 1ps
module projection_matrix(
    projMtrx
    );
    //////////////////////////////////////////////IO setup
    output [255:0] projMtrx;
    //////////////////////////////////////////////IO setup
    //null
    //null
    //////////////////////////////////////////////wire connection
    wire signed [15:0]
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44;
    
    //w = 640, h = 480, tan/(0.5theta) = 0.5, f = 1000, n = 40
    //do11 = 16'h0030,//(W/h)*(tan/(0.5theta)) = 2/3 => 3/2 = 1.5
    //do22 = 16'h0040,//tan/(0.5theta)=0.5 => 1/0.5 = 2
    //do33 = 16'h0021,// 25/24
    //do34 = 16'hfabc,// -125/3
    assign
        do11 = 16'h0030, do12 = 16'h0000, do13 = 16'h0000, do14 = 16'h0000,
        do21 = 16'h0000, do22 = 16'h0040, do23 = 16'h0000, do24 = 16'h0000,
        do31 = 16'h0000, do32 = 16'h0000, do33 = 16'h0021, do34 = 16'hfabc,
        do41 = 16'h0000, do42 = 16'h0000, do43 = 16'h0020, do44 = 16'h0000;
    
    assign projMtrx = {
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44
        };
    //////////////////////////////////////////////wire connection end
endmodule