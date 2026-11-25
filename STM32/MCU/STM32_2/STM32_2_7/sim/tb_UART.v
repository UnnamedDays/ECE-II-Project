`timescale 1ns / 1ps

module tb_uart;

reg clk;
reg rx;

wire tx;
wire led;

top DUT(
    .clk(clk),
    .rx(rx),
    .tx(tx),
    .led(led)
);

initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

parameter BIT_TIME = 104160;

task uart_send;
    input [7:0] data;
    integer i;
begin
    rx = 1'b0;
    #(BIT_TIME);

    for(i=0;i<8;i=i+1)
    begin
        rx = data[i];
        #(BIT_TIME);
    end

    rx = 1'b1;
    #(BIT_TIME);
end
endtask

initial begin

    $dumpfile("uart_led.vcd");
    $dumpvars(0, tb_uart);

    rx = 1'b1;

    #1000000;

    uart_send(8'h31);

    #2000000;

    uart_send(8'h30);

    #2000000;

    uart_send(8'h32);

    #2000000;

    uart_send(8'h32);

    #5000000;

    $finish;
end

endmodule