#################################################
# System Clock
#################################################
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk [get_ports clk]

#################################################
# Reset Button
#################################################
set_property PACKAGE_PIN U18 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

#################################################
# SPI Interface
#################################################

# SPI Chip Select (CS)
set_property PACKAGE_PIN V17 [get_ports spi_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs_n]

# SPI Clock (SCK)
set_property PACKAGE_PIN W16 [get_ports spi_sck]
set_property IOSTANDARD LVCMOS33 [get_ports spi_sck]

# SPI MOSI
set_property PACKAGE_PIN W17 [get_ports spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports spi_mosi]

#################################################
# Debug LEDs
#################################################

set_property PACKAGE_PIN U16 [get_ports {rx_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[0]}]

set_property PACKAGE_PIN E19 [get_ports {rx_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[1]}]

set_property PACKAGE_PIN U19 [get_ports {rx_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[2]}]

set_property PACKAGE_PIN V19 [get_ports {rx_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[3]}]

set_property PACKAGE_PIN W18 [get_ports {rx_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[4]}]

set_property PACKAGE_PIN U15 [get_ports {rx_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[5]}]

set_property PACKAGE_PIN U14 [get_ports {rx_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[6]}]

set_property PACKAGE_PIN V14 [get_ports {rx_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[7]}]

#################################################
# Receive Complete LED
#################################################

set_property PACKAGE_PIN V13 [get_ports rx_done]
set_property IOSTANDARD LVCMOS33 [get_ports rx_done]