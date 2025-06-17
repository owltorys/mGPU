`timescale 1ns / 1ps
module input_matrix(
    pi1X, pi1Y, pi1Z,
    pi2X, pi2Y, pi2Z,
    pi3X, pi3Y, pi3Z,
    pi4X, pi4Y, pi4Z,
    inMtrx
    );
    //////////////////////////////////////////////IO setup
    input signed [15:0]
        pi1X, pi1Y, pi1Z,
        pi2X, pi2Y, pi2Z,
        pi3X, pi3Y, pi3Z,
        pi4X, pi4Y, pi4Z;
    output [255:0] inMtrx;
    //////////////////////////////////////////////IO setup
    //null
    //null
    //////////////////////////////////////////////wire connection
    wire signed[15:0]
        do11, do12, do13, do14,
        do21, do22, do23, do24,
        do31, do32, do33, do34,
        do41, do42, do43, do44;
    assign
        do11 = pi1X,     do12 = pi2X,     do13 = pi3X,     do14 = pi4X,
        do21 = pi1Y,     do22 = pi2Y,     do23 = pi3Y,     do24 = pi4Y,
        do31 = pi1Z,     do32 = pi2Z,     do33 = pi3Z,     do34 = pi4Z,      
        do41 = 16'h0020, do42 = 16'h0020, do43 = 16'h0020, do44 = 16'h0020;
    
    assign inMtrx = {
        do11, do21, do31, do41,
        do12, do22, do32, do42,
        do13, do23, do33, do43,
        do14, do24, do43, do44
        };
    //////////////////////////////////////////////wire connection end
endmodule
