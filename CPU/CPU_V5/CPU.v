`timescale 1ns / 1ps
module CPU(
    CLK, fclk, rst, CPUvalid,
    matrixState,
    mtrxOut,
    controlPad
    );
    /////////////////////////////////////////////////////////IO setup
    input CLK, fclk, rst, CPUvalid;
    output reg[3:0] matrixState;
    output reg signed [335:0] mtrxOut;
    input [11:0] controlPad;
    /////////////////////////////////////////////////////////IO setup end
    //null
    //null
    /////////////////////////////////////////////////////////data initialliztion
    initial begin
        matrixState = 4'd0;//default(do nothing) = 0
        mtrxOut = 336'b0;
    end
    /////////////////////////////////////////////////////////data initialliztion
    //null
    //null
    /////////////////////////////////////////////////////////object_info
    //Q1.10.10
    //c=center(中心), vtx=vertex(頂點)
    wire signed [20:0] Xc, Yc, Zc;
    wire signed [20:0] vtx1_X, vtx1_Y, vtx1_Z;
    wire signed [20:0] vtx2_X, vtx2_Y, vtx2_Z;
    wire signed [20:0] vtx3_X, vtx3_Y, vtx3_Z;
    wire signed [20:0] vtx4_X, vtx4_Y, vtx4_Z;
    //Q1.2.13
    //angles are in radian
    wire signed [15:0] angleX, angleY, angleZ;
    
    object_info uinfo(
        .fclk(fclk), .rst(rst),
        .controlPad(controlPad),
        .Xc(Xc), .Yc(Yc), .Zc(Zc),
        .vtx1_X(vtx1_X), .vtx1_Y(vtx1_Y), .vtx1_Z(vtx1_Z),
        .vtx2_X(vtx2_X), .vtx2_Y(vtx2_Y), .vtx2_Z(vtx2_Z),
        .vtx3_X(vtx3_X), .vtx3_Y(vtx3_Y), .vtx3_Z(vtx3_Z),
        .vtx4_X(vtx4_X), .vtx4_Y(vtx4_Y), .vtx4_Z(vtx4_Z),
        .angleX(angleX), .angleY(angleY), .angleZ(angleZ)
    );
    /////////////////////////////////////////////////////////object_info end
    //null
    //null
    /////////////////////////////////////////////////////////input_matrix
    wire signed [335:0] inMtrx;
        
    input_matrix uinput(
        .pi1X(vtx1_X), .pi1Y(vtx1_Y), .pi1Z(vtx1_Z),
        .pi2X(vtx2_X), .pi2Y(vtx2_Y), .pi2Z(vtx2_Z),
        .pi3X(vtx3_X), .pi3Y(vtx3_Y), .pi3Z(vtx3_Z),
        .pi4X(vtx4_X), .pi4Y(vtx4_Y), .pi4Z(vtx4_Z),
        .inMtrx(inMtrx)
    );
    /////////////////////////////////////////////////////////input_matrix end
    //null
    //null
    ////////////////////////////////////////////////finding the rising edge of fclk
    wire valid_cordic;
    FindingRisingEdgeOf_fclk uFindingRisingEdgeOf_fclk(.CLK(CLK), .fclk(fclk), .rst(rst), .risingEdge_fclk(valid_cordic));
    ////////////////////////////////////////////////finding the rising edge of fclk end
    //null
    //null
    /////////////////////////////////////////////////////////rotateX_matrix
    wire signed [335:0] rotXMtrx;
    
    rotateX_matrix urotateX(
        .CLK(CLK), .rst(rst), .valid(valid_cordic), .angle(angleX),
        .rotXMtrx(rotXMtrx)
    );
    /////////////////////////////////////////////////////////rotateX_matrix end
    //null
    //null
    /////////////////////////////////////////////////////////rotateY_matrix
    wire signed [335:0] rotYMtrx;
    
    rotateY_matrix urotateY(
        .CLK(CLK), .rst(rst), .valid(valid_cordic), .angle(angleY),
        .rotYMtrx(rotYMtrx)
    );
    /////////////////////////////////////////////////////////rotateY_matrix end
    //null
    //null
    /////////////////////////////////////////////////////////rotateZ_matrix
    wire signed [335:0] rotZMtrx;
    
    rotateZ_matrix urotateZ(
        .CLK(CLK), .rst(rst), .valid(valid_cordic), .angle(angleZ),
        .rotZMtrx(rotZMtrx)
    );
    /////////////////////////////////////////////////////////rotateZ_matrix end
    //null
    //null
    /////////////////////////////////////////////////////////shifting_matrix
    wire signed [335:0] shiftMtrx;
    
    shifting_matrix ushifting(
        .Xc(Xc), .Yc(Yc), .Zc(Zc),
        .shiftMtrx(shiftMtrx)
    );
    /////////////////////////////////////////////////////////shifting_matrix end
    //null
    //null
    /////////////////////////////////////////////////////////projection_matrix
    wire signed [335:0] projMtrx;
    
    projection_matrix uprojection(
        .projMtrx(projMtrx)
    );
    /////////////////////////////////////////////////////////projection_matrix end
    //null
    //null
    ////////////////////////////////////////////////////////////////////輸出序列機
    always@(*)begin
        if(CPUvalid)begin
            case(matrixState)
                4'd1:begin//input_matrix
                    mtrxOut = inMtrx;
                end
                4'd2:begin//rotateX_matrix
                    mtrxOut = rotXMtrx;
                end
                4'd3:begin//rotateY_matrix
                    mtrxOut = rotYMtrx;
                end
                4'd4:begin//rotateZ_matrix
                    mtrxOut = rotZMtrx;
                end
                4'd5:begin//shifting_matrix
                    mtrxOut = shiftMtrx;
                end
                4'd6:begin//projection_matrix
                    mtrxOut = projMtrx;
                end
                default:begin//latch in null satate(8) untill next fram
                    mtrxOut = 256'b0;
                end
            endcase
        end else begin//if valid = 0
            mtrxOut = 336'b0;
        end
    end
    
    ////////////////////////////////////////////////////////////matrixState 的序列機
    reg [3:0] mtrxStateCount;
    initial mtrxStateCount = 4'd0;
    
    always@(posedge CLK or posedge rst)begin
        if(rst)begin
            matrixState <= 4'd0;//default(do nothing) = 0
            mtrxStateCount <= 4'd0;
        end else begin
            if(CPUvalid)begin
                if(matrixState < 4'd8)begin
                    if(mtrxStateCount < 4'd6)begin
                        mtrxStateCount <= mtrxStateCount + 4'd1;
                        matrixState <= matrixState;
                    end else begin//if mtrxStateCount > 4'd6
                        mtrxStateCount <= 4'd0;
                        matrixState <= matrixState + 4'd1;
                    end
                end else begin//if matrixState >= 4'd8
                    mtrxStateCount <= 4'd0;
                    matrixState <= matrixState;
                end
            end else begin//if CPUvalid = 0
                matrixState <= 4'd0;//default(do nothing) = 0
                mtrxStateCount <= 4'd0;
            end
        end
    end
    ////////////////////////////////////////////////////////////matrixState 的序列機 end
    ////////////////////////////////////////////////////////////////////輸出序列機 end
endmodule
