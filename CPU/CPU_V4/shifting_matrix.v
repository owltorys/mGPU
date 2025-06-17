`timescale 1ns / 1ps
module shifting_matrix(
    Xc, Yc, Zc,
    shiftMtrx
    );
    //////////////////////////////////////////////IO setup
    input signed [15:0] Xc, Yc, Zc;
    output [255:0] shiftMtrx;
    //////////////////////////////////////////////IO setup
    //null
    //null
    //////////////////////////////////////////////wire connection
    wire signed [15:0]
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44;
    
    assign
        do11 = 16'h0020, do12 = 16'h0000, do13 = 16'h0000, do14 = Xc,
        do21 = 16'h0000, do22 = 16'h0020, do23 = 16'h0000, do24 = Yc,
        do31 = 16'h0000, do32 = 16'h0000, do33 = 16'h0020, do34 = Zc,
        do41 = 16'h0000, do42 = 16'h0000, do43 = 16'h0000, do44 = 16'h0020;
    
    assign shiftMtrx = {
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44
        };
    //////////////////////////////////////////////wire connection end
endmodule
