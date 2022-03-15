/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module multiplier_11 (
    input [15:0] x,
    input [15:0] y,
    input [15:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn[0+0-:1])
      1'h0: begin
        out = x * y;
      end
      1'h1: begin
        out = x / y;
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule
