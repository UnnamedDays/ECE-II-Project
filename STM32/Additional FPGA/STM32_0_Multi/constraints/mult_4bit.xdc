# ==========================================
# 4비트 곱셈기 (mult_4bit) XDC 제약 파일
# ==========================================

# I/O 표준 설정 (일반적인 3.3V FPGA 보드 기준)
set_property IOSTANDARD LVCMOS33 [get_ports {a[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m[*]}]

# ------------------------------------------
# 1. 입력 A 핀 매핑 (4비트: 스위치 연결 예시)
# ------------------------------------------
set_property PACKAGE_PIN V17 [get_ports {a[0]}]
set_property PACKAGE_PIN V16 [get_ports {a[1]}]
set_property PACKAGE_PIN W16 [get_ports {a[2]}]
set_property PACKAGE_PIN W17 [get_ports {a[3]}]

# ------------------------------------------
# 2. 입력 B 핀 매핑 (4비트: 스위치 연결 예시)
# ------------------------------------------
set_property PACKAGE_PIN W15 [get_ports {b[0]}]
set_property PACKAGE_PIN V15 [get_ports {b[1]}]
set_property PACKAGE_PIN W14 [get_ports {b[2]}]
set_property PACKAGE_PIN W13 [get_ports {b[3]}]

# ------------------------------------------
# 3. 출력 M 핀 매핑 (8비트: LED 연결 예시)
# ------------------------------------------
set_property PACKAGE_PIN U16 [get_ports {m[0]}]
set_property PACKAGE_PIN E19 [get_ports {m[1]}]
set_property PACKAGE_PIN V19 [get_ports {m[2]}]
set_property PACKAGE_PIN W18 [get_ports {m[3]}]
set_property PACKAGE_PIN U15 [get_ports {m[4]}]
set_property PACKAGE_PIN U14 [get_ports {m[5]}]
set_property PACKAGE_PIN V14 [get_ports {m[6]}]
set_property PACKAGE_PIN V13 [get_ports {m[7]}]