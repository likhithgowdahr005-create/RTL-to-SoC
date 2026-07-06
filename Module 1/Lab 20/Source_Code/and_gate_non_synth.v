module and_gate_non_synth (
input a,
input b,
output reg y
);

initial begin
y = 0;
end

always @(a or b) begin
#5 y = a & b;
end

always @(y) begin
$display("TIME=0%t : a=%b b=%b y=%b", $time, a, b, y);
end

initial begin
#120;
$display("Simualtion Finished");
$finish;
end
endmodule


