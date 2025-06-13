`timescale 1ns / 1ps
/*
這份程式會在一開始以及rst被按下時，將資料存入ram中，隨後以每秒一次的頻率將資料讀出並印在LED上
*/
module main(CLK, rst, dout);
input CLK, rst;
output reg[15:0] dout;

/////////////////////////////////////////assigning data
wire[15:0] data1, data2, data3, data4;
wire[3:0] data_num;
assign 
    data1 = 16'b0000_0000_0000_0001,
    data2 = 16'b0000_0000_0001_0000,
    data3 = 16'b0000_0001_0000_0000,
    data4 = 16'b0001_0000_0000_0000,
    data_num = 4'd4;
/////////////////////////////////////////assigning data end

/////////////////////////////////////////clock devider
wire clk;
CD_1Hz uCD(.CLK(CLK), .rst(rst), .clk(clk));
/////////////////////////////////////////clock devider end



reg [8:0]addr;

reg [8:0] addrW;
reg [8:0] addrR;
reg [15:0] data_input;
wire [15:0] data_output;
reg write_en;
/////////////////////////////////////////choosing whitch addr to drive (W or R)
always@(*)begin
    if(write_en)begin
        addr = addrW;
    end else begin
        addr = addrR;
    end
end
/////////////////////////////////////////choosing whitch addr to drive (W or R) end

/////////////////////////////////////////writing data into ram
reg[3:0] din_count;
initial din_count = 4'd0;

always@(posedge CLK or posedge rst)begin
    if(rst)begin
        din_count <= 4'd0;
        addrW <= 9'b0;
        data_input <= 16'd0;
        write_en <= 1'b0;
    end else begin
        case(din_count)
            4'd0:begin
                addrW <= 9'b0000_0000_0;
                data_input <= data1;
                write_en <= 1'b1;
            end
            4'd1:begin
                addrW <= 9'b0000_0000_1;
                data_input <= data2;
                write_en <= 1'b1;
            end
            4'd2:begin
                addrW <= 9'b0000_0001_0;
                data_input <= data3;
                write_en <= 1'b1;
            end
            4'd3:begin
                addrW <= 9'b0000_0001_1;
                data_input <= data4;
                write_en <= 1'b1;
            end
            default:begin
                addrW <= 9'b0;
                data_input <= 16'd0;
                write_en <= 1'b0;
            end
        endcase;
        
        if(din_count >= data_num)begin
           din_count <= din_count; 
        end else begin
            din_count <= din_count + 4'd1;
        end
    end
end
/////////////////////////////////////////writing data into ram end


/////////////////////////////////////////reading data from the ram
reg[3:0] dout_count;
initial dout_count = 4'd0;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        dout <= 16'b0000_0000_0000_0000;
        dout_count <= 4'd0;
        addrR <= 9'd0;
    end else begin
        if(!write_en)begin
            if(dout_count >= data_num)begin
                dout_count <= 4'd0;
            end else begin
                dout_count <= dout_count + 4'd1;
            end

            dout <= data_output;
            addrR <= {5'b0, dout_count};
        end else begin
            dout <= dout;
            dout_count <= dout_count;
            addrR <= 9'd0;
        end
    end
end
/////////////////////////////////////////reading data from the ram end

/////////實例化ram
ram_tst uram(.clka(CLK), .addra(addr), .dina(data_input), .douta(data_output), .wea(write_en));
endmodule
