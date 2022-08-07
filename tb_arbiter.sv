module tb_arbiter();
  reg clk;
  reg rst_n;
  reg req1, req2, req3, req4, req5, req6, req7, req8;
//  reg req1, req2;
//  reg req3, req4;
  logic [7:0] grant_out;
  //logic [1:0] state_out;
  
  always begin
    clk=1'b0;
    #5
    clk = 1'b1;
    #5;
    clk = 1'b0;
  end
  
  initial begin
    req1=0;
    req2=0;
    rst_n=1'b0;
    #2;
    rst_n = 1'b0;
    #12;
    rst_n = 1'b1;
    #20;
    req1 = 0;
    req2 = 1;
    req3 = 1;
    req4 = 1;
    req5 = 1;
    req6 = 1;
    req7 = 1;
    req8 = 1;
    #10;
    req1 = 1;
    req2 = 0;
    req3 = 0;
    req4 = 0;
    req5 = 0;
    req6 = 0;
    req7 = 1;
    req8 = 0;
    #10;
    req1 = 1;
    req2 = 0;
    req3 = 0;
    req4 = 0;
    req5 = 0;
    req6 = 0;
    req7 = 1;
    req8 = 0;
    //req1=0;
    //req2=0;
    
    //req2 = 0;
    //req3 = 0;
    //req4 = 0;
/*    req5 = 1;
    req6 = 0;
    req7 = 1;
    req8 = 1;*/
  end
  
  arbiter dut (.clk(clk),
               .rst_n(rst_n),
               .req1(req1),
               .req2(req2),
               .req3(req3),
               .req4(req4),
               .req5(req5),
               .req6(req6),
               .req7(req7),
               .req8(req8),
                
               .grant_out(grant_out)
               // .state_out(state_out)
               );
  
   initial begin
    $dumpfile ("dump.vcd"); 
     $dumpvars (2);
    #500;
    $finish;
  end
  
endmodule