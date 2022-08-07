module running_avg #(parameter N=4)(input clk,
                   input rst_n,
                   input [15:0] data_in,
                   output reg [15:0] avg_out,
                   output reg valid
                   );
  
  logic [15:0]shift_out[N-1:0];
  logic [15:0] shift0,shift1,shift2,shift3;
  int count;
  logic [17:0] sum;
  
  assign shift0 = shift_out[0];
  assign shift1 = shift_out[1];
  assign shift2 = shift_out[2];
  assign shift3 = shift_out[3];
  
  always_ff @(posedge clk or rst_n) begin
    if(!rst_n) begin
      for(int i=0; i<N; i++)
        shift_out[i] <= '0;
    end
    else begin
      shift_out <= {shift_out[N-2:0],data_in[15:0]};
    end
  end
  
  always_ff @(posedge clk or rst_n) begin
    if(!rst_n) begin
      avg_out <= '0;
      valid   <= '0;
      count   <= '0;
      sum     <= '0;
    end
    else begin
      sum     <= sum + data_in - shift_out[N-1];
      avg_out <= sum/N;
      count   <= count+1;
      if(count >= N) begin
        count <= N;
        valid <= 1'b1;
      end
    end
  end
      
endmodule