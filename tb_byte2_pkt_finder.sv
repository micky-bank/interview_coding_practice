module tb_byte2_pkt_finder();
  reg clk;
  reg rst_n;
  bit [255:0] data_in;
//  reg req1, req2;
//  reg req3, req4;
  logic [15:0] byte2_pkt;
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
    @(posedge clk)
    #0;
    rst_n = 1'b1;
    @(posedge clk)
    #0;
    data_in = 256'h 00ff_0000_00ff_0003_08ff_1111_1234_ce10_1234_000f_08ff_1111_1234_ce10_1234_000f;
    @(posedge clk)
    #0;
    data_in = 256'h 00ff_0002_00ff_0003_08ff_1111_1234_ce10_1234_000f_08ff_1111_123f_ce10_1230_000f;
 
  end
  
  byte2_pkt_finder dut (.clk(clk),
               .rst_n(rst_n),
              .data_in(data_in),
              .byte2_pkt(byte2_pkt)
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
