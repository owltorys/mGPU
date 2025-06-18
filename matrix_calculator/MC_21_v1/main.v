`timescale 1ns / 1ps

module matrix_calculator(CLK,reset,command,Matrix_in,Matrix_out,MC_state_sim,memory_state_sim,enable_sim,Matrix_C_sim); //AxB=C
    input CLK,reset;
    input[3:0] command;
    input[335:0] Matrix_in;
    output[335:0] Matrix_out;
    wire[1:0] state;
    wire enable;
    wire[335:0] Matrix_C;
    parameter idle=0,in=1,calculate=2,out=3;
    
    //memory
    wire memory_state;
    reg[335:0] Min;
    always@(*) begin
        case(state)
            in:Min=Matrix_in;
            calculate:Min=Matrix_C;
            default:Min=Matrix_C;
        endcase
    end
    memory matrix_memory(CLK,reset,memory_state,Min,Matrix_out);
    
    //control
    control mc_controller(CLK,reset,command,state,memory_state,enable);
    
    //matrix calculating
    SIMD simd_4(CLK,reset,enable,Matrix_in,Matrix_out,Matrix_C);
    
    output reg[1:0] MC_state_sim;
    output reg memory_state_sim,enable_sim;
    output reg[335:0] Matrix_C_sim;
    always@(*) begin
        MC_state_sim = state; memory_state_sim = memory_state; enable_sim=enable; 
        Matrix_C_sim = Matrix_C;
    end
endmodule
