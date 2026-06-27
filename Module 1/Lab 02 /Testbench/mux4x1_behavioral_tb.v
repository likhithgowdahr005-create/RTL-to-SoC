`timescale 1ns/1ps
module mux4x1_behavioral_tb;

  reg [3:0] in;
  reg [1:0] sel;
  wire out;

  mux4x1_behavioral uut (
     .in(in),
     .sel(sel),
     .out(out)
);

initial begin
   $display("BEHAVIORAL 4x1 MUX TEST");
   $display("------------------------");
   $display("SEL | IN     | OUT");
   in = 4'b1010;
   sel = 2'b00; #10 $display("%b  | %b | %b",  sel, in, out);
   sel = 2'b01; #10 $display("%b  | %b | %b",  sel, in, out);
   sel = 2'b10; #10 $display("%b  | %b | %b",  sel, in, out);
   sel = 2'b11; #10 $display("%b  | %b | %b",  sel, in, out);
   $finish;
end

initial begin
  $dumpfile("mux4x1_behavioral.vcd");
  $dumpvars(0, mux4x1_behavioral_tb);

end
endmodule


