module top(
    input wire ctrl_w,
    input wire ctrl_r,
    input wire [3:0] address,
    input wire [3:0] data_in,
    output wire [7:0] led_out
);

wire ram_cs;
wire ram_oe;
wire ram_we;
wire [17:0] ram_address;
wire [15:0] ram_data;

sram U0(
    .ctrl_w(ctrl_w),
    .ctrl_r(ctrl_r),
    .address(address),
    .data_in(data_in),
    .ram_cs(ram_cs),
    .ram_oe(ram_oe),
    .ram_we(ram_we),
    .ram_address(ram_address),
    .ram_data(ram_data),
    .led_out(led_out)
);

endmodule