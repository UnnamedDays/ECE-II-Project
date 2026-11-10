# ==========================================
# BCD to Binary 변환기 (bcd_conv) XDC 제약 파일
# ==========================================

# I/O 표준 설정 (3.3V LVCMOS)
set_property IOSTANDARD LVCMOS33 [get_ports {one[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ten[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bin[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {valid}]

# ------------------------------------------
# 1. 일의 자리 입력 (one[3:0]) -> 스위치 SW3 ~ SW0 매핑
# ------------------------------------------
set_property PACKAGE_PIN V17 [get_ports {one[0]}]
set_property PACKAGE_PIN V16 [get_ports {one[1]}]
set_property PACKAGE_PIN W16 [get_ports {one[2]}]
set_property PACKAGE_PIN W17 [get_ports {one[3]}]

# ------------------------------------------
# 2. 십의 자리 입력 (ten[3:0]) -> 스위치 SW7 ~ SW4 매핑
# ------------------------------------------
set_property PACKAGE_PIN W15 [get_ports {ten[0]}]
set_property PACKAGE_PIN V15 [get_ports {ten[1]}]
set_property PACKAGE_PIN W14 [get_ports {ten[2]}]
set_property PACKAGE_PIN W13 [get_ports {ten[3]}]

# ------------------------------------------
# 3. 이진수 출력 값 (bin[6:0]) -> LED6 ~ LED0 매핑
# ------------------------------------------
set_property PACKAGE_PIN U16 [get_ports {bin[0]}]
set_property PACKAGE_PIN E19 [get_ports {bin[1]}]
set_property PACKAGE_PIN V19 [get_ports {bin[2]}]
set_property PACKAGE_PIN W18 [get_ports {bin[3]}]
set_property PACKAGE_PIN U15 [get_ports {bin[4]}]
set_property PACKAGE_PIN U14 [get_ports {bin[5]}]
set_property PACKAGE_PIN V14 [get_ports {bin[6]}]

# ------------------------------------------
# 4. 유효성 검사 출력 (valid) -> LED7 매핑
# ------------------------------------------
set_property PACKAGE_PIN V13 [get_ports {valid}]