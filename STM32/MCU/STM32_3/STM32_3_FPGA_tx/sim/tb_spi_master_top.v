`timescale 1ns/1ps

module tb_spi_master_top;

reg clk;
reg rst_n;

wire spi_cs_n;
wire spi_sck;
wire spi_mosi;

spi_master_top DUT
(
    .clk(clk),
    .rst_n(rst_n),

    .spi_cs_n(spi_cs_n),
    .spi_sck(spi_sck),
    .spi_mosi(spi_mosi)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("spi_tx.vcd");
    $dumpvars(0, tb_spi_master_top);
end

initial
begin

    clk = 0;
    rst_n = 0;

    #100;

    rst_n = 1;

    #100000;

    $finish;

end

endmodule