/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module manual_test_4 (
    input clk,
    input rst,
    input proceed,
    input [15:0] data,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  localparam IDLE_state = 2'd0;
  localparam WAIT_A_state = 2'd1;
  localparam WAIT_B_state = 2'd2;
  localparam TEST_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  reg [15:0] M_reg_a_d, M_reg_a_q = 1'h0;
  reg [15:0] M_reg_b_d, M_reg_b_q = 1'h0;
  reg [5:0] M_reg_fn_d, M_reg_fn_q = 1'h0;
  
  wire [16-1:0] M_the_alu_out;
  wire [1-1:0] M_the_alu_z;
  wire [1-1:0] M_the_alu_v;
  wire [1-1:0] M_the_alu_n;
  reg [16-1:0] M_the_alu_x;
  reg [16-1:0] M_the_alu_y;
  reg [6-1:0] M_the_alu_alufn;
  alu_7 the_alu (
    .x(M_the_alu_x),
    .y(M_the_alu_y),
    .alufn(M_the_alu_alufn),
    .out(M_the_alu_out),
    .z(M_the_alu_z),
    .v(M_the_alu_v),
    .n(M_the_alu_n)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_reg_b_d = M_reg_b_q;
    M_reg_a_d = M_reg_a_q;
    M_reg_fn_d = M_reg_fn_q;
    
    M_the_alu_x = 1'h0;
    M_the_alu_y = 1'h0;
    M_the_alu_alufn = 1'h0;
    out = 16'h0000;
    z = M_the_alu_z;
    v = M_the_alu_v;
    n = M_the_alu_n;
    
    case (M_state_q)
      IDLE_state: begin
        out = 16'h000a;
        if (proceed) begin
          M_state_d = WAIT_A_state;
          M_reg_a_d = data;
        end
      end
      WAIT_A_state: begin
        out = 16'h000b;
        if (proceed) begin
          M_state_d = WAIT_B_state;
          M_reg_b_d = data;
        end
      end
      WAIT_B_state: begin
        if (proceed) begin
          M_state_d = TEST_state;
          M_reg_fn_d = data[0+5-:6];
        end
        out = 16'h000f;
      end
      TEST_state: begin
        M_the_alu_x = M_reg_a_q;
        M_the_alu_y = M_reg_b_q;
        M_the_alu_alufn = M_reg_fn_q;
        out = M_the_alu_out;
        if (proceed) begin
          M_reg_a_d = 1'h0;
          M_reg_b_d = 1'h0;
          M_reg_fn_d = 1'h0;
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_state_q <= M_state_d;
    
    if (rst == 1'b1) begin
      M_reg_a_q <= 1'h0;
      M_reg_b_q <= 1'h0;
      M_reg_fn_q <= 1'h0;
    end else begin
      M_reg_a_q <= M_reg_a_d;
      M_reg_b_q <= M_reg_b_d;
      M_reg_fn_q <= M_reg_fn_d;
    end
  end
  
endmodule
