module tb_one_hot();
  reg clk;
  reg rst_n;
  reg [15:0] data_in;
//  reg req1, req2;
//  reg req3, req4;
  logic [3:0] out;
  //logic [1:0] state_out;
  
  always begin
    clk=1'b0;
    #5
    clk = 1'b1;
    #5;
    clk = 1'b0;
  end
  
  initial begin
    rst_n=1'b0;
    #2;
    rst_n = 1'b0;
    #12;
    rst_n = 1'b1;
    #20;
    data_in = 16'h4;
    #10;
    data_in = 16'h10;
    #10;
    data_in = 16'h02;
 
  end
  
  one_hot #(.N(4)) dut (.clk(clk),
               .rst_n(rst_n),
                        .data_in(data_in),
               .out(out)
               // .state_out(state_out)
               );
  
   initial begin
    $dumpfile ("dump.vcd"); 
     $dumpvars (2);
    #500;
    $finish;
  end
  
endmodule