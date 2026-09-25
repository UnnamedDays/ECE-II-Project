`timescale 1ns/1ps

module lab2_clock_divider #(parameter integer STABLE_CYCLES = 20,
                            DIVISOR = 1000) (

    input wire clk,
    input wire rst,
    input wire button,
    input wire [7:0] sw,
    output wire [7:0] led

);

    wire reset, press;
    wire [7:0] switches;

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

    wire divided;
    wire tick;
    wire div2;
    wire div10;
    wire div50;

    clock_divider #(
        .DIVISOR(2)
    ) ratio2 (
        .clk(clk),
        .rst(reset),
        .divided(div2),
        .tick()
    );

    clock_divider #(
        .DIVISOR(10)
    ) ratio10 (
        .clk(clk),
        .rst(reset),
        .divided(div10),
        .tick()
    );

    clock_divider #(
        .DIVISOR(50)
    ) ratio50 (
        .clk(clk),
        .rst(reset),
        .divided(div50),
        .tick()
    );

    clock_divider #(
        .DIVISOR(DIVISOR)
    ) core (
        .clk(clk),
        .rst(reset),
        .divided(divided),
        .tick(tick)
    );

    assign led = {3'b000, tick, divided, div50, div10, div2};

endmodule