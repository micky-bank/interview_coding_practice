module cubic_poly(
  input clk,
  input rst_n,
  input [3:0]x_in,
  input [3:0]k_in,
  output logic [11:0] cube,
  output logic valid_out);
  
  logic [3:0] x_inq, k_inq;
  logic [1:0] count;
  logic [7:0] mult_2stage;
  logic [11:0] mult_3stage;
  
  always_ff @(posedge clk or rst_n) begin
    if(!rst_n) begin
      x_inq <= '0;
      k_inq <= '0;
      count <= '0;
    end
    else begin
      x_inq <= x_in;
      k_inq <= k_in;
      count <= count + 1;
      if(count >= 2) 
        count <= 2'b10;
    end
  end
  
  always_ff @(posedge clk or rst_n) begin
    if(!rst_n) begin
      mult_2stage <= '0;
      mult_3stage <= '0;
    end
    else begin
      mult_2stage <= x_in * x_in;
      mult_3stage <= mult_2stage * x_inq;
    end
  end
  
  assign cube = mult_3stage + k_inq;
  assign valid_out = (count == 2'b10) ? 1'b1 : 1'b0;
  
endmodule