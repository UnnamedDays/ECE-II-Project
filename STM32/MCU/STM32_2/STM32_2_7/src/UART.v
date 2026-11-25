module top(
    input clk,
    input rx,
    output tx,
    output led
);

wire [7:0] rx_data;
wire rx_done;

reg led_reg;

assign led = led_reg;

/* UART RX, TX 인스턴스 */
/* 기존 코드 그대로 */

always @(posedge clk)
begin
    if (rx_done)
    begin
        case (rx_data)

            8'h30:
                led_reg <= 1'b0;

            8'h31:
                led_reg <= 1'b1;

            8'h32:
                led_reg <= ~led_reg;

            default:
                led_reg <= led_reg;

        endcase
    end
end

endmodule