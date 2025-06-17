`timescale 1ns / 1ps
module Normalization(
    CLK, rst,
    d11, d12, d13, d14,
    d21, d22, d23, d24,
    d31, d32, d33, d34,
    d41, d42, d43, d44,
    vtx1_X, vtx1_Y, vtx1_Z,
    vtx2_X, vtx2_Y, vtx2_Z,
    vtx3_X, vtx3_Y, vtx3_Z,
    vtx4_X, vtx4_Y, vtx4_Z
    );
    input CLK, rst;
    /////////////////////////input data setup
    input signed [15:0]
        d11, d12, d13, d14,
        d21, d22, d23, d24,
        d31, d32, d33, d34,
        d41, d42, d43, d44;
    /////////////////////////input data setup end
    //null
    //null
    /////////////////////////output data setup
    //vtx=vertex(頂點)
    output reg signed[15:0]
        vtx1_X, vtx1_Y, vtx1_Z,
        vtx2_X, vtx2_Y, vtx2_Z,
        vtx3_X, vtx3_Y, vtx3_Z,
        vtx4_X, vtx4_Y, vtx4_Z;
    /////////////////////////output data setup end
    //null
    //null
    //////////////////////////////////////////////////////////////normalization
    
    //////////////////////////////////////////////////////////////normalization end
endmodule
