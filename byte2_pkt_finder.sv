module byte2_pkt_finder(input clk,
                        input rst_n,
                        input [255:0] data_in,
                        output logic [15:0] byte2_pkt);
  
  logic [1:0]pkt_indi[15:0];
  logic [15:0] and_val;
  logic [15:0] valid;
  
  genvar i;
  generate
    for(i=0; i<16; i=i+1) begin: pkt_indicator
      assign pkt_indi[i] = data_in[16*i+1:16*i];
      assign and_val[i]  = & pkt_indi[i];
    end
  endgenerate
  
  always_comb begin
    valid[0] = 1'b1;
    for(int i=1; i<16; i++) begin
      if(valid[i-1] == 1'b0)
        valid[i] = 1'b1;
      else 
        valid[i] = and_val[i-1];
    end
  end
  
  always_ff@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      byte2_pkt <= '0;
    end
    else begin
      byte2_pkt <= valid & and_val;
    end
  end
endmodule
