module top_spi_rx(

    input clk,
    input rst_n,

    input spi_cs_n,
    input spi_sck,
    input spi_mosi,

    output [7:0] rx_data,
    output rx_done
);

wire sck_rise;

edge_detector U_EDGE(
    .clk(clk),
    .rst_n(rst_n),
    .sig_in(spi_sck),
    .rise_tick(sck_rise)
);

spi_rx U_SPI_RX(
    .clk(clk),
    .rst_n(rst_n),

    .cs_n(spi_cs_n),
    .sck_rise(sck_rise),
    .mosi(spi_mosi),

    .rx_data(rx_data),
    .rx_done(rx_done)
);

endmodule