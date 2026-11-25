# ==========================================
# UART LED Control
# ==========================================

# Clock (100 MHz)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk -waveform {0 5} [get_ports clk]

# ==========================================
# UART
# ==========================================

# RXD
set_property PACKAGE_PIN A18 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]

# TXD
set_property PACKAGE_PIN B18 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]

# ==========================================
# LED
# ==========================================

set_property PACKAGE_PIN U16 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]