`timescale 1ns / 1ps
module ShiftingTheOrigin(
    vtx1_X_scaled, vtx1_Y_scaled, vtx1_Z_scaled,
    vtx2_X_scaled, vtx2_Y_scaled, vtx2_Z_scaled,
    vtx3_X_scaled, vtx3_Y_scaled, vtx3_Z_scaled,
    vtx4_X_scaled, vtx4_Y_scaled, vtx4_Z_scaled,
    
    vtx1_X, vtx1_Y, vtx1_Z,
    vtx2_X, vtx2_Y, vtx2_Z,
    vtx3_X, vtx3_Y, vtx3_Z,
    vtx4_X, vtx4_Y, vtx4_Z
    );
    ///////////////////////////////////////////////////IO setup
    //vtx=vertex(頂點)
    input signed[20:0]
        vtx1_X_scaled, vtx1_Y_scaled, vtx1_Z_scaled,
        vtx2_X_scaled, vtx2_Y_scaled, vtx2_Z_scaled,
        vtx3_X_scaled, vtx3_Y_scaled, vtx3_Z_scaled,
        vtx4_X_scaled, vtx4_Y_scaled, vtx4_Z_scaled;
    
    output signed[20:0]
        vtx1_X, vtx1_Y, vtx1_Z,
        vtx2_X, vtx2_Y, vtx2_Z,
        vtx3_X, vtx3_Y, vtx3_Z,
        vtx4_X, vtx4_Y, vtx4_Z;
    ///////////////////////////////////////////////////IO setup end
    //null
    //null
    ///////////////////////////////////////////////////shifting
    assign
        vtx1_X = vtx1_X_scaled + 20'h50000,//320
        vtx1_Y = vtx1_Y_scaled + 20'h3c000,//240
        vtx1_Z = vtx1_Z_scaled,
        
        vtx2_X = vtx2_X_scaled + 20'h50000,//320
        vtx2_Y = vtx2_Y_scaled + 20'h3c000,//240
        vtx2_Z = vtx2_Z_scaled,
        
        vtx3_X = vtx3_X_scaled + 20'h50000,//320
        vtx3_Y = vtx3_Y_scaled + 20'h3c000,//240
        vtx3_Z = vtx3_Z_scaled,
        
        vtx4_X = vtx4_X_scaled + 20'h50000,//320
        vtx4_Y = vtx4_Y_scaled + 20'h3c000,//240
        vtx4_Z = vtx4_Z_scaled;
    ///////////////////////////////////////////////////shifting end
endmodule
