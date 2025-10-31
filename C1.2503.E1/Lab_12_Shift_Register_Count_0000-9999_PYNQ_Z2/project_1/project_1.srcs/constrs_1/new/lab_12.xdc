set_property IOSTANDARD LVCMOS33 [get_ports DIO]
set_property IOSTANDARD LVCMOS33 [get_ports RCLK]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports SCLK]
set_property PACKAGE_PIN W14 [get_ports DIO]
set_property PACKAGE_PIN Y18 [get_ports RCLK]
set_property PACKAGE_PIN Y19 [get_ports SCLK]
set_property PACKAGE_PIN H16 [get_ports clk]
set_property PACKAGE_PIN D19 [get_ports rst]

create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];
