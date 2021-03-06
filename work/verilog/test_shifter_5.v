/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module test_shifter_5 (
    input clk,
    input rst,
    input start,
    output reg [1:0] status
  );
  
  
  
  reg [3:0] M_test_counter_d, M_test_counter_q = 1'h0;
  
  localparam IDLE_state = 2'd0;
  localparam TEST_state = 2'd1;
  localparam PASS_state = 2'd2;
  localparam FAIL_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  
  wire [8-1:0] M_shifter_out;
  reg [8-1:0] M_shifter_a;
  reg [8-1:0] M_shifter_b;
  reg [6-1:0] M_shifter_alufn;
  shifter_13 shifter (
    .a(M_shifter_a),
    .b(M_shifter_b),
    .alufn(M_shifter_alufn),
    .out(M_shifter_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_test_counter_d = M_test_counter_q;
    
    status = 1'h0;
    M_shifter_a = 1'h0;
    M_shifter_b = 1'h0;
    M_shifter_alufn = 6'h00;
    if (start == 1'h0) begin
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        status = 1'h0;
        if (start == 1'h1) begin
          M_state_d = TEST_state;
        end
      end
      TEST_state: begin
        
        case (M_test_counter_q)
          4'h0: begin
            M_shifter_alufn = 6'h20;
            M_shifter_a = 8'hff;
            M_shifter_b = 8'h07;
            if (M_shifter_out != 8'h80) begin
              M_state_d = FAIL_state;
            end
          end
          4'h1: begin
            M_shifter_alufn = 6'h20;
            M_shifter_a = 8'h00;
            M_shifter_b = 8'h07;
            if (M_shifter_out != 8'h00) begin
              M_state_d = FAIL_state;
            end
          end
          4'h2: begin
            M_shifter_alufn = 6'h20;
            M_shifter_a = 8'h35;
            M_shifter_b = 8'h04;
            if (M_shifter_out != 8'h50) begin
              M_state_d = FAIL_state;
            end
          end
          4'h3: begin
            M_shifter_alufn = 6'h21;
            M_shifter_a = 8'hff;
            M_shifter_b = 8'h07;
            if (M_shifter_out != 8'h01) begin
              M_state_d = FAIL_state;
            end
          end
          4'h4: begin
            M_shifter_alufn = 6'h21;
            M_shifter_a = 8'h00;
            M_shifter_b = 8'h07;
            if (M_shifter_out != 8'h00) begin
              M_state_d = FAIL_state;
            end
          end
          4'h5: begin
            M_shifter_alufn = 6'h21;
            M_shifter_a = 8'h35;
            M_shifter_b = 8'h04;
            if (M_shifter_out != 8'h03) begin
              M_state_d = FAIL_state;
            end
          end
          4'h6: begin
            M_shifter_alufn = 6'h23;
            M_shifter_a = 8'hff;
            M_shifter_b = 8'h07;
            if (M_shifter_out != 8'hff) begin
              M_state_d = FAIL_state;
            end
          end
          4'h7: begin
            M_shifter_alufn = 6'h23;
            M_shifter_a = 8'h00;
            M_shifter_b = 8'h07;
            if (M_shifter_out != 8'h00) begin
              M_state_d = FAIL_state;
            end
          end
          4'h8: begin
            M_shifter_alufn = 6'h23;
            M_shifter_a = 8'h35;
            M_shifter_b = 8'h04;
            if (M_shifter_out != 8'h03) begin
              M_state_d = FAIL_state;
            end
          end
          4'hf: begin
            M_state_d = PASS_state;
          end
        endcase
      end
      PASS_state: begin
        status = 1'h1;
      end
      FAIL_state: begin
        status = 2'h2;
      end
    endcase
    M_test_counter_d = M_test_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_test_counter_q <= 1'h0;
    end else begin
      M_test_counter_q <= M_test_counter_d;
    end
  end
  
endmodule
