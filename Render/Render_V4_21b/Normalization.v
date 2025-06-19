`timescale 1ns / 1ps

module Normalization(
    CLK, rst, calculate_state,
    matrix_state,
    d11, d12, d13, d14,
    d21, d22, d23, d24,
    d31, d32, d33, d34,
    d41, d42, d43, d44,
    vtx1_X, vtx1_Y, vtx1_Z,
    vtx2_X, vtx2_Y, vtx2_Z,
    vtx3_X, vtx3_Y, vtx3_Z,
    vtx4_X, vtx4_Y, vtx4_Z
    );
    input CLK, rst;
    input [3:0] matrix_state; //8=>divide 1=>clear
    /////////////////////////input data setup
    input signed [20:0]
        d11, d12, d13, d14,
        d21, d22, d23, d24,
        d31, d32, d33, d34,
        d41, d42, d43, d44;
    /////////////////////////input data setup end
    //null
    //null
    /////////////////////////output data setup
    //vtx=vertex(頂點)
    output reg signed[20:0]
        vtx1_X, vtx1_Y, vtx1_Z,
        vtx2_X, vtx2_Y, vtx2_Z,
        vtx3_X, vtx3_Y, vtx3_Z,
        vtx4_X, vtx4_Y, vtx4_Z;
    /////////////////////////output data setup end
    //null
    //null
    /////////////////////////wire setup
    wire divider_open;
    wire signed [20:0] quotient;
    /////////////////////////wire setup end
    //null
    //null
    /////////////////////////reg setup
    output reg [3:0] calculate_state;
    reg [3:0] next_calculate_state;
    reg [5:0] divider_counter;
    reg signed [20:0] dividend, divisor;
    reg signed[20:0]
        next_vtx1_X, next_vtx1_Y,
        next_vtx2_X, next_vtx2_Y,
        next_vtx3_X, next_vtx3_Y,
        next_vtx4_X, next_vtx4_Y;
    /////////////////////////reg setup end
    //null
    //null
    //////////////////////////////////////////////////////////////normalization
    divider_21bits divider1(.clk(CLK), .open(divider_open), .dividend_input(dividend), .divisor_input(divisor), .quotient_output(quotient));
           
    assign divider_open = matrix_state == 4'h8;
    
    //state switch
    always @(posedge CLK, posedge rst) begin
        if(rst) begin
            divider_counter <= 6'b0;
            calculate_state <= 4'b0;
        end else if(divider_counter >= 6'd44) begin
            divider_counter <= 6'b0;
            calculate_state <= next_calculate_state;
        end else
            divider_counter <= divider_counter + 6'b1;
    end
 
    //next state determination
    always @(*) begin
        if(divider_open) begin
            if(calculate_state >= 4'h8)
                next_calculate_state = 4'h9;
            else
                next_calculate_state = calculate_state + 4'b1;
        end else
            next_calculate_state = 4'b0;
    end
    
    
    always @(posedge CLK, posedge rst) begin
        if(rst) begin
            {vtx1_X, vtx1_Y} <= 42'b0;
            {vtx2_X, vtx2_Y} <= 42'b0;
            {vtx3_X, vtx3_Y} <= 42'b0;
            {vtx4_X, vtx4_Y} <= 42'b0;
        end else begin
            {vtx1_X, vtx1_Y} <= {next_vtx1_X, next_vtx1_Y};
            {vtx2_X, vtx2_Y} <= {next_vtx2_X, next_vtx2_Y};
            {vtx3_X, vtx3_Y} <= {next_vtx3_X, next_vtx3_Y};
            {vtx4_X, vtx4_Y} <= {next_vtx4_X, next_vtx4_Y};
        end
    end
    
    always @(*) begin
        {next_vtx1_X, next_vtx1_Y} = {vtx1_X, vtx1_Y};
        {next_vtx2_X, next_vtx2_Y} = {vtx2_X, vtx2_Y};
        {next_vtx3_X, next_vtx3_Y} = {vtx3_X, vtx3_Y};
        {next_vtx4_X, next_vtx4_Y} = {vtx4_X, vtx4_Y};
        dividend = 21'b1;
        divisor = 21'b1;
        case(calculate_state)
            4'h1: 
                begin
                    dividend = d11;
                    divisor = d41;
                    next_vtx1_X = quotient;
                end
            4'h2:
                begin
                    dividend = d21;
                    divisor = d41;
                    next_vtx1_Y = quotient;
                end
            4'h3:
                begin
                    dividend = d12;
                    divisor = d42;
                    next_vtx2_X = quotient;
                end
            4'h4:
                begin
                    dividend = d22;
                    divisor = d42;
                    next_vtx2_Y = quotient;
                end
            4'h5:
                begin
                    dividend = d13;
                    divisor = d43;
                    next_vtx3_X = quotient;
                end
            4'h6:
                begin
                    dividend = d23;
                    divisor = d43;
                    next_vtx3_Y = quotient;
                end
            4'h7:
                begin
                    dividend = d14;
                    divisor = d44;
                    next_vtx4_X = quotient;
                end
            4'h8:
                begin
                    dividend = d24;
                    divisor = d44;
                    next_vtx4_Y = quotient;
                end
            endcase
    end
    
    always @(posedge CLK, posedge rst) begin
        if(rst) begin
            vtx1_Z <= 21'b0;
            vtx2_Z <= 21'b0;
            vtx3_Z <= 21'b0;
            vtx4_Z <= 21'b0;
        end else begin
            vtx1_Z <= d41;
            vtx2_Z <= d42;
            vtx3_Z <= d43;
            vtx4_Z <= d44;
        end
    end
    //////////////////////////////////////////////////////////////normalization end
endmodule
