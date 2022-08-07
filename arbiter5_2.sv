module arbiter5_2(input clk,
                  input rst_n,
                  input [4:0] req_in,
                  input valid,
                  output logic [4:0] grant_out);
  
  parameter [2:0] st0=3'b000, 
                  st1=3'b001, 
                  st2=3'b010, 
                  st3=3'b011, 
                  st4=3'b100;
  logic [4:0] req, grant1, grant2, grant;
  logic [2:0] present_state, next_state;
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      present_state <= st0;
      grant_out <= '0;
    end
    else begin
      present_state <= next_state;
      grant_out <= grant;
    end
  end
  
  always_comb begin
    next_state = '0;
    req = '0;
    grant = '0;
    case(present_state)
      st0: begin
        if(valid) begin
          req = req_in;
          grant = grant1 | grant2;
          next_state = st1;
        end
      end
      st1: begin
        if(valid) begin
          req = ((req_in >> 1) | (req_in << 4));
          grant = ((grant1 | grant2) <<1) | ((grant1 | grant2) >>4);
          next_state = st2;
      end
      end
      st2: begin
        if(valid) begin
          req = ((req_in >> 2) | (req_in << 3));
          grant = ((grant1 | grant2) <<2) | ((grant1 | grant2) >>3);
          next_state = st3;
      end
      end
      
      st3: begin
        if(valid) begin
          req = ((req_in >> 3) | (req_in << 2));
          grant = ((grant1 | grant2) <<3) | ((grant1 | grant2) >>2);
          next_state = st4;
        end
      end
      st4: begin
        if(valid) begin
          req = ((req_in >> 4) | (req_in << 1));
          grant = ((grant1 | grant2) <<4) | ((grant1 | grant2) >>1);
          next_state = st0;
        end
      end
      default: begin
        req ='0;
        grant = '0;
        next_state = st0;
      end
    endcase
  end
  
  first1_lsb dut0(.data_in(req),
                        .first_one(grant1));
  second1_lsb dut1(.data_in(req),
                         .second_one(grant2));
  
        
  
/*  generate
    case(present_state)
      st0: begin
 //       req = req_in;
        first1_lsb dut0(.data_in(req),
                        .first_one(grant1));
        second1_lsb dut1(.data_in(req),
                         .second_one(grant2));
 //       grant = grant1 | grant2;
 //       next_state = st1;
      end
      
      st1: begin
 //       req = ((req_in >> 1) | (req_in << 4));
        first1_lsb dut0(.data_in(req),
                        .first_one(grant1));
        second1_lsb dut1(.data_in(req),
                         .second_one(grant2));
 //       grant = grant1 | grant2;
 //       next_state = st2;
      end
      
      st2: begin
 //       req = ((req_in >> 2) | (req_in << 3));
        first1_lsb dut0(.data_in(req),
                        .first_one(grant1));
        second1_lsb dut1(.data_in(req),
                         .second_one(grant2));
 //       grant = grant1 | grant2;
 //       next_state = st3;
      end
      
      st3: begin
 //       req = ((req_in >> 3) | (req_in << 2));
        first1_lsb dut0(.data_in(req),
                        .first_one(grant1));
        second1_lsb dut1(.data_in(req),
                         .second_one(grant2));
 //       grant = grant1 | grant2;
 //       next_state = st4;
      end
      
      st4: begin
 //       req = ((req_in >> 4) | (req_in << 1));
        first1_lsb dut0(.data_in(req),
                        .first_one(grant1));
        second1_lsb dut1(.data_in(req),
                         .second_one(grant2));
 //       grant = grant1 | grant2;
 //       next_state = st0;
      end
      
      default: begin
        first1_lsb dut0(.data_in(req),
                        .first_one(grant1));
        second1_lsb dut1(.data_in(req),
                         .second_one(grant2));
      end
    endcase
  endgenerate*/
            
  
  
endmodule

module first1_lsb( input [4:0] data_in,
                  output logic [4:0] first_one);
  
  logic [4:0] first_one_found;
  
  always_comb begin
    first_one_found = '0;
    first_one = '0;
    for(int i=0; i<5; i++) begin
      if(i== 0) begin
        if(data_in[0]) begin
          first_one_found[0] = 1'b1;
          first_one[0] = 1'b1;
        end
        else begin
          first_one_found[0] = 1'b0;
          first_one[0] = 1'b0;
        end
      end
      else begin
        if(first_one_found[i-1]) begin
          first_one_found[i] = first_one_found[i-1];
          first_one[i] = 1'b0;
        end
        else begin
          if(data_in[i]) begin
            first_one_found[i] = 1'b1;
            first_one[i] = 1'b1;
          end
          else begin
            first_one_found[i] = 1'b0;
            first_one[i] = 1'b0;
          end
        end
      end
    end
  end
endmodule

module second1_lsb( input [4:0] data_in,
                   output logic [4:0] second_one);
  
  logic [4:0] first_one_found;
  logic [4:0] first_one;
  logic [4:0] second_one_found;
  
  always_comb begin
    first_one_found = '0;
    first_one = '0;
    second_one = '0;
    second_one_found = '0;
    for(int i=0; i<5; i++) begin
      if(i== 0) begin
        if(data_in[0]) begin
          first_one_found[0] = 1'b1;
          first_one[0] = 1'b1;
          second_one[0] = 1'b0;
          second_one_found = 1'b0;
        end
        else begin
          first_one_found[0] = 1'b0;
          first_one[0] = 1'b0;
          second_one[0] = 1'b0;
          second_one_found[0] = 1'b0;
        end
      end
      else begin
        if(first_one_found[i-1]) begin
          first_one_found[i] = first_one_found[i-1];
          first_one[i] = 1'b0;
          if(data_in[i] && !second_one_found[i-1]) begin
            second_one_found[i] = 1'b1;
            second_one[i] = 1'b1;
          end
          else begin
            second_one_found[i] = second_one_found[i-1];
            second_one[i] = 1'b0;
          end
        end
        else begin
          if(data_in[i]) begin
            first_one_found[i] = 1'b1;
            first_one[i] = 1'b1;
            second_one_found[i] = 1'b0;
            second_one[i] = 1'b0;
          end
          else begin
            first_one_found[i] = 1'b0;
            first_one[i] = 1'b0;
            second_one_found[i] = 1'b0;
            second_one[i] = 1'b0;
          end
        end
      end
    end
  end
  
endmodule
