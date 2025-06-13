set_property -dict { PACKAGE_PIN P17 IOSTANDARD LVCMOS33 } [get_ports { CLK }]; 
create_clock -add -name clk -period 10.00 -waveform {0 5} [get_ports { CLK }];
set_property -dict  { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { rst }];


set_property -dict  { PACKAGE_PIN K3 IOSTANDARD LVCMOS33 } [get_ports { dout[0] }];
set_property -dict  { PACKAGE_PIN M1 IOSTANDARD LVCMOS33 } [get_ports { dout[1] }];
set_property -dict  { PACKAGE_PIN L1 IOSTANDARD LVCMOS33 } [get_ports { dout[2] }];
set_property -dict  { PACKAGE_PIN K6 IOSTANDARD LVCMOS33 } [get_ports { dout[3] }];

set_property -dict  { PACKAGE_PIN J5 IOSTANDARD LVCMOS33 } [get_ports { dout[4] }];
set_property -dict  { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports { dout[5] }];
set_property -dict  { PACKAGE_PIN H6 IOSTANDARD LVCMOS33 } [get_ports { dout[6] }];
set_property -dict  { PACKAGE_PIN K1 IOSTANDARD LVCMOS33 } [get_ports { dout[7] }];

set_property -dict  { PACKAGE_PIN K2 IOSTANDARD LVCMOS33 } [get_ports { dout[8] }];
set_property -dict  { PACKAGE_PIN J2 IOSTANDARD LVCMOS33 } [get_ports { dout[9] }];
set_property -dict  { PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports { dout[10] }];
set_property -dict  { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports { dout[11] }];

set_property -dict  { PACKAGE_PIN J4 IOSTANDARD LVCMOS33 } [get_ports { dout[12] }];
set_property -dict  { PACKAGE_PIN G3 IOSTANDARD LVCMOS33 } [get_ports { dout[13] }];
set_property -dict  { PACKAGE_PIN G4 IOSTANDARD LVCMOS33 } [get_ports { dout[14] }];
set_property -dict  { PACKAGE_PIN F6 IOSTANDARD LVCMOS33 } [get_ports { dout[15] }];
