module max_no(input clk,
              input rst_n,
              input [3:0] data_in[3:0],
              output logic [3:0] max_out);
  
  logic [3:0] max_int[3:0];
    
  always_comb begin
    if(!rst_n) begin
      max_int[0] = '0;
      max_int[1] = '0;
      max_int[2] = '0;
      max_int[3] = '0;
    end
    else begin
      max_int[0] = data_in[0];
      for(int i=1; i<4; i++) begin
        if(data_in[i] >= max_int[i-1])
          max_int[i] = data_in[i];
        else
          max_int[i] = max_int[i-1];
      end
    end
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      max_out <= '0;
    end
    else begin
      max_out <= max_int[3];
    end
  end
endmodule
          
                                
    