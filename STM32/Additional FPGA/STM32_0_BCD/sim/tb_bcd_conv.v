`timescale 1ns/1ps
module tb;
    reg [3:0] ten, one;
    wire [6:0] bin;
    wire valid;
    
    bcd_conv dut(one, ten, bin, valid);
    integer t, o;
    
    initial begin
        for(t = 0; t < 16; t = t + 1)
            for(o = 0; o < 16; o = o + 1) begin
                ten = t; one = o; #1;
                
                // valid 조건 검증: t와 o가 모두 10 미만(0~9)일 때만 valid가 1이어야 함
                if(valid !== ((t < 10) && (o < 10))) 
                    $fatal(1, "BCD valid error: ten=%0d one=%0d valid=%0b", t, o, valid);
                
                // 유효한 범위일 때 이진수 변환 값 검증
                if(t < 10 && o < 10 && bin !== t * 10 + o) 
                    $fatal(1, "BCD value error: ten=%0d one=%0d bin=%0d", t, o, bin);
            end
            
        $display("PASS BCD: 100 valid and 156 invalid inputs"); 
        $finish;
    end
    
    initial begin #1000; $fatal(1, "timeout"); end
endmodule