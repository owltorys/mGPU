`timescale 1ns / 1ps
module MSB_arbiter(in, out);
    input [9:0] in;
    output reg [9:0] out;
    
    always@(*)begin
        case(1'b1)
            in[9]: out = 10'b1000_0000_00;
            in[8]: out = 10'b0010_0000_00;
            in[7]: out = 10'b0010_0000_00;
            in[6]: out = 10'b0001_0000_00;
            in[5]: out = 10'b0000_1000_00;
            in[4]: out = 10'b0000_0100_00;
            in[3]: out = 10'b0000_0010_00;
            in[2]: out = 10'b0000_0001_00;
            in[1]: out = 10'b0000_0000_10;
            in[0]: out = 10'b0000_0000_01;
            default : out = 10'b0000_0000_00;
        endcase
    end
endmodule
