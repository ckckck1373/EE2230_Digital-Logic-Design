`define FREQ_DIV_BIT 27 
`define SSD_SCAN_CTL_BIT_WIDTH 2
module freqdiv(
  clk_out,  // divided clock output
  clk_ctl,
  clk,  // global clock input
  rst_n  // active low reset
);

output [1:0]clk_ctl;  // divided output
output clk_out;
input clk;  // global clock input
input rst_n;  // active low reset

reg [1:0]clk_out; // clk output (in always block)
reg [`FREQ_DIV_BIT-2:0] cnt; // remainder of the counter
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; // input to dff (in always block)



assign clk_ctl = {cnt[16],cnt[15]};
// Combinational logics: increment, neglecting overflow 
always @*
  cnt_tmp = cnt + 1'b1;

// Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n) 
  {clk_out, cnt}<=`FREQ_DIV_BIT'd0;
  else if(cnt == 26'd50000000)
  begin
    cnt <= 26'd0;
    clk_out <= ~clk_out;
  end
  else 
  cnt <= cnt_tmp;
end

endmodule


