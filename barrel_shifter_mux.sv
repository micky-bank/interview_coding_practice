module barrel_shifter_mux #(
  parameter BUSWIDTH=32,
  parameter SHIFTWIDTH=5)
  ( input [BUSWIDTH-1:0] data_in,
  input clk,
  input rst_n,
  input rotation,
  input direction,
  input [SHIFTWIDTH-1:0] shift_val,
   output reg [BUSWIDTH-1:0] data_out
//   output logic [BUSWIDTH-1 :0] debug_out_int,
//   output logic [BUSWIDTH-1 :0] debug_rotate_out_int,
//   output logic [BUSWIDTH-1 :0] debug_comp_rotate_out_int,
//   output logic [SHIFTWIDTH-1:0] comp_shift_val
);
  
  logic [BUSWIDTH-1 :0] out_int[SHIFTWIDTH:0];
  logic [BUSWIDTH-1 :0] rotate_out_int[SHIFTWIDTH:0];
  logic [BUSWIDTH-1 :0] comp_rotate_out_int[SHIFTWIDTH:0];
  logic [SHIFTWIDTH-1:0] comp_shift_val;
  
  assign out_int[SHIFTWIDTH] = data_in;
  assign rotate_out_int[SHIFTWIDTH] = data_in;
  assign comp_rotate_out_int[SHIFTWIDTH] = data_in;
  
//  assign debug_out_int= out_int[0];
//  assign debug_rotate_out_int = rotate_out_int[0];
//  assign debug_comp_rotate_out_int = comp_rotate_out_int[0];
  
  always_comb begin
    if(rotation ==0 && direction == 1) begin
      for(int i=SHIFTWIDTH-1; i>=0; i--) begin
        if(shift_val[i] == 1)
          out_int[i] = out_int[i+1] >> 2**i;
        else
          out_int[i] = out_int[i+1];
      end
    end
    else if(rotation ==0 && direction == 0) begin
      for(int i=SHIFTWIDTH-1; i>=0; i--) begin
        if(shift_val[i] == 1)
          out_int[i] = out_int[i+1] << 2**i;
        else
          out_int[i] = out_int[i+1];
      end
    end
    else if(rotation ==1 && direction == 0) begin
      for(int i=SHIFTWIDTH-1; i>=0; i--) begin
        if(shift_val[i] == 1)
          rotate_out_int[i] = rotate_out_int[i+1] << 2**i;
        else
          rotate_out_int[i] = rotate_out_int[i+1];
      end
      comp_shift_val = 2**SHIFTWIDTH - shift_val;
      for(int i=SHIFTWIDTH-1; i>=0; i--) begin
        if(comp_shift_val[i] == 1)
          comp_rotate_out_int[i] = comp_rotate_out_int[i+1] >> 2**i;
        else
          comp_rotate_out_int[i] = comp_rotate_out_int[i+1];
      end
      out_int[0] = rotate_out_int[0] | comp_rotate_out_int[0];
    end
    else if(rotation ==1 && direction == 1) begin
      for(int i=SHIFTWIDTH-1; i>=0; i--) begin
        if(shift_val[i] == 1)
          rotate_out_int[i] = rotate_out_int[i+1] >> 2**i;
        else
          rotate_out_int[i] = rotate_out_int[i+1];
      end
      comp_shift_val = 2**SHIFTWIDTH - shift_val;
      for(int i=SHIFTWIDTH-1; i>=0; i--) begin
        if(comp_shift_val[i] == 1)
          comp_rotate_out_int[i] = comp_rotate_out_int[i+1] << 2**i;
        else
          comp_rotate_out_int[i] = comp_rotate_out_int[i+1];
      end
      out_int[0] = rotate_out_int[0] | comp_rotate_out_int[0];
    end
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      data_out <= '0;
    end
    else begin
      data_out <= out_int[0];
    end
  end
      
endmodule