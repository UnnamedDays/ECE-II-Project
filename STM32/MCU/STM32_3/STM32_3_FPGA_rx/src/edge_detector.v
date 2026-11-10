module edge_detector (
    input clk,
    input rst_n,
    input sig_in,

    output rise_tick
);

reg sig_d;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        sig_d <= 1'b0;
    else
        sig_d <= sig_in;
end

assign rise_tick = (~sig_d) & sig_in;

endmodule