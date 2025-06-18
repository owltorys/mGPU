`timescale 1ns / 1ps

module control(CLK,reset,command,state,memory_state,enable);
    input CLK,reset;
    input[3:0] command;
    output reg[1:0] state;
    output reg memory_state;
    output reg enable;
    reg [1:0] next_state;
    reg[2:0] cycle;
    parameter idle=0,in=1,calculate=2,out=3;
    parameter latch=0,load=1;
    
    always@(*) begin
        case(command)
            0:begin
                next_state = idle;
            end
            1:begin
                next_state = in;
            end
            2:begin
                next_state = calculate;
            end
            3:begin
                next_state = calculate;
            end
            4:begin
                next_state = calculate;
            end
            5:begin
                next_state = calculate;
            end
            6:begin
                next_state = calculate;
            end
            7:begin
                next_state = out;
            end
            8:begin
                next_state = out;
            end
            default:begin
                next_state = idle;
            end
        endcase
        case(cycle)
            0:begin
                if(state==calculate) enable=1;
                else enable=0;
                memory_state=latch;
            end
            1:begin
                if(state==calculate) enable=1;
                else enable=0;
                memory_state=latch;
            end
            2:begin
                if(state==calculate) enable=1;
                else enable=0;
                memory_state=latch;
            end
            3:begin
                if(state==calculate) enable=1;
                else enable=0;
                memory_state=latch;
            end
            4:begin
                enable=0;
                memory_state=load;
            end
            5:begin
                enable=0;
                memory_state=latch;
            end
            default:begin
                enable=0; memory_state=0;
            end
        endcase
    end
    
    reg[2:0] next_cycle;
    always@(*) begin
        if(reset) next_cycle=0;
        else begin
            if(command==0 || command==7 || command==8) begin
                next_cycle = 5;
            end
            else if(cycle>=5) begin
                next_cycle = 0;
            end
            else begin
                next_cycle = cycle+1;
            end
        end
    end
    
    always@(posedge CLK) begin
        if(reset) begin
            cycle <= 0; state <= idle;
        end
        else begin
            cycle <= next_cycle;
            if(cycle>=5) begin
                state <= next_state;
            end
            else begin
                state <= state;
            end
        end
    end
endmodule
