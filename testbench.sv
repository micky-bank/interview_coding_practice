// Code your testbench here
// or browse Examples
module testbench();
  reg clk, rst_n;
  reg [15:0]data_in, out;
  reg [3:0] shift_val;
  reg rotation;
  reg direction;
  
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
    #5;
    data_in = 16'h88ab;
    shift_val = 'h1;
    rotation = 1'b1;
    direction = 1'b0;
    #10;
    data_in = 16'h9126;
    shift_val = 'h8;
    rotation = 1'b1;
    direction = 1'b1;
    #10;
    data_in = 16'h3124;
    shift_val = 'h2;
    rotation = 1'b0;
    direction = 1'b0;
    #10;
    data_in = 16'h29ce;
    shift_val = 'ha;
    rotation = 1'b0;
    direction = 1'b1;
  end
  
/*  position_of_one dut (.clk(clk),
                       .rst_n(rst_n),
                       .data_in(data_in),
                       .first_one_found_out(out));*/
  
  barrel_shifter_mux #(.BUSWIDTH(16), .SHIFTWIDTH(4)) dut (.clk(clk),
                                               .rst_n(rst_n),
                                               .data_in(data_in),
                                               .rotation(rotation),
                                               .direction(direction),
                                               .shift_val(shift_val),
                                               .data_out(out)
                                               );
  
  initial begin
    $dumpfile ("./dump.vcd"); 
    $dumpvars (1);
    #500;
    $finish;
  end
  
endmodule