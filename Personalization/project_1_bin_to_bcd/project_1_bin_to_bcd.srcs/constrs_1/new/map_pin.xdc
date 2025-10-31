## Clock
set_property PACKAGE_PIN H16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset button
set_property PACKAGE_PIN D19 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Arduino header inputs (DIP switch -> ar[3:0])
set_property PACKAGE_PIN T14 [get_ports {ar[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ar[0]}]

set_property PACKAGE_PIN U12 [get_ports {ar[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ar[1]}]

set_property PACKAGE_PIN U13 [get_ports {ar[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ar[2]}]

set_property PACKAGE_PIN V13 [get_ports {ar[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ar[3]}]

## 7-seg anode (PmodB)
set_property PACKAGE_PIN W14 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN Y14 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN T11 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN T10 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

## 7-seg segments (PmodA)
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN U18 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN U19 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN W18 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

## Debug LEDs on board (LD0..LD3)
set_property PACKAGE_PIN R14 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN P14 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN N16 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN M14 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]


set_property PACKAGE_PIN Y18 [get_ports {seg[0]}]
set_property PACKAGE_PIN Y19 [get_ports {seg[1]}]
set_property PACKAGE_PIN Y16 [get_ports {seg[2]}]
set_property PACKAGE_PIN Y17 [get_ports {seg[3]}]
