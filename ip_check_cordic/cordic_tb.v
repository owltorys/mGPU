`timescale 1ns / 1ps
module cordic_tb;

/* ---------------------------------
 * 1. DUT 連接埠宣告
 * ---------------------------------*/
reg  clk;
reg  [15:0] angle;      // Q1.2.13
reg  valid_in;
wire [15:0] cos_out;    // Q1.1.14
wire [15:0] sin_out;    // Q1.1.14
wire valid_out;

main dut (
    .clk      (clk),
    .angle    (angle),
    .valid_in (valid_in),
    .cos_out  (cos_out),
    .sin_out  (sin_out),
    .valid_out(valid_out)
);

/* ---------------------------------
 * 3. 角度常數 (Q1.2.13)
 *    0, π/6, π/2, π, -π/2
 * ---------------------------------*/
//16'hCDBC,   // -π/2  ≈ -1.5708
//16'h6488,   //  π    ≈  3.1416
//16'h3244,   //  π/2  ≈  1.5708
//16'h10C1,   //  π/6  ≈  0.5236
//16'h0000    //  0

/* ---------------------------------
 * 4. 刺激流程
 * ---------------------------------*/
// 時鐘產生器：每 5ns 切換一次，產生 10ns 週期（100MHz）的時鐘
    always #5 clk = ~clk;

    initial begin
        // 初始設定
        clk = 0;
        angle = 16'd0;
        valid_in = 1'b0;
        
        // 給予重置信號（20ns）
        #20;
        angle = 16'd0;
        valid_in = 1'b0;
        
        // 測試向量 1
        #10;
        angle = 16'hCDBC;   // -π/2  ≈ -1.5708;
        valid_in = 1'b1;
        #20
        valid_in = 1'b0;
        
        // 等待一段時間以觀察 done 訊號
        #300;
        
        // 測試向量 2
        angle = 16'h3244;   //  π/2  ≈  1.5708
        valid_in = 1'b1;
        #20
        valid_in = 1'b0;
        
        // 再次等待一段時間
        #1000;
        
        // 結束模擬
        $finish;
    end
endmodule
