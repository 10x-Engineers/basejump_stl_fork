module two_transaction_tracker #(
  parameter int DATA_WIDTH = 32
)(
  input  logic                  clk,
  input  logic                  rst_n,

  // Source interface (transaction injection)
  input  logic                  in_valid,
  input  logic                  in_ready,
  input  logic [DATA_WIDTH-1:0] data_in,

  // Sink interface (transaction ejection)
  input  logic                  out_valid,
  input  logic                  out_ready,
  input  logic [DATA_WIDTH-1:0] data_out
);

  // ----------------------------------------
  // Symbolic transactions to compare
  // ----------------------------------------
  logic [DATA_WIDTH-1:0] watched_data_1;  // "Transaction A"
  logic [DATA_WIDTH-1:0] watched_data_2;  // "Transaction B"
  logic w_hsk, r_hsk;
  logic seen_read, seen_in_d1, seen_in_d2;
  
  // Assume both are symbolic and different
  assume property (@(posedge clk) disable iff (!rst_n)
    $stable(watched_data_1) && $stable(watched_data_2)
  );
  assume property (@(posedge clk) disable iff (!rst_n)
    watched_data_1 != watched_data_2 );

	assume property (@(posedge clk) disable iff (!rst_n) 
	!sampled_in_d1 |-> !sampled_in_d2);

  // ----------------------------------------
  // Detect injection and observation of both
  // ----------------------------------------
  assign w_hsk  = in_valid && in_ready;
  assign r_hsk  = out_valid && out_ready;

  assign seen_in_d1  = w_hsk  && (data_in  == watched_data_1);
  assign seen_in_d2  = w_hsk  && (data_in  == watched_data_2);
  

  // ----------------------------------------
  // Track order of injection and observation
  // ----------------------------------------
  logic sampled_in_d1, sampled_in_d2;
  logic sampled_out_d1, sampled_out_d2;



  always @(posedge clk or negedge rst_n)
    if (!rst_n)
      seen_read <= 1'b0;
    else if (r_hsk)
      seen_read <= 1'b1;


  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      sampled_in_d1   <= 1'b0;
    end else begin
      sampled_in_d1  <= seen_in_d1 || sampled_in_d1;
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      sampled_in_d2   <= 1'b0;
    end else begin
      sampled_in_d2  <= seen_in_d2 || sampled_in_d2;
    end
  end


  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      sampled_out_d1  <= 1'b0;
    end else if (sampled_in_d1 && seen_read && (data_out == watched_data_1)) begin        
        sampled_out_d1 <= 1'b1;

    end
  end


  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      sampled_out_d2  <= 1'b0;
    end else if (sampled_in_d2 && seen_read && (data_out == watched_data_2)) begin        
        sampled_out_d2 <= 1'b1;

    end
  end



  // ----------------------------------------
  // Main ordering property
  // ----------------------------------------

  // If transaction 1 enters before 2, it must exit before 2
 
  assert property (@(posedge clk) disable iff (!rst_n)
	sampled_in_d1 && sampled_in_d2 && !sampled_out_d1 |-> !sampled_out_d2 );

	// Liveness property, if d1 was sampled in it should always leave the module

	assert property (@(posedge clk) disable iff (!rst_n) sampled_in_d1 |-> ##[0:$] sampled_out_d1);

endmodule
