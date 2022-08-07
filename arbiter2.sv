module arbiter2(
  input req1,
  input req2,
  input clk,
  input rst_n,
  output logic [1:0] state_out
);
  
  logic [1:0] grant;
  
  //typedef enum bit [1:0] {IDLE=0, GRANT1=1, GRANT2=2} state;

  logic [1:0] curr_state,next_state;
  assign state_out = curr_state;
  
  always@(posedge clk or negedge rst_n) if(!rst_n) curr_state <= 'd0; else curr_state <=next_state;
  always@* begin
    next_state = curr_state;
    case(curr_state)
      'd0  : next_state = (req1?'d1:(req2?'d2:'d0));
      //GRANT1: next_state = (req2?GRANT2:(req1?GRANT1:IDLE));
      //GRANT2: next_state = (req1?GRANT1:(req2?GRANT2:IDLE));
    endcase
         
  end
      
endmodule        
        
        
  