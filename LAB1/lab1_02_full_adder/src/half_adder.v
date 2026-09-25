module half_adder(
    input a,
    input b,
    output s,
    output c
);

assign s = a ^ b; // Sum output
assign c = a & b; // Carry output

endmodule
