module tb_running_avg();
  reg clk;
  reg rst_n;
  reg [15:0] data_in;
//  reg req1, req2;
//  reg req3, req4;
  logic valid;
  logic [15:0] avg_out;
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
    rst_n=1'b0;
    #18;
    rst_n = 1'b0;
    #7;
    rst_n = 1'b1;
    data_in = 16'h04;
    #10;
    data_in = 16'h09;
    #10;
    data_in = 16'h02;
    #10;
    data_in = 16'h09;
    #10;
    data_in = 16'h02;
    #10;
    data_in = 16'h02;
    #10;
    data_in = 16'h09;
    #10;
    data_in = 16'h02;
 
  end
  
  running_avg #(.N(4)) dut (.clk(clk),
               .rst_n(rst_n),
                        .data_in(data_in),
                            .avg_out(avg_out),
                            .valid(valid)
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