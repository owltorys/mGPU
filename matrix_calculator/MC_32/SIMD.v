`timescale 1ns / 1ps

module SIMD(CLK,reset,enable,Matrix_A,Matrix_B,Matrix_C);
    input CLK,reset,enable;
    input[511:0] Matrix_A,Matrix_B;
    output[511:0] Matrix_C;
    
    wire[127:0] A1,A2,A3,A4,B1,B2,B3,B4;
    assign A1 = Matrix_A[511:384];
    assign A2 = Matrix_A[383:256];
    assign A3 = Matrix_A[255:128];
    assign A4 = Matrix_A[127:0];
    assign B1 = Matrix_B[511:384];
    assign B2 = Matrix_B[383:256];
    assign B3 = Matrix_B[255:128];
    assign B4 = Matrix_B[127:0];
    
    PE pe11(CLK,reset,enable,A1,B1,Matrix_C[511:480]);
    PE pe21(CLK,reset,enable,A2,B1,Matrix_C[479:448]);
    PE pe31(CLK,reset,enable,A3,B1,Matrix_C[447:416]);
    PE pe41(CLK,reset,enable,A4,B1,Matrix_C[415:384]);
    PE pe12(CLK,reset,enable,A1,B2,Matrix_C[383:352]);
    PE pe22(CLK,reset,enable,A2,B2,Matrix_C[351:320]);
    PE pe32(CLK,reset,enable,A3,B2,Matrix_C[319:288]);
    PE pe42(CLK,reset,enable,A4,B2,Matrix_C[287:256]);
    PE pe13(CLK,reset,enable,A1,B3,Matrix_C[255:224]);
    PE pe23(CLK,reset,enable,A2,B3,Matrix_C[223:192]);
    PE pe33(CLK,reset,enable,A3,B3,Matrix_C[191:160]);
    PE pe43(CLK,reset,enable,A4,B3,Matrix_C[159:128]);
    PE pe14(CLK,reset,enable,A1,B4,Matrix_C[127:96]);
    PE pe24(CLK,reset,enable,A2,B4,Matrix_C[95:64]);
    PE pe34(CLK,reset,enable,A3,B4,Matrix_C[63:32]);
    PE pe44(CLK,reset,enable,A4,B4,Matrix_C[31:0]);
endmodule
