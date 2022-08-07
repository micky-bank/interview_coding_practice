module arbiter(
  input req1,
  input req2,
  input req3,
  input req4,
  input req5,
  input req6,
  input req7,
  input req8,
  input clk,
  input rst_n,
  output reg [7:0] grant_out
);
  
  typedef enum bit [3:0] {IDLE, GRANT1, GRANT2, GRANT3, GRANT4, GRANT5, GRANT6, GRANT7, GRANT8} state;
//  typedef enum bit [3:0] {IDLE, GRANT1, GRANT2, GRANT3, GRANT4, GRANT5, GRANT6, GRANT7, GRANT8} ns;
  
  state ps, ns;
  logic [7:0] grant;
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      ps <= IDLE;
      grant_out <= '0;
    end
    else begin
      ps <= ns;
      grant_out <= grant;
    end
  end
  
  always_comb begin
    case(ps)
      IDLE: begin
            grant <= 8'h0;
        if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else
          ns = IDLE;
      end
      
      GRANT1: begin
          grant = 8'h1;
        if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else if(req1 == 1'b1)
          ns = GRANT1;
        else
          ns = IDLE;
      end
      GRANT2: begin
        grant = 8'h2;
        if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else
          ns = IDLE;
      end
      GRANT3: begin
        grant = 8'h4;
        if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else
          ns = IDLE;
      end
      GRANT4: begin
        grant = 8'h8;
        if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else 
          ns = IDLE;
      end
      GRANT5: begin
        grant = 8'h10;
        if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else
          ns = IDLE;
      end
      GRANT6: begin
        grant = 8'h20;
        if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else
          ns = IDLE;
      end
      GRANT7: begin
        grant = 8'h40;
        if(req8 == 1'b1)
          ns = GRANT8;
        else if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else
          ns = IDLE;
      end
      GRANT8: begin
        grant = 8'h80;
        if(req1 == 1'b1)
          ns = GRANT1;
        else if(req2 == 1'b1)
          ns = GRANT2;
        else if(req3 == 1'b1)
          ns = GRANT3;
        else if(req4 == 1'b1)
          ns = GRANT4;
        else if(req5 == 1'b1)
          ns = GRANT5;
        else if(req6 == 1'b1)
          ns = GRANT6;
        else if(req7 == 1'b1)
          ns = GRANT7;
        else if(req8 == 1'b1)
          ns = GRANT8;
        else
          ns = IDLE;
      end
    endcase
  end   
      
endmodule        
        
        
  