`timescale 1ns / 1ps
module Scaling(
    vtx1_X_raw, vtx1_Y_raw, vtx1_Z_raw,
    vtx2_X_raw, vtx2_Y_raw, vtx2_Z_raw,
    vtx3_X_raw, vtx3_Y_raw, vtx3_Z_raw,
    vtx4_X_raw, vtx4_Y_raw, vtx4_Z_raw,
    
    vtx1_X_scaled, vtx1_Y_scaled, vtx1_Z_scaled,
    vtx2_X_scaled, vtx2_Y_scaled, vtx2_Z_scaled,
    vtx3_X_scaled, vtx3_Y_scaled, vtx3_Z_scaled,
    vtx4_X_scaled, vtx4_Y_scaled, vtx4_Z_scaled
    );
    ///////////////////////////////////////////////////IO setup
    //vtx=vertex(頂點)
    input signed[20:0]
        vtx1_X_raw, vtx1_Y_raw, vtx1_Z_raw,
        vtx2_X_raw, vtx2_Y_raw, vtx2_Z_raw,
        vtx3_X_raw, vtx3_Y_raw, vtx3_Z_raw,
        vtx4_X_raw, vtx4_Y_raw, vtx4_Z_raw;
    
    output signed[20:0]
        vtx1_X_scaled, vtx1_Y_scaled, vtx1_Z_scaled,
        vtx2_X_scaled, vtx2_Y_scaled, vtx2_Z_scaled,
        vtx3_X_scaled, vtx3_Y_scaled, vtx3_Z_scaled,
        vtx4_X_scaled, vtx4_Y_scaled, vtx4_Z_scaled;
    ///////////////////////////////////////////////////IO setup end
    //null
    //null
    ///////////////////////////////////////////////////scaling
    wire signed[41:0]
        vtx1_X_raw_buffer, vtx1_Y_raw_buffer,
        vtx2_X_raw_buffer, vtx2_Y_raw_buffer,
        vtx3_X_raw_buffer, vtx3_Y_raw_buffer,
        vtx4_X_raw_buffer, vtx4_Y_raw_buffer;
    
    assign
        vtx1_X_raw_buffer = 21'h50000 * vtx1_X_raw,
        vtx1_Y_raw_buffer = 21'h3c000 * vtx1_Y_raw,
        
        vtx2_X_raw_buffer = 21'h50000 * vtx2_X_raw,
        vtx2_Y_raw_buffer = 21'h3c000 * vtx2_Y_raw,
        
        vtx3_X_raw_buffer = 21'h50000 * vtx3_X_raw,
        vtx3_Y_raw_buffer = 21'h3c000 * vtx3_Y_raw,
        
        vtx4_X_raw_buffer = 21'h50000 * vtx4_X_raw,
        vtx4_Y_raw_buffer = 21'h3c000 * vtx4_Y_raw;

    assign
        vtx1_X_scaled = vtx1_X_raw_buffer >>> 18,
        vtx1_Y_scaled = vtx1_Y_raw_buffer >>> 18,
        vtx1_Z_scaled = vtx1_Z_raw,

        vtx2_X_scaled = vtx2_X_raw_buffer >>> 18,
        vtx2_Y_scaled = vtx2_Y_raw_buffer >>> 18,
        vtx2_Z_scaled = vtx2_Z_raw,

        vtx3_X_scaled = vtx3_X_raw_buffer >>> 18,
        vtx3_Y_scaled = vtx3_Y_raw_buffer >>> 18,
        vtx3_Z_scaled = vtx3_Z_raw,

        vtx4_X_scaled = vtx4_X_raw_buffer >>> 18,
        vtx4_Y_scaled = vtx4_Y_raw_buffer >>> 18,
        vtx4_Z_scaled = vtx4_Z_raw;
    /*
    assign
        vtx1_X_scaled = 16'd320*vtx1_X_raw,
        vtx1_Y_scaled = 16'd240*vtx1_Y_raw,
        vtx1_Z_scaled = vtx1_Z_raw,
        
        vtx2_X_scaled = 16'd320*vtx2_X_raw,
        vtx2_Y_scaled = 16'd240*vtx2_Y_raw,
        vtx2_Z_scaled = vtx2_Z_raw,
        
        vtx3_X_scaled = 16'd320*vtx3_X_raw,
        vtx3_Y_scaled = 16'd240*vtx3_Y_raw,
        vtx3_Z_scaled = vtx3_Z_raw,
        
        vtx4_X_scaled = 16'd320*vtx4_X_raw,
        vtx4_Y_scaled = 16'd240*vtx4_Y_raw,
        vtx4_Z_scaled = vtx4_Z_raw;
    */
    ///////////////////////////////////////////////////scaling end
endmodule
