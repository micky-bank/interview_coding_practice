module one_hot #(parameter N=4)(
  input clk,
  input rst_n,
  input [2**N-1:0] data_in,
  output reg [N-1 : 0] out
);
  
  logic [N-1:0] data_out;
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      out <= '0;
    end
    else begin
      out <= data_out;
    end
  end
  
  always_comb begin
    for(int i=0; i<2**N; i++) begin
      if(data_in[i] == 1'b1)
        data_out = i;
    end
  end
  
endmodule
  