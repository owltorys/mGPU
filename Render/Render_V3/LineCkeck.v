`timescale 1ns / 1ps
module LineCheck(
    h_cnt_Q, v_cnt_Q,
    vtxA_X, vtxA_Y,
    vtxB_X, vtxB_Y,
    onLine
    );
    ///////////////////////////////////////////////IO setup
    input signed[20:0] h_cnt_Q, v_cnt_Q;
    input signed[20:0]
        vtxA_X, vtxA_Y,
        vtxB_X, vtxB_Y;
    output reg onLine;
    ///////////////////////////////////////////////IO setup end
    //null
    //null
    ///////////////////////////////////////////////calculate vector AP and AB
    wire signed[20:0] vAP_X, vAP_Y, vAB_X, vAB_Y;
    assign
        //vAP
        vAP_X = h_cnt_Q - vtxA_X,
        vAP_Y = v_cnt_Q - vtxA_Y,
        //vAB
        vAB_X = vtxB_X - vtxA_X,
        vAB_Y = vtxB_Y - vtxA_Y;
    ///////////////////////////////////////////////calculate vector AP and AB end
    //null
    //null
    ///////////////////////////////////////////////AP cross AB
    wire signed[41:0] crossCalcBuffer;
    assign crossCalcBuffer = vAB_X * vAP_Y - vAP_X * vAB_Y;
    wire signed [20:0] crossResult;
    assign crossResult = crossCalcBuffer >>> 10;
    ///////////////////////////////////////////////AP cross AB end
    //null
    //null
    ///////////////////////////////////////////////crossResult near zero test
    wire signed [20:0]  TH_POS = 21'h400;   // +1
    wire signed [20:0]  TH_NEG = -21'h400;  // -1
    
    wire nearZero = (crossResult <  TH_POS) &&
                    (crossResult >  TH_NEG);
    ///////////////////////////////////////////////crossResult near zero test end
    //null
    //null
    ///////////////////////////////////////////////onSegment test
    wire signed [20:0] minX = (vtxA_X < vtxB_X) ? vtxA_X : vtxB_X;
    wire signed [20:0] maxX = (vtxA_X > vtxB_X) ? vtxA_X : vtxB_X;
    wire signed [20:0] minY = (vtxA_Y < vtxB_Y) ? vtxA_Y : vtxB_Y;
    wire signed [20:0] maxY = (vtxA_Y > vtxB_Y) ? vtxA_Y : vtxB_Y;
    
    wire onSegment = (h_cnt_Q >= minX) && (h_cnt_Q <= maxX) &&
                     (v_cnt_Q >= minY) && (v_cnt_Q <= maxY);
    ///////////////////////////////////////////////onSegment test end
    //null
    //null
    ///////////////////////////////////////////////A B P 的線段測試
    always@(*)begin
        if(nearZero)begin 
            if(onSegment)begin
                onLine = 1'b1;
            end else begin
                onLine = 1'b0;
            end
        end else begin
            onLine = 1'b0;
        end
    end
    ///////////////////////////////////////////////A B P 的線段測試 end
endmodule
