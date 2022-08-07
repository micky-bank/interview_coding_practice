module tb_cubic_poly();
  reg clk;
  reg rst_n;
  reg [3:0] data_in [3:0];
//  reg req1, req2;
//  reg req3, req4;
  logic [3:0] max_out;
 // logic [15:0]shift_out[3:0];
  //logic [1:0] state_out;
  
  always begin
    clk=1'b0;
    #5
    clk = 1'b1;
    #5;
    clk = 1'b0;
  end
  
  initial begin
    @(posedge clk)
    rst_n=1'b0;
    @(posedge clk)
    rst_n = 1'b0;
    @(posedge clk)
    rst_n = 1'b1;
    data_in[0] = 4'h8;
    data_in[1] = 4'h1;
    data_in[2] = 4'h9;
    data_in[3] = 4'h4;
    @(posedge clk)
    data_in[0] = 4'h8;
    data_in[1] = 4'h8;
    data_in[2] = 4'hc;
    data_in[3] = 4'h4;
    @(posedge clk)
    data_in[0] = 4'h0;
    data_in[1] = 4'h1;
    data_in[2] = 4'h1;
    data_in[3] = 4'h1;
 
  end
  
  max_no dut (.clk(clk),
               .rst_n(rst_n),
              .data_in(data_in),
              .max_out(max_out)
                   //         .shift_out(shift_out)
               // .state_out(state_out)
               );
  
   initial begin
    $dumpfile ("dump.vcd"); 
     $dumpvars (2);
    #500;
    $finish;
  end
  
endmodule