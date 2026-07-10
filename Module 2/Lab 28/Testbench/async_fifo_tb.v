`timescale 1ns/1ps
module async_fifo_tb;
   reg wr_clk = 0;
   reg rd_clk = 0;
   reg rst_n  = 0;
   reg       wr_en = 0;
   reg [7:0] wr_data = 0;
   wire      full;
   reg       rd_en = 0;
   wire [7:0] rd_data;
   wire empty;
  async_fifo uut  (
   .wr_clk(wr_clk), .wr_en(wr_en), .wr_data(wr_data),  .full(full), .rd_clk(rd_clk), .rd_en(rd_en), .rd_data(rd_data),
   .empty(empty), .rst_n(rst_n) 
);

always #4 wr_clk = ~wr_clk;
always #7 rd_clk = ~rd_clk;

initial begin
   $dumpfile("async_fifo.vcd");
   $dumpvars(0, async_fifo_tb);
   #5 rst_n = 1;
   repeat (4) begin
   @(posedge wr_clk);
   if (!full) begin
                 wr_en   <= 1;
                 wr_data <= wr_data + 1;
              end
           end
           wr_en <= 0;
           repeat (4) begin
              @(posedge rd_clk);
              if (!empty) rd_en <= 1;
              @(posedge rd_clk);
              rd_en <= 0;
           end
           #50 $finish;
       end
endmodule

