`timescale 1ns/1ps

module lab2_register #(parameter integer STABLE_CYCLES = 20) (

    input wire clk, input wire rst, input wire button, input wire [7:0] sw,
    output wire [7:0] led

);

    wire reset; wire press; wire [7:0] switches;

    input_frontend #(
        .STABLE_CYCLES(STABLE_CYCLES)
    ) inputs (
        clk,
        rst,
        button,
        sw,
        reset,
        press,
        switches
    );

    wire [3:0] stored;
    wire [3:0] value;

    register_pair core(
        clk,
        reset,
        press && switches[0],
        press && switches[1],
        switches[7:4],
        stored,
        value
    );

    assign led = {stored, value};

endmodule