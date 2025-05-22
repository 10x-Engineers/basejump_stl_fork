module smart_tracker #(
  parameter int DATA_WIDTH = 32
)(
  input  logic                  clk,
  input  logic                  rst_n,

  // Source interface (where data is injected)
  input  logic                  in_valid,
  input  logic                  in_ready,
  input  logic [DATA_WIDTH-1:0] in_data,

  // Sink interface (where data is consumed)
  input  logic                  out_valid,
  input  logic                  out_ready,
  input  logic [DATA_WIDTH-1:0] out_data
);

  // ----------------------------------------
  // Symbolic data to track — watched_data
  // ----------------------------------------
  logic [DATA_WIDTH-1:0] watched_data;
  logic w_hsk, r_hsk;
  logic must_read;
  logic [DATA_WIDTH-1:0] tracking_counter;   //tracking counter should be able to count till the depth of the fifo.
  logic sampled_in, sampled_out;
  logic arbit_window;
  
  // Fix its symbolic value — constant for a given proof
  assume property (@(posedge clk) disable iff (!rst_n)
    $stable(watched_data)
  );


  // ----------------------------------------
  // Detect injection and observation of both
  // ----------------------------------------
  assign w_hsk  = in_valid && in_ready;
  assign r_hsk  = out_valid && out_ready;


  // ----------------------------------------
  // Match signals for input and output
  // ----------------------------------------

  assign incr = w_hsk && !sampled_in;
  assign decr = r_hsk && !sampled_out;

  assign must_read = (tracking_counter==1) && sampled_in && decr;

  always @(posedge clk or negedge rst_n)
    if (!rst_n)
      tracking_counter <= {DATA_WIDTH{1'b0}};
    else
      tracking_counter <= tracking_counter + incr - decr;

  
  // ----------------------------------------
  // State tracking
  // ----------------------------------------


  always @(posedge clk or negedge rst_n)
    if (!rst_n)
      sampled_in <= 1'b0;
    else if (in_data==watched_data && incr && arbit_window)
      sampled_in <= 1'b1;

  
  always @(posedge clk or negedge rst_n)
    if (!rst_n)
      sampled_out <= 1'b0;
    else if (must_read)
      sampled_out <= 1'b1;


  // ----------------------------------------
  // Assertions
  // ----------------------------------------

  // 1. Watched packet should be seen after tracking counter has reached 1
  assert property (@(posedge clk) disable iff (!rst_n) must_read |=> (out_data==watched_data));

  // 2. Output occurs only once
  assert property (@(posedge clk) disable iff (!rst_n) sampled_in |-> ##[0:$] sampled_out); 
  //If convergence issues try bounded liveness, bound it around the depth

  // Optional: cover to visualize path
  cover property (@(posedge clk) disable iff (!rst_n) sampled_in |->  ##[0:$] must_read);

endmodule
