module tb_arbiter5_2();
  bit clk;
  bit rst_n;
  bit [4:0] data_in;
  bit valid;
//  reg req1, req2;
//  reg req3, req4;
  logic [4:0] grant_out;
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
    #0;
    rst_n=1'b0;
    @(posedge clk)
    #0;
    rst_n = 1'b0;
    valid = 1'b0;
    @(posedge clk)
    #0;
    rst_n = 1'b1;
    valid = 1'b0;
    @(posedge clk)
    #0;
    data_in = 5'h1a;
    valid = 1'b1;
    @(posedge clk)
    #0;
    data_in = 5'h1a;
    valid = 1'b1;
    @(posedge clk)
    #0;
    data_in = 5'h15;
    valid = 1'b1;
    @(posedge clk)
    #0;
    data_in = 5'h15;
    valid = 1'b1;
    @(posedge clk)
    #0;
    data_in = 5'h17;
    valid = 1'b1;
    @(posedge clk)
    #0;
    data_in = 5'h17;
    valid = 1'b1;
    @(posedge clk)
    #0;
    data_in = 5'h1f;
    valid = 1'b1;
    @(posedge clk)
    #0;
    data_in = 5'h1f;
    valid = 1'b1;
    
  end
  
  arbiter5_2 dut (.clk(clk),
                  .rst_n(rst_n),
                  .req_in(data_in),
                  .valid(valid),
                  .grant_out(grant_out)
              );
  
   initial begin
    $dumpfile ("dump.vcd"); 
     $dumpvars (2);
    #500;
    $finish;
  end
  
endmodule
