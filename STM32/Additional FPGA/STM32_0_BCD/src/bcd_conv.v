`timescale 1ns/1ps

// 1. BCD를 이진수로 변환 및 유효성 검사 모듈
module bcd_to_binary(
    input wire [3:0] ten, one,
    output wire [6:0] binary,
    output wire valid
);
    // 이진수 값 계산: 십의 자리 * 10 + 일의 자리
    assign binary = ten * 7'd10 + one;
    
    // 각 자리(ten, one)가 모두 0~9 범위일 때만 valid가 1
    assign valid = (ten <= 9) && (one <= 9);
endmodule

// 2. 최상위 연결 모듈
module bcd_conv(
    input wire [3:0] one, ten,
    output wire [6:0] bin,
    output wire valid
);
    bcd_to_binary u_convert(ten, one, bin, valid);
endmodule