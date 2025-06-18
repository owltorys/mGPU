`timescale 1ns / 1ps
module shifting_matrix(
    Xc, Yc, Zc,
    shiftMtrx
    );
    //////////////////////////////////////////////IO setup
    input signed [20:0] Xc, Yc, Zc;
    output [335:0] shiftMtrx;
    //////////////////////////////////////////////IO setup
    //null
    //null
    //////////////////////////////////////////////wire connection
    wire signed [20:0]
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44;
    
    assign
        do11 = 21'h000400, do12 = 21'h000000, do13 = 21'h000000, do14 = Xc,
        do21 = 21'h000000, do22 = 21'h000400, do23 = 21'h000000, do24 = Yc,
        do31 = 21'h000000, do32 = 21'h000000, do33 = 21'h000400, do34 = Zc,
        do41 = 21'h000000, do42 = 21'h000000, do43 = 21'h000000, do44 = 21'h000400;
    
    assign shiftMtrx = {
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44
        };
    //////////////////////////////////////////////wire connection end
endmodule
