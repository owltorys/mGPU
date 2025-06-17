`timescale 1ns / 1ps
module object_info(
    Xc, Yc, Zc,
    vtx1_X, vtx1_Y, vtx1_Z,
    vtx2_X, vtx2_Y, vtx2_Z,
    vtx3_X, vtx3_Y, vtx3_Z,
    vtx4_X, vtx4_Y, vtx4_Z,
    angleX, angleY, angleZ
    );

    //Q1.10.5
    //c=center(中心), vtx=vertex(頂點)
    output reg signed [15:0] Xc, Yc, Zc;
    output reg signed [15:0] vtx1_X, vtx1_Y, vtx1_Z;
    output reg signed [15:0] vtx2_X, vtx2_Y, vtx2_Z;
    output reg signed [15:0] vtx3_X, vtx3_Y, vtx3_Z;
    output reg signed [15:0] vtx4_X, vtx4_Y, vtx4_Z;

    //Q1.2.13
    //angles are in radian
    output reg signed [15:0] angleX, angleY, angleZ;
    
    //////////////////////////////////////initiallization
    initial begin
        ////center
        Xc = 16'h0000;
        Yc = 16'h0000;
        Zc = 16'h0640;
        ////vertex1
        vtx1_X = 16'h0000;
        vtx1_Y = 16'hff3c;//-0.6123*B
        vtx1_Z = 16'h0000;
        ////vertex2
        vtx2_X = 16'hff60;//-0.5*B
        vtx2_Y = 16'h0041;//0.204124*B
        vtx2_Z = 16'h005c;//0.288675*B
        ////vertex3
        vtx3_X = 16'h00a0;//0.5*B
        vtx3_Y = 16'h0041;//0.204124*B
        vtx3_Z = 16'h005c;//0.288675*B
        ////vertex4
        vtx4_X = 16'h0000;
        vtx4_Y = 16'h0041;//0.204124*B
        vtx4_Z = 16'hff47;//-0.57735*B
        ////angles
        angleX = 16'h0000;
        angleY = 16'h0000;
        angleZ = 16'h0000;
    end
    //////////////////////////////////////initiallization end
    
    //constant side_length = B = 10
    always@(*)begin
        ////center
        Xc = 16'h0000;
        Yc = 16'h0000;
        Zc = 16'h0640;
        ////vertex1
        vtx1_X = 16'h0000;
        vtx1_Y = 16'hff3c;//-0.6123*B
        vtx1_Z = 16'h0000;
        ////vertex2
        vtx2_X = 16'hff60;//-0.5*B
        vtx2_Y = 16'h0041;//0.204124*B
        vtx2_Z = 16'h005c;//0.288675*B
        ////vertex3
        vtx3_X = 16'h00a0;//0.5*B
        vtx3_Y = 16'h0041;//0.204124*B
        vtx3_Z = 16'h005c;//0.288675*B
        ////vertex4
        vtx4_X = 16'h0000;
        vtx4_Y = 16'h0041;//0.204124*B
        vtx4_Z = 16'hff47;//-0.57735*B
        ////angles
        angleX = 16'h0000;
        angleY = 16'h0000;
        angleZ = 16'h0000;
    end
endmodule
