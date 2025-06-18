`timescale 1ns / 1ps

module memory(CLK,reset,memory_state,Min,matrix);
    input CLK,reset;
    input[255:0] Min;
    input memory_state;
    parameter latch=0,load=1;
    
    //memory
    output reg[255:0] matrix;          
    always@(posedge CLK) begin
        if(reset) begin
            matrix <= 0;
        end
        else begin
            case(memory_state)
                latch: begin
                    matrix <= matrix;
                end
                load: begin
                    matrix <= Min;
                end
                default: begin
                    matrix <= matrix;
                end
            endcase
        end
    end
endmodule
