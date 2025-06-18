`timescale 1ns / 1ps

module SIMD(CLK,reset,enable,Matrix_A,Matrix_B,Matrix_C);
    input CLK,reset,enable;
    input[335:0] Matrix_A,Matrix_B;
    output[335:0] Matrix_C;
    
    wire[83:0] A1,A2,A3,A4,B1,B2,B3,B4;
    assign A1 = Matrix_A[335:252];
    assign A2 = Matrix_A[251:168];
    assign A3 = Matrix_A[167:84];
    assign A4 = Matrix_A[83:0];
    assign B1 = Matrix_B[335:252];
    assign B2 = Matrix_B[251:168];
    assign B3 = Matrix_B[167:84];
    assign B4 = Matrix_B[83:0];
    
    PE pe11(CLK,reset,enable,A1,B1,Matrix_C[335:315]);
    PE pe21(CLK,reset,enable,A2,B1,Matrix_C[314:294]);
    PE pe31(CLK,reset,enable,A3,B1,Matrix_C[293:273]);
    PE pe41(CLK,reset,enable,A4,B1,Matrix_C[272:252]);
    PE pe12(CLK,reset,enable,A1,B2,Matrix_C[251:231]);
    PE pe22(CLK,reset,enable,A2,B2,Matrix_C[230:210]);
    PE pe32(CLK,reset,enable,A3,B2,Matrix_C[209:189]);
    PE pe42(CLK,reset,enable,A4,B2,Matrix_C[188:168]);
    PE pe13(CLK,reset,enable,A1,B3,Matrix_C[167:147]);
    PE pe23(CLK,reset,enable,A2,B3,Matrix_C[146:126]);
    PE pe33(CLK,reset,enable,A3,B3,Matrix_C[125:105]);
    PE pe43(CLK,reset,enable,A4,B3,Matrix_C[104:84]);
    PE pe14(CLK,reset,enable,A1,B4,Matrix_C[83:63]);
    PE pe24(CLK,reset,enable,A2,B4,Matrix_C[62:42]);
    PE pe34(CLK,reset,enable,A3,B4,Matrix_C[41:21]);
    PE pe44(CLK,reset,enable,A4,B4,Matrix_C[20:0]);
endmodule
