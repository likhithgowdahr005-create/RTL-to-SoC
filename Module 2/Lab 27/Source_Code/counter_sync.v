module counter_sync (
    input wire clk,
    input wire rst_sync,
    output reg [3:0] count
);
  always @ (posedge clk) begin
  if (rst_sync)
         count <= 4'd0;
  else 
         count <= count +1;
  end
endmodule 

