`timescale 1ns / 1ps
module object_info(
    fclk, rst,
    controlPad,
    Xc, Yc, Zc,
    vtx1_X, vtx1_Y, vtx1_Z,
    vtx2_X, vtx2_Y, vtx2_Z,
    vtx3_X, vtx3_Y, vtx3_Z,
    vtx4_X, vtx4_Y, vtx4_Z,
    angleX, angleY, angleZ
    );
    /////////////////////////////////////////////////////////IO setup
    //control
    input fclk, rst;
    input [11:0] controlPad;
    //Q1.10.10
    //c=center(中心), vtx=vertex(頂點)
    output reg signed [20:0] Xc, Yc, Zc;
    output reg signed [20:0] vtx1_X, vtx1_Y, vtx1_Z;
    output reg signed [20:0] vtx2_X, vtx2_Y, vtx2_Z;
    output reg signed [20:0] vtx3_X, vtx3_Y, vtx3_Z;
    output reg signed [20:0] vtx4_X, vtx4_Y, vtx4_Z;
    //Q1.2.13
    //angles are in radian
    output reg signed [15:0] angleX, angleY, angleZ;
    /////////////////////////////////////////////////////////IO setup end
    //null
    //null
    /////////////////////////////////////////////////////////initiallization
    initial begin
        //constant side_length = B = 10
        ////center
        Xc = 21'h000000;
        Yc = 21'h000000;
        Zc = 21'h00b400;//45
        ////vertex1
        vtx1_X = 21'h000000;
        vtx1_Y =-21'h00187e;//-0.6123*B
        vtx1_Z = 21'h000000;
        ////vertex2
        vtx2_X =-21'h001400;//-0.5*B
        vtx2_Y = 21'h00082a;//0.204124*B
        vtx2_Z = 21'h000b8c;//0.288675*B
        ////vertex3
        vtx3_X = 21'h001400;//0.5*B
        vtx3_Y = 21'h00082a;//0.204124*B
        vtx3_Z = 21'h000b8c;//0.288675*B
        ////vertex4
        vtx4_X = 21'h000000;
        vtx4_Y = 21'h00082a;//0.204124*B
        vtx4_Z =-21'h001718;//-0.57735*B
        ////angles
        angleX = 16'h0000;
        angleY = 16'h0000;
        angleZ = 16'h0000;
    end
    /////////////////////////////////////////////////////////initiallization end
    //null
    //null
    /////////////////////////////////////////////////////////control the points
    wire [1:0] FB, LR, UD, rotXpn, rotYpn, rotZpn;
    assign {FB, LR, UD, rotXpn, rotYpn, rotZpn} = controlPad;
    
    always@(posedge fclk or posedge rst)begin
        if(rst)begin
            ////center
            Xc = 21'h000000;
            Yc = 21'h000000;
            Zc = 21'h00b400;//45
            ////angles
            angleX <= 16'h0000;
            angleY <= 16'h0000;
            angleZ <= 16'h0000;
        end else begin//if rst = 1'b0
            //前/後
            case(FB)
                2'b10:begin//Forward
                    Zc <= Zc + 21'h000400;
                end
                2'b01:begin//Back
                    Zc <= Zc - 21'h000400;
                end
                default:begin
                    Zc <= Zc;
                end
            endcase
            //左/右
            case(LR)
                2'b10:begin//Left
                    Xc <= Xc - 21'h000400;
                end
                2'b01:begin//Right
                    Xc <= Xc + 21'h000400;
                end
                default:begin
                    Xc <= Xc;
                end
            endcase
            //上/下
            case(UD)
                2'b10:begin//Up
                    Yc <= Yc - 21'h000400;
                end
                2'b01:begin//Down
                    Yc <= Yc + 21'h000400;
                end
                default:begin
                    Yc <= Yc;
                end
            endcase
            //X軸旋轉
            case(rotXpn)
                2'b10:begin//positive 逆時針
                    angleX <= angleX + 16'h0020;
                end
                2'b01:begin//negtive 順時針
                    angleX <= angleX - 16'h0020;
                end
                default:begin
                    angleX <= angleX;
                end
            endcase
            //Y軸旋轉
            case(rotYpn)
                2'b10:begin//positive 逆時針
                    angleY <= angleY + 16'h0020;
                end
                2'b01:begin//negtive 順時針
                    angleY <= angleY - 16'h0020;
                end
                default:begin
                    angleY <= angleY;
                end
            endcase
            //Z軸旋轉
            case(rotZpn)
                2'b10:begin//positive 逆時針
                    angleZ <= angleZ + 16'h0020;
                end
                2'b01:begin//negtive 順時針
                    angleZ <= angleZ - 16'h0020;
                end
                default:begin
                    angleZ <= angleZ;
                end
            endcase
        end
    end
    //constant side_length = B = 10
    always@(*)begin
        ////vertex1
        vtx1_X = 21'h000000;
        vtx1_Y =-21'h00187e;//-0.6123*B
        vtx1_Z = 21'h000000;
        ////vertex2
        vtx2_X =-21'h001400;//-0.5*B
        vtx2_Y = 21'h00082a;//0.204124*B
        vtx2_Z = 21'h000b8c;//0.288675*B
        ////vertex3
        vtx3_X = 21'h001400;//0.5*B
        vtx3_Y = 21'h00082a;//0.204124*B
        vtx3_Z = 21'h000b8c;//0.288675*B
        ////vertex4
        vtx4_X = 21'h000000;
        vtx4_Y = 21'h00082a;//0.204124*B
        vtx4_Z =-21'h001718;//-0.57735*B
    end
    /////////////////////////////////////////////////////////control the points end
endmodule
