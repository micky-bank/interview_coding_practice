module barrel_shifter 
  #(parameter BUSWIDTH=32,
    parameter SHIFTWIDTH=5) (
  input [BUSWIDTH-1:0] data_in,
  input clk,
  input rst_n,
  input rotation,
  input direction,
  input [SHIFTWIDTH-1:0] shift_val,
  output reg [BUSWIDTH-1:0] data_out
);
  
  logic [BUSWIDTH-1] out;
  
  always_comb begin
    if(rotation == 1'b0) begin
      if(direction == 1'b0) begin
        for(int i=0; i<=BUSWIDTH-1; i++) begin
          if(i<shift_val)
            out[i] = 1'b0;
          else
            out[i] = data_in[i-shift_val];
        end
      end
      else begin
        for(int i=BUSWIDTH-1; i>=0; i--) begin
          if(i>= BUSWIDTH - shift_val)
            out[i] = 1'b0;
          else
            out[i] = data_in[i+shift_val];
        end
      end
    end
    else begin
      if(direction == 1'b0) begin
        for(int i=0; i<=BUSWIDTH-1; i++) begin
          if(i<=shift_val)
            out[i] = data_in[BUSWIDTH-shift_val];
          else
            out[i] = data_in[i-shift_val];
      	end
      end
      else begin
        for(int i=BUSWIDTH-1; i>=0; i--) begin
          if(i+shift_val <BUSWIDTH)
            out[i] = data_in[i+shift_val];
          else
            out[i] = data_in[i+shift_val-BUSWIDTH];
        end
      end
    end
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      data_out <= '0;
    end
    else begin
      data_out <= out;
    end
  end
  
endmodule
      
        