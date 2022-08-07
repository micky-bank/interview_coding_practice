module multiplier(
  input clk,
  input rst_n,
  input [14:0] data_in1,
  input [14:0] data_in2,
  input [14:0] data_in3,
  input [14:0] data_in4,
  output reg [59:0] data_out
);
  
  logic [29:0] product1n2; 
  logic [44:0] product12n3;
  
  always_comb begin
    product1n2 = data_in1 * data_in2;
  end
  
  always_ff @(posedge clk or negedge rst_n) 
    begin
      if(!rst_n) begin
        product12n3 <= '0;
        data_out <= '0;
      end
      else begin
        product12n3 <= product1n2 * data_in3;
        data_out <= product12n3 * data_in4;
      end
    end
  
endmodule