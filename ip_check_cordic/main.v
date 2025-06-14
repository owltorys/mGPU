`timescale 1ns / 1ps
module main (
    input clk,
    input [15:0] angle,     // Q1.2.13 格式的角度
    input valid_in,
    output [15:0] cos_out,  // Q1.1.14 格式的 cos
    output [15:0] sin_out,  // Q1.1.14 格式的 sin
    output valid_out
);

// CORDIC IP instance
cordic_sin_cos u_cordic (
    .aclk(clk),
    .s_axis_phase_tvalid(valid_in),
    .s_axis_phase_tdata(angle),
    .m_axis_dout_tvalid(valid_out),
    .m_axis_dout_tdata({sin_out, cos_out}) // 根據 IP 設定順序
);

endmodule
