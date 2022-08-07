module tb_cubic_poly();
  reg clk;
  reg rst_n;
  reg [31:0] err_in;
  reg [4:0] cfg_reg [31:0];
//  reg req1, req2;
//  reg req3, req4;
  logic [31:0] err_out;
//  logic [8:0] cube;
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
    err_in = 32'hc18f0044;
    cfg_reg[0] = 5'd31;
    cfg_reg[1] = 5'd29;
    cfg_reg[2] = 5'd1;
    cfg_reg[3] = 5'd11;
    cfg_reg[4] = 5'd21;
    cfg_reg[5] = 5'd10;
    cfg_reg[6] = 5'd9;
    cfg_reg[7] = 5'd3;
    cfg_reg[8] = 5'd2;
    cfg_reg[9] = 5'd8;
    cfg_reg[10] = 5'd7;
    cfg_reg[11] = 5'd15;
    cfg_reg[12] = 5'd0;
    cfg_reg[13] = 5'd4;
    cfg_reg[14] = 5'd5;
    cfg_reg[15] = 5'd6;
    cfg_reg[16] = 5'd12;
    cfg_reg[17] = 5'd13;
    cfg_reg[18] = 5'd14;
    cfg_reg[19] = 5'd17;
    cfg_reg[20] = 5'd16;
    cfg_reg[21] = 5'd18;
    cfg_reg[22] = 5'd20;
    cfg_reg[23] = 5'd19;
    cfg_reg[24] = 5'd22;
    cfg_reg[25] = 5'd23;
    cfg_reg[26] = 5'd24;
    cfg_reg[27] = 5'd30;
    cfg_reg[28] = 5'd25;
    cfg_reg[29] = 5'd26;
    cfg_reg[30] = 5'd27;
    cfg_reg[31] = 5'd28;  
    
    @(posedge clk)
    err_in = 32'hc7e100ff;
    cfg_reg[0] = 5'd31;
    cfg_reg[1] = 5'd29;
    cfg_reg[2] = 5'd1;
    cfg_reg[3] = 5'd11;
    cfg_reg[4] = 5'd21;
    cfg_reg[5] = 5'd10;
    cfg_reg[6] = 5'd9;
    cfg_reg[7] = 5'd3;
    cfg_reg[8] = 5'd2;
    cfg_reg[9] = 5'd8;
    cfg_reg[10] = 5'd7;
    cfg_reg[11] = 5'd15;
    cfg_reg[12] = 5'd0;
    cfg_reg[13] = 5'd4;
    cfg_reg[14] = 5'd5;
    cfg_reg[15] = 5'd6;
    cfg_reg[16] = 5'd12;
    cfg_reg[17] = 5'd13;
    cfg_reg[18] = 5'd14;
    cfg_reg[19] = 5'd17;
    cfg_reg[20] = 5'd16;
    cfg_reg[21] = 5'd18;
    cfg_reg[22] = 5'd20;
    cfg_reg[23] = 5'd19;
    cfg_reg[24] = 5'd22;
    cfg_reg[25] = 5'd23;
    cfg_reg[26] = 5'd24;
    cfg_reg[27] = 5'd30;
    cfg_reg[28] = 5'd25;
    cfg_reg[29] = 5'd26;
    cfg_reg[30] = 5'd27;
    cfg_reg[31] = 5'd28;
 
  end
  
  err_priority dut (.clk(clk),
               .rst_n(rst_n),
                    .err_in(err_in),
                    .cfg_reg(cfg_reg),
           //       .cube(cube),
                    .err_out(err_out)
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