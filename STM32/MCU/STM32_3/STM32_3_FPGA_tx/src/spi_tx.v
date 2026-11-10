module spi_tx
#(
    parameter CLK_DIV = 50
)
(
    input clk,
    input rst_n,

    input start,
    input [7:0] tx_data,

    output reg spi_cs_n,
    output reg spi_sck,
    output reg spi_mosi,

    output reg tx_done
);

reg [7:0] shift_reg;
reg [2:0] bit_cnt;

reg [15:0] clk_cnt;

reg [2:0] state;

localparam IDLE  = 3'd0;
localparam LOAD  = 3'd1;
localparam SHIFT = 3'd2;
localparam DONE  = 3'd3;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        state <= IDLE;

        spi_cs_n <= 1'b1;
        spi_sck  <= 1'b0;
        spi_mosi <= 1'b0;

        tx_done  <= 1'b0;

        shift_reg <= 8'd0;
        bit_cnt   <= 3'd0;
        clk_cnt   <= 16'd0;
    end
    else
    begin
        tx_done <= 1'b0;

        case(state)

        IDLE:
        begin
            spi_cs_n <= 1'b1;
            spi_sck  <= 1'b0;

            if(start)
                state <= LOAD;
        end

        LOAD:
        begin
            spi_cs_n <= 1'b0;

            shift_reg <= tx_data;
            bit_cnt   <= 3'd7;

            spi_mosi <= tx_data[7];

            clk_cnt <= 16'd0;

            state <= SHIFT;
        end

        SHIFT:
        begin
            clk_cnt <= clk_cnt + 1'b1;

            if(clk_cnt == CLK_DIV-1)
            begin
                clk_cnt <= 0;

                spi_sck <= ~spi_sck;

                if(spi_sck)
                begin
                    if(bit_cnt == 0)
                    begin
                        state <= DONE;
                    end
                    else
                    begin
                        shift_reg <= {shift_reg[6:0],1'b0};
                        bit_cnt <= bit_cnt - 1'b1;

                        spi_mosi <= shift_reg[6];
                    end
                end
            end
        end

        DONE:
        begin
            spi_cs_n <= 1'b1;
            spi_sck  <= 1'b0;

            tx_done <= 1'b1;

            state <= IDLE;
        end

        endcase
    end
end

endmodule