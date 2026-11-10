`timescale 1ns/1ps

module tb_top_spi_rx;

reg clk;
reg rst_n;

reg spi_cs_n;
reg spi_sck;
reg spi_mosi;

wire [7:0] rx_data;
wire rx_done;

top_spi_rx DUT(
    .clk(clk),
    .rst_n(rst_n),

    .spi_cs_n(spi_cs_n),
    .spi_sck(spi_sck),
    .spi_mosi(spi_mosi),

    .rx_data(rx_data),
    .rx_done(rx_done)
);

always #5 clk = ~clk;

// =========================
// VCD(Wave) 생성
// =========================
initial
begin
    $dumpfile("spi_rx.vcd");
    $dumpvars(0, tb_top_spi_rx);
end

task spi_send_byte;
input [7:0] data;
integer i;

begin

    spi_cs_n = 0;

    for(i=7; i>=0; i=i-1)
    begin

        spi_mosi = data[i];

        #100;
        spi_sck = 1;

        #100;
        spi_sck = 0;

    end

    spi_cs_n = 1;

end
endtask

initial
begin

    clk      = 0;
    rst_n    = 0;

    spi_cs_n = 1;
    spi_sck  = 0;
    spi_mosi = 0;

    #100;

    rst_n = 1;

    #100;

    // MCU TX = 0x55
    spi_send_byte(8'h55);

    #500;

    // MCU TX = 0xA5
    spi_send_byte(8'hA5);

    #1000;

    $display("RX DATA = %h", rx_data);

    $finish;

end

endmodule