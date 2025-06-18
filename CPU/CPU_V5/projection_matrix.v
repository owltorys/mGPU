`timescale 1ns / 1ps
module projection_matrix(
    projMtrx
    );
    //////////////////////////////////////////////IO setup
    output [335:0] projMtrx;
    //////////////////////////////////////////////IO setup
    //null
    //null
    //////////////////////////////////////////////wire connection
    wire signed [20:0]
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44;
    
    //w = 640, h = 480, tan/(0.5theta) = 0.5, f = 1000, n = 40
    //do11 = 21'h000600,//(W/h)*(tan/(0.5theta)) = 2/3 => 3/2 = 1.5
    //do22 = 21'h000800,//tan/(0.5theta)=0.5 => 1/0.5 = 2
    //do33 = 21'h00042b,// 25/24
    //do34 =-21'h00a6ab,// -125/3
    assign
        do11 = 21'h000600, do12 = 21'h000000, do13 = 21'h000000, do14 = 21'h000000,
        do21 = 21'h000000, do22 = 21'h000800, do23 = 21'h000000, do24 = 21'h000000,
        do31 = 21'h000000, do32 = 21'h000000, do33 = 21'h00042b, do34 =-21'h00a6ab,
        do41 = 21'h000000, do42 = 21'h000000, do43 = 21'h000400, do44 = 21'h000000;
    
    assign projMtrx = {
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44
        };
    //////////////////////////////////////////////wire connection end
endmodule