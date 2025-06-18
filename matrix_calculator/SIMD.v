`timescale 1ns / 1ps
module SIMD(CLK,reset,enable,Matrix_A,Matrix_B,Matrix_C);
    input CLK,reset,enable;
    input[255:0] Matrix_A,Matrix_B;
    output[255:0] Matrix_C;
    
    wire[63:0] A1,A2,A3,A4,B1,B2,B3,B4;
    assign A1 = Matrix_A[255:192];
    assign A2 = Matrix_A[191:128];
    assign A3 = Matrix_A[127:64];
    assign A4 = Matrix_A[63:0];
    assign B1 = Matrix_B[255:192];
    assign B2 = Matrix_B[191:128];
    assign B3 = Matrix_B[127:64];
    assign B4 = Matrix_B[63:0];
    
    PE pe11(CLK,reset,enable,A1,B1,Matrix_C[255:240]);
    PE pe12(CLK,reset,enable,A1,B2,Matrix_C[191:176]);
    PE pe13(CLK,reset,enable,A1,B3,Matrix_C[127:112]);
    PE pe14(CLK,reset,enable,A1,B4,Matrix_C[63:48]);
    PE pe21(CLK,reset,enable,A2,B1,Matrix_C[239:224]);
    PE pe22(CLK,reset,enable,A2,B2,Matrix_C[175:160]);
    PE pe23(CLK,reset,enable,A2,B3,Matrix_C[111:96]);
    PE pe24(CLK,reset,enable,A2,B4,Matrix_C[47:32]);
    PE pe31(CLK,reset,enable,A3,B1,Matrix_C[223:208]);
    PE pe32(CLK,reset,enable,A3,B2,Matrix_C[159:144]);
    PE pe33(CLK,reset,enable,A3,B3,Matrix_C[95:80]);
    PE pe34(CLK,reset,enable,A3,B4,Matrix_C[31:16]);
    PE pe41(CLK,reset,enable,A4,B1,Matrix_C[207:192]);
    PE pe42(CLK,reset,enable,A4,B2,Matrix_C[143:128]);
    PE pe43(CLK,reset,enable,A4,B3,Matrix_C[79:64]);
    PE pe44(CLK,reset,enable,A4,B4,Matrix_C[15:0]);
endmodule
