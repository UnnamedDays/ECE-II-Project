`timescale 1ns/1ps

// 4비트 곱셈기 최상위 모듈
module mult_4bit(
    input wire [3:0] a, 
    input wire [4:0] b, // 문맥에 따라 b도 4비트 입력입니다 (문서 원본 참고)
    output wire [7:0] m
);
    multiply_unsigned #(.WIDTH(4)) u_multiply(a, b, m);
endmodule

// 4비트 부호 없는 곱셈 모듈
module multiply_unsigned #(parameter WIDTH = 4)(
    input wire [WIDTH-1:0] a, b,
    output wire [2*WIDTH-1:0] product
);
    assign product = a * b;
endmodule