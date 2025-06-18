`timescale 1ns / 1ps

module PE(CLK,reset,en,A,B,c);
    input CLK,en,reset;
    input[63:0] A,B;
    output[15:0] c;
    wire signed[15:0] m1,m2,m3,m4,p1,p2;
    wire signed[15:0] a1,a2,a3,a4,b1,b2,b3,b4;
    assign a1 = A[63:48];
    assign a2 = A[47:32];
    assign a3 = A[31:16];
    assign a4 = A[15:0];

    assign b1 = B[63:48];
    assign b2 = B[47:32];
    assign b3 = B[31:16];
    assign b4 = B[15:0];
    
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
    mult_16 M1(CLK,a1,b1,ce[0],m1);
    mult_16 M2(CLK,a2,b2,ce[0],m2);
    mult_16 M3(CLK,a3,b3,ce[0],m3);
    mult_16 M4(CLK,a4,b4,ce[0],m4);
    
    //adder
    adder_16 A1(m1,m2,CLK,ce[1],p1);
    adder_16 A2(m3,m4,CLK,ce[1],p2);
    adder_16 A3(p1,p2,CLK,ce[2],c);
endmodule
