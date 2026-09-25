`timescale 1ns/1ps
module lab2_shift_register #(parameter integer STABLE_CYCLES = 20) (

    input wire clk, input wire rst, input wire button, input wire [7:0] sw,
    output wire [7:0] led
);
    wire reset; wire press; wire [7:0] switches;

    input_frontend #(
        .STABLE_CYCLES(STABLE_CYCLES)
    ) inputs (
        clk, rst, button, sw, reset, press, switches
    );
    wire [3:0] value;
    shift_register4 core(
        clk, reset, press, switches[7], value
    );
    assign led = {4'b0000, value};
endmodule