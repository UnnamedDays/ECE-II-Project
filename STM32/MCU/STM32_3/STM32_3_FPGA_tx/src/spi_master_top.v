module spi_master_top(

    input clk,
    input rst_n,

    output spi_cs_n,
    output spi_sck,
    output spi_mosi
);

reg start;
reg [31:0] timer;

wire tx_done;

spi_tx #(
    .CLK_DIV(50)
)
U_TX
(
    .clk(clk),
    .rst_n(rst_n),

    .start(start),
    .tx_data(8'h55),

    .spi_cs_n(spi_cs_n),
    .spi_sck(spi_sck),
    .spi_mosi(spi_mosi),

    .tx_done(tx_done)
);

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        timer <= 0;
        start <= 0;
    end
    else
    begin
        start <= 0;

        if(timer == 32'd1000)
        begin
            timer <= 0;
            start <= 1;
        end
        else
            timer <= timer + 1;
    end
end

endmodule