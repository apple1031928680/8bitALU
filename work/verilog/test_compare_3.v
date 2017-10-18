/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module test_compare_3 (
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
  
  wire [8-1:0] M_compare_out;
  reg [8-1:0] M_compare_a;
  reg [8-1:0] M_compare_b;
  reg [6-1:0] M_compare_alufn;
  compare_11 compare (
    .a(M_compare_a),
    .b(M_compare_b),
    .alufn(M_compare_alufn),
    .out(M_compare_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_test_counter_d = M_test_counter_q;
    
    status = 1'h0;
    M_compare_a = 1'h0;
    M_compare_b = 1'h0;
    M_compare_alufn = 6'h00;
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
            M_compare_alufn = 6'h33;
            M_compare_a = 8'hff;
            M_compare_b = 8'hff;
            if (M_compare_out != 1'h1) begin
              M_state_d = FAIL_state;
            end
          end
          4'h1: begin
            M_compare_alufn = 6'h35;
            M_compare_a = 8'hff;
            M_compare_b = 8'hff;
            if (M_compare_out != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'h2: begin
            M_compare_alufn = 6'h37;
            M_compare_a = 8'hff;
            M_compare_b = 8'hff;
            if (M_compare_out != 1'h1) begin
              M_state_d = FAIL_state;
            end
          end
          4'h3: begin
            M_compare_alufn = 6'h33;
            M_compare_a = 8'h00;
            M_compare_b = 8'h00;
            if (M_compare_out != 1'h1) begin
              M_state_d = FAIL_state;
            end
          end
          4'h4: begin
            M_compare_alufn = 6'h35;
            M_compare_a = 8'h00;
            M_compare_b = 8'h00;
            if (M_compare_out != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'h5: begin
            M_compare_alufn = 6'h37;
            M_compare_a = 8'h00;
            M_compare_b = 8'h00;
            if (M_compare_out != 1'h1) begin
              M_state_d = FAIL_state;
            end
          end
          4'h6: begin
            M_compare_alufn = 6'h33;
            M_compare_a = 8'h53;
            M_compare_b = 8'h35;
            if (M_compare_out != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'h7: begin
            M_compare_alufn = 6'h35;
            M_compare_a = 8'h53;
            M_compare_b = 8'h35;
            if (M_compare_out != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'h8: begin
            M_compare_alufn = 6'h37;
            M_compare_a = 8'h53;
            M_compare_b = 8'h35;
            if (M_compare_out != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'h9: begin
            M_compare_alufn = 6'h33;
            M_compare_a = 8'h36;
            M_compare_b = 8'h54;
            if (M_compare_out != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'ha: begin
            M_compare_alufn = 6'h35;
            M_compare_a = 8'h36;
            M_compare_b = 8'h54;
            if (M_compare_out != 1'h1) begin
              M_state_d = FAIL_state;
            end
          end
          4'hb: begin
            M_compare_alufn = 6'h37;
            M_compare_a = 8'h36;
            M_compare_b = 8'h54;
            if (M_compare_out != 1'h1) begin
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
      M_test_counter_q <= 1'h0;
    end else begin
      M_test_counter_q <= M_test_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
