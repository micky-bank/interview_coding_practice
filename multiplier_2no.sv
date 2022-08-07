module multiplier_top(
  input clk,
  input rst_n,
  input [14:0] data_in1,
  input [14:0] data_in2,
  output reg en,
  output logic [29:0] out_int1,
  output logic [29:0] out_int2,
  output reg [29:0] data_out
);
  
//  logic en;
//  logic [29:0]out_int1, out_int2;
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      en <= 1'b0;
    end
    else begin
      en <= !en;
    end
  end
  
  multiplier_2no dut1 (.clk(clk),
                       .rst_n(rst_n),
                       .en(en),
                       .data_in1(data_in1),
                       .data_in2(data_in2),
                       .data_out(out_int1)
                      );
  
  multiplier_2no dut2 (.clk(clk),
                       .rst_n(rst_n),
                       .en(!en),
                       .data_in1(data_in1),
                       .data_in2(data_in2),
                       .data_out(out_int2)
                      );
  
  assign data_out = en ? out_int2 : out_int1;
  
endmodule
  

module multiplier_2no (
  input clk,
  input rst_n,
  input en,
  input [14:0] data_in1,
  input [14:0] data_in2,
  output reg [29:0] data_out
);
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      data_out <= '0;
    end
    else begin
      if(en == 1'b1) begin
        data_out <= data_in1 * data_in2;
      end
    end
  end
  
endmodule
      