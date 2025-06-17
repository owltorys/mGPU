`timescale 1ns / 1ps
module ShiftingTheOrigin(
    vtx1_X_raw, vtx1_Y_raw, vtx1_Z_raw,
    vtx2_X_raw, vtx2_Y_raw, vtx2_Z_raw,
    vtx3_X_raw, vtx3_Y_raw, vtx3_Z_raw,
    vtx4_X_raw, vtx4_Y_raw, vtx4_Z_raw,
    
    vtx1_X, vtx1_Y, vtx1_Z,
    vtx2_X, vtx2_Y, vtx2_Z,
    vtx3_X, vtx3_Y, vtx3_Z,
    vtx4_X, vtx4_Y, vtx4_Z
    );
    ///////////////////////////////////////////////////IO setup
    //vtx=vertex(頂點)
    input signed[15:0]
        vtx1_X_raw, vtx1_Y_raw, vtx1_Z_raw,
        vtx2_X_raw, vtx2_Y_raw, vtx2_Z_raw,
        vtx3_X_raw, vtx3_Y_raw, vtx3_Z_raw,
        vtx4_X_raw, vtx4_Y_raw, vtx4_Z_raw;
    
    output signed[15:0]
        vtx1_X, vtx1_Y, vtx1_Z,
        vtx2_X, vtx2_Y, vtx2_Z,
        vtx3_X, vtx3_Y, vtx3_Z,
        vtx4_X, vtx4_Y, vtx4_Z;
    ///////////////////////////////////////////////////IO setup end
    //null
    //null
    ///////////////////////////////////////////////////shifting
    assign
        vtx1_X = vtx1_X_raw + 16'h2800,//320
        vtx1_Y = vtx1_Y_raw + 16'h1e00,//240
        vtx1_Z = vtx1_Z_raw,
        
        vtx2_X = vtx2_X_raw + 16'h2800,//320
        vtx2_Y = vtx2_Y_raw + 16'h1e00,//240
        vtx2_Z = vtx2_Z_raw,
        
        vtx3_X = vtx3_X_raw + 16'h2800,//320
        vtx3_Y = vtx3_Y_raw + 16'h1e00,//240
        vtx3_Z = vtx3_Z_raw,
        
        vtx4_X = vtx4_X_raw + 16'h2800,//320
        vtx4_Y = vtx4_Y_raw + 16'h1e00,//240
        vtx4_Z = vtx4_Z_raw;
    ///////////////////////////////////////////////////shifting end
endmodule