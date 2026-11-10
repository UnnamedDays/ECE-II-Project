#################################################
# System Clock
#################################################
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

create_clock -period 10.000 -name sys_clk [get_ports clk]

#################################################
# Reset
#################################################
set_property PACKAGE_PIN U18 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

#################################################
# SPI Master Outputs
#################################################

# CS (Chip Select)
set_property PACKAGE_PIN V17 [get_ports spi_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs_n]

# SCK
set_property PACKAGE_PIN W16 [get_ports spi_sck]
set_property IOSTANDARD LVCMOS33 [get_ports spi_sck]

# MOSI
set_property PACKAGE_PIN W17 [get_ports spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports spi_mosi]