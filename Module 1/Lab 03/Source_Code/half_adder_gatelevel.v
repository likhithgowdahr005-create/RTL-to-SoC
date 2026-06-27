`timescale 1ns/1ps
module half_adder_gatelevel(
 input a,
 input b,
 output sum,
output carry
);

xor u1(sum, a, b);
and u2(carry, a, b);

endmodule

