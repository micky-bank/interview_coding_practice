// Code your testbench here
// or browse Examples
module testbench();
  reg clk, rst_n;
  reg [14:0]data_in1, data_in2;
  reg [29:0] data_out;
  logic en;
  logic [29:0]out_int1, out_int2;
  
//  logic [15 :0] out_int;
//  logic [15 :0] rout;
//  logic [15 :0] crout;
//  logic [3:0] cshiftval;
  
  
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
  
  initial begin
    rst_n = 1'b0;
    #12;
    rst_n = 1'b1;
    #8;
    data_in1 = 15'h78ab;
    data_in2 = 15'h3200;
    #10;
    data_in1 = 15'h5ace;
    data_in2 = 15'h75ff;
    #10;
    data_in1 = 15'h231f;
    data_in2 = 15'h7310;
  end
  
/*  position_of_one dut (.clk(clk),
                       .rst_n(rst_n),
                       .data_in(data_in),
                       .first_one_found_out(out));*/
  
  multiplier_top                              dut (.clk(clk),
                                               .rst_n(rst_n),
                                               .data_in1(data_in1),
                                               .data_in2(data_in2),
                                                   
                                                   .en(en),
                                                   
                                                   .out_int1(out_int1),
                                                   
                                                   .out_int2(out_int2),
                                                   .data_out(data_out)
                                               );
  
  initial begin
    $dumpfile ("./dump.vcd"); 
    $dumpvars (1);
    #500;
    $finish;
  end
  
endmodule