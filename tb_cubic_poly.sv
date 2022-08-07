module tb_cubic_poly();
  bit clk;
  reg rst_n;
  reg [2:0] x_in;
  reg [2:0] k_in;
//  reg req1, req2;
//  reg req3, req4;
  logic valid_out;
  logic [8:0] cube;
 // logic [15:0]shift_out[3:0];
  //logic [1:0] state_out;
  /*
  always begin
    clk=1'b0;
    #5
    clk = 1'b1;
    #5;
    clk = 1'b0;
  end */
  
  initial begin
    	forever #5ns clk = ~clk;
  end
  
  initial begin
    @(posedge clk)
    rst_n=1'b0;
    @(posedge clk)
    rst_n = 1'b0;
    @(posedge clk)
    rst_n = 1'b1;
    x_in = 4'h4;
    k_in = 4'hf;
    @(posedge clk)
    x_in = 4'h9;
    k_in = 4'h1;
    @(posedge clk)
    x_in = 4'h2;
    k_in = 4'h3;
    @(posedge clk)
    x_in = 4'hf;
    k_in = 4'h1;
 
  end
  
  cubic_poly dut (.clk(clk),
               .rst_n(rst_n),
                  .x_in(x_in),
                  .k_in(k_in),
                  .cube(cube),
                  .valid_out(valid_out)
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