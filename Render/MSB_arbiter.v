`timescale 1ns / 1ps
module MSB_arbiter(in, out);
    input [5:0] in;
    output reg [5:0] out;
    
    always@(*)begin
        case(1'b1)
            in[5]: out = 6'b100000;
            in[4]: out = 6'b010000;
            in[3]: out = 6'b001000;
            in[2]: out = 6'b000100;
            in[1]: out = 6'b000010;
            in[0]: out = 6'b000001;
            default : out = 6'b000000;
        endcase
    end
endmodule
