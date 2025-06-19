`timescale 1ns / 1ps

module PE(CLK,reset,en,A,B,c);
    input CLK,en,reset;
    input[127:0] A,B;
    output[31:0] c;
    wire signed[31:0] m1,m2,m3,m4,p1,p2;
    wire signed[31:0] a1,a2,a3,a4,b1,b2,b3,b4;
    assign a1 = A[127:96];
    assign a2 = A[95:64];
    assign a3 = A[63:32];
    assign a4 = A[31:0];

    assign b1 = B[127:96];
    assign b2 = B[95:64];
    assign b3 = B[63:32];
    assign b4 = B[31:0];
    
    //control
    reg[2:0] ce,next_ce;
    always@(*) begin
        if(en==0 || reset) begin
            next_ce = 3'b001;
        end
        else begin
            case(ce)
                3'b000: begin
                    next_ce = 3'b001;
                end
                3'b001: begin
                    next_ce = 3'b010;
                end
                3'b010: begin
                    next_ce = 3'b100;
                end
                3'b100: begin
                    next_ce = 3'b100;
                end
                default: begin
                    next_ce = 3'b000;
                end
            endcase
        end
    end
    
    always@(posedge CLK) begin
        if(reset || en==0) begin
            ce <= 0;
        end
        else begin
            ce <= next_ce;
        end
    end
    
    //multiplyer
    mult_32 M1(CLK,a1,b1,ce[0],m1);
    mult_32 M2(CLK,a2,b2,ce[0],m2);
    mult_32 M3(CLK,a3,b3,ce[0],m3);
    mult_32 M4(CLK,a4,b4,ce[0],m4);
    
    //adder
    adder_32 A1(m1,m2,CLK,ce[1],p1);
    adder_32 A2(m3,m4,CLK,ce[1],p2);
    adder_32 A3(p1,p2,CLK,ce[2],c);
endmodule
