module err_priority( input clk,
                     input rst_n,
                     input [31:0] err_in,
                     input [4:0] cfg_reg [31:0],
                    output logic [31:0] err_out);
  
  logic [31:0] one_hot_cfg_reg[31:0];
  logic [31:0] bit_cfg_reg [31:0];
  logic [31:0] err_out_priority [31:0];
  
  genvar i;
  generate
    for(i =0; i<32; i=i+1)
    one_hot one_hot_dut (.cfg_reg(cfg_reg[i]),
                            .one_hot_cfg_reg(one_hot_cfg_reg[i]));
  endgenerate
                            
  genvar j;
  generate
    for(j=0; j<32; j=j+1)
       
      assign bit_cfg_reg[j] = {one_hot_cfg_reg[31][j],
                               one_hot_cfg_reg[30][j],
                               one_hot_cfg_reg[29][j],
                               one_hot_cfg_reg[28][j],
                               one_hot_cfg_reg[27][j],
                               one_hot_cfg_reg[26][j],
                               one_hot_cfg_reg[25][j],
                               one_hot_cfg_reg[24][j],
                               one_hot_cfg_reg[23][j],
                               one_hot_cfg_reg[22][j],
                               one_hot_cfg_reg[21][j],
                               one_hot_cfg_reg[20][j],
                               one_hot_cfg_reg[19][j],
                               one_hot_cfg_reg[18][j],
                               one_hot_cfg_reg[17][j],
                               one_hot_cfg_reg[16][j],
                               one_hot_cfg_reg[15][j],
                               one_hot_cfg_reg[14][j],
                               one_hot_cfg_reg[13][j],
                               one_hot_cfg_reg[12][j],
                               one_hot_cfg_reg[11][j],
                               one_hot_cfg_reg[10][j],
                               one_hot_cfg_reg[9][j],
                               one_hot_cfg_reg[8][j],
                               one_hot_cfg_reg[7][j],
                               one_hot_cfg_reg[6][j],
                               one_hot_cfg_reg[5][j],
                               one_hot_cfg_reg[4][j],
                               one_hot_cfg_reg[3][j],
                               one_hot_cfg_reg[2][j],
                               one_hot_cfg_reg[1][j],
                               one_hot_cfg_reg[0][j]};
  endgenerate
                            
  genvar k;
  generate 
    for(k=0; k<32; k=k+1)
      err_check err_check (.bit_cfg_reg(bit_cfg_reg[k]),
                              .err(err_in),
                              .err_out(err_out_priority[k])
                             );
  endgenerate
                            
  
 always_ff @(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
     err_out <= '0;
   end
   else begin
     if(|err_out_priority[31])
       err_out <= err_out_priority[31];
     else if(|err_out_priority[30])
       err_out <= err_out_priority[30];
     else if(|err_out_priority[29])
       err_out <= err_out_priority[29];
     else if(|err_out_priority[28])
       err_out <= err_out_priority[28];
     else if(|err_out_priority[27])
       err_out <= err_out_priority[27];
     else if(|err_out_priority[26])
       err_out <= err_out_priority[26];
     else if(|err_out_priority[25])
       err_out <= err_out_priority[25];
     else if(|err_out_priority[24])
       err_out <= err_out_priority[24];
     else if(|err_out_priority[23])
       err_out <= err_out_priority[23];
     else if(|err_out_priority[22])
       err_out <= err_out_priority[22];
     else if(|err_out_priority[21])
       err_out <= err_out_priority[21];
     else if(|err_out_priority[20])
       err_out <= err_out_priority[20];
     else if(|err_out_priority[19])
       err_out <= err_out_priority[19];
     else if(|err_out_priority[18])
       err_out <= err_out_priority[18];
     else if(|err_out_priority[17])
       err_out <= err_out_priority[17];
     else if(|err_out_priority[16])
       err_out <= err_out_priority[16];
     else if(|err_out_priority[15])
       err_out <= err_out_priority[15];
     else if(|err_out_priority[14])
       err_out <= err_out_priority[14];
     else if(|err_out_priority[13])
       err_out <= err_out_priority[13];
     else if(|err_out_priority[12])
       err_out <= err_out_priority[12];
     else if(|err_out_priority[11])
       err_out <= err_out_priority[11];
     else if(|err_out_priority[10])
       err_out <= err_out_priority[10];
     else if(|err_out_priority[9])
       err_out <= err_out_priority[9];
     else if(|err_out_priority[8])
       err_out <= err_out_priority[8];
     else if(|err_out_priority[7])
       err_out <= err_out_priority[7];
     else if(|err_out_priority[6])
       err_out <= err_out_priority[6];
     else if(|err_out_priority[5])
       err_out <= err_out_priority[5];
     else if(|err_out_priority[4])
       err_out <= err_out_priority[4];
     else if(|err_out_priority[3])
       err_out <= err_out_priority[3];
     else if(|err_out_priority[2])
       err_out <= err_out_priority[2];
     else if(|err_out_priority[1])
       err_out <= err_out_priority[1];
     else if(|err_out_priority[0])
       err_out <= err_out_priority[1];
     else 
       err_out <= '0;
   end
 end
                        
  
endmodule

module one_hot (input [4:0]cfg_reg,
                output logic [31:0] one_hot_cfg_reg);
  
  always_comb begin
    case(cfg_reg)
      0 : one_hot_cfg_reg = 32'h0000_0001;
      1 : one_hot_cfg_reg = 32'h0000_0002;
      2 : one_hot_cfg_reg = 32'h0000_0004;
      3 : one_hot_cfg_reg = 32'h0000_0008;
      4 : one_hot_cfg_reg = 32'h0000_0010;
      5 : one_hot_cfg_reg = 32'h0000_0020;
      6 : one_hot_cfg_reg = 32'h0000_0040;
      7 : one_hot_cfg_reg = 32'h0000_0080;
      8 : one_hot_cfg_reg = 32'h0000_0100;
      9 : one_hot_cfg_reg = 32'h0000_0200;
      10 : one_hot_cfg_reg = 32'h0000_0400;
      11 : one_hot_cfg_reg = 32'h0000_0800;
      12 : one_hot_cfg_reg = 32'h0000_1000;
      13 : one_hot_cfg_reg = 32'h0000_2000;
      14 : one_hot_cfg_reg = 32'h0000_4000;
      15 : one_hot_cfg_reg = 32'h0000_8000;
      16 : one_hot_cfg_reg = 32'h0001_0000;
      17 : one_hot_cfg_reg = 32'h0002_0000;
      18 : one_hot_cfg_reg = 32'h0004_0000;
      19 : one_hot_cfg_reg = 32'h0008_0000;
      20 : one_hot_cfg_reg = 32'h0010_0000;
      21 : one_hot_cfg_reg = 32'h0020_0000;
      22 : one_hot_cfg_reg = 32'h0040_0000;
      23 : one_hot_cfg_reg = 32'h0080_0000;
      24 : one_hot_cfg_reg = 32'h0100_0000;
      25 : one_hot_cfg_reg = 32'h0200_0000;
      26 : one_hot_cfg_reg = 32'h0400_0000;
      27 : one_hot_cfg_reg = 32'h0800_0000;
      28 : one_hot_cfg_reg = 32'h1000_0000;
      29 : one_hot_cfg_reg = 32'h2000_0000;
      30 : one_hot_cfg_reg = 32'h4000_0000;
      31 : one_hot_cfg_reg = 32'h8000_0000;
    endcase
  end
endmodule
                            
                            module err_check (input [31:0]bit_cfg_reg,
                                              input [31:0]err,
                                              output logic [31:0]err_out);
                              
                              always_comb begin
                                err_out = '0;
                                case(1'b1) 
                                  bit_cfg_reg[0]: if(err[0]) err_out= 32'h0000_0001;
                                  bit_cfg_reg[1]: if(err[1]) err_out= 32'h0000_0002;
                                  bit_cfg_reg[2]: if(err[2]) err_out= 32'h0000_0004;
                                  bit_cfg_reg[3]: if(err[3]) err_out= 32'h0000_0008;
                                  bit_cfg_reg[4]: if(err[4]) err_out= 32'h0000_0010;
                                  bit_cfg_reg[5]: if(err[5]) err_out= 32'h0000_0020;
                                  bit_cfg_reg[6]: if(err[6]) err_out= 32'h0000_0040;
                                  bit_cfg_reg[7]: if(err[7]) err_out= 32'h0000_0080;
                                  bit_cfg_reg[8]: if(err[8]) err_out= 32'h0000_0100;
                                  bit_cfg_reg[9]: if(err[9]) err_out= 32'h0000_0200;
                                  bit_cfg_reg[10]: if(err[10]) err_out= 32'h0000_0400;
                                  bit_cfg_reg[11]: if(err[11]) err_out= 32'h0000_0800;
                                  bit_cfg_reg[12]: if(err[12]) err_out= 32'h0000_1000;
                                  bit_cfg_reg[13]: if(err[13]) err_out= 32'h0000_2000;
                                  bit_cfg_reg[14]: if(err[14]) err_out= 32'h0000_4000;
                                  bit_cfg_reg[15]: if(err[15]) err_out= 32'h0000_8000;
                                  bit_cfg_reg[16]: if(err[16]) err_out= 32'h0001_0000;
                                  bit_cfg_reg[17]: if(err[17]) err_out= 32'h0002_0000;
                                  bit_cfg_reg[18]: if(err[18]) err_out= 32'h0004_0000;
                                  bit_cfg_reg[19]: if(err[19]) err_out= 32'h0008_0000;
                                  bit_cfg_reg[20]: if(err[20]) err_out= 32'h0010_0000;
                                  bit_cfg_reg[21]: if(err[21]) err_out= 32'h0020_0000;
                                  bit_cfg_reg[22]: if(err[22]) err_out= 32'h0040_0000;
                                  bit_cfg_reg[23]: if(err[23]) err_out= 32'h0080_0000;
                                  bit_cfg_reg[24]: if(err[24]) err_out= 32'h0100_0000;
                                  bit_cfg_reg[25]: if(err[25]) err_out= 32'h0200_0000;
                                  bit_cfg_reg[26]: if(err[26]) err_out= 32'h0400_0000;
                                  bit_cfg_reg[27]: if(err[27]) err_out= 32'h0800_0000;
                                  bit_cfg_reg[28]: if(err[28]) err_out= 32'h1000_0000;
                                  bit_cfg_reg[29]: if(err[29]) err_out= 32'h2000_0000;
                                  bit_cfg_reg[30]: if(err[30]) err_out= 32'h4000_0000;
                                  bit_cfg_reg[31]: if(err[31]) err_out= 32'h8000_0000;
                                endcase
                              end
                                  
                       endmodule