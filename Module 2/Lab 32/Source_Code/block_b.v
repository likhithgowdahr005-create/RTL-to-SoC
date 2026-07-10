module block_b (
  input rd_clk,
  input rd_rst,
  input rd_empty,
  input [7:0] rd_data,
  output reg rd_en
);
  always @(posedge rd_clk or posedge rd_rst) begin
    if (rd_rst) begin
      rd_en <= 0;
    end else begin
      rd_en <= !rd_empty;
    end
  end
endmodule

