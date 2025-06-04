module mesh4x4_sva
#(
  parameter DATA_WIDTH_P= 4,
  parameter MESH_EDGE_P = 2,
  parameter medge_lp    = 2**(`MESH_EDGE_P),         // edge length of the mesh 
  parameter msize_lp    = (medge_lp)**2,
  parameter dims_lp     = 2,
  parameter dirs_lp     = (dims_lp*2)+1
)
(
  input logic clk,
  input logic reset,
  
  // Router interface
  input  logic [msize_lp-1:0][dirs_lp-1:0]v_i,
  input logic [msize_lp-1:0][dirs_lp-1:0]ready_and_i,
  input  logic [msize_lp-1:0][dirs_lp-1:0][x_cord_width_lp + y_cord_width_lp + width_lp-1:0] data_i,
  
  input logic [msize_lp-1:0][dirs_lp-1:0] yumi_o,
  input logic [msize_lp-1:0][dirs_lp-1:0] v_o,
  input logic [msize_lp-1:0][dirs_lp-1:0][x_cord_width_lp + y_cord_width_lp + width_lp-1:0] data_o
);
  localparam width_lp = (`DATA_WIDTH_P) + x_cord_width_lp + y_cord_width_lp;

  localparam x_cord_width_lp = MESH_EDGE_P;
  localparam y_cord_width_lp = MESH_EDGE_P;


// ==================================================
// EAST DIRECTION SIGNALS
// ==================================================
logic [msize_lp-1:0][width_lp - 6 : 0]                         tracking_cnt_east; // Set accordingly with fifo depth
logic [msize_lp-1:0][width_lp - 1 : 0]                         watched_pkt_east;

logic [msize_lp-1:0]                                           ready_to_sample_east,
                                                               sampled_in_east,
                                                               sampled_out_east,
                                                               must_read_east,
                                                               ready_to_sample_out_east;

logic [msize_lp-1:0][medge_lp-1:0]                             dest_rtr_east,
                                                               src_rtr_east;

logic [msize_lp-1:0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : 0]  colored_pkt_east;

logic [msize_lp-1:0]                                            incr_east,
                                                               decr_east,
                                                               hsk_in_east,
                                                               hsk_o_east;

// ==================================================
// SOUTH DIRECTION SIGNALS
// ==================================================
logic [msize_lp-1:0][width_lp - 6 : 0]                         tracking_cnt_south;    // Set accordingly with fifo depth
logic [msize_lp-1:0][width_lp - 1 : 0]                         watched_pkt_south;

logic [msize_lp-1:0]                                            ready_to_sample_south,
                                                               sampled_in_south,
                                                               sampled_out_south,
                                                               must_read_south,
                                                               ready_to_sample_out_south;

logic [msize_lp-1:0][medge_lp-1:0]                             dest_rtr_south,
                                                               src_rtr_south;

logic [msize_lp-1:0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : 0]  colored_pkt_south;

logic [msize_lp-1:0]                                            incr_south,
                                                               decr_south,
                                                               hsk_in_south,
                                                               hsk_o_south;

// ==================================================
// MISCELLANEOUS SIGNALS
// ==================================================
logic                                                         arbit_window;




  typedef enum logic[2:0] {P=3'd0, W, E, N, S} Dirs;


//-------CLocking block------------

    default clocking cb1
        @(posedge clk);
    endclocking
//-------CLocking block------------


//----Aux Code-------------

generate
  for (genvar i = 0; i < msize_lp; i++) begin: smart_trk

    always @(posedge clk)
      if (reset)
        tracking_cnt_east[i] <= 'b0;
      else
        tracking_cnt_east[i] <= tracking_cnt_east[i] + incr_east[i] - decr_east[i];

    always @(posedge clk)
      if (reset)
        tracking_cnt_south[i] <= 'b0;
      else
        tracking_cnt_south[i] <= tracking_cnt_south[i] + incr_south[i] - decr_south[i];

    always @(posedge clk)
      if (reset) begin 
        sampled_in_east[i] <= 1'b0;
       end
      else if (ready_to_sample_east[i]) begin
        sampled_in_east[i] <= 1'b1;
      end 
    always @(posedge clk)
      if (reset) begin 
        sampled_in_south[i] <= 1'b0;
       end
      else if (ready_to_sample_south[i]) begin
        sampled_in_south[i] <= 1'b1;
      end 
  end
  
endgenerate

always @(posedge clk) begin
  if (reset) begin 
    sampled_out_east <= '0;
  end else begin
    for (integer i = 0; i < msize_lp; i++) begin
      if (must_read_east[i] & (i <3))
        sampled_out_east[i+1] <= 1'b1;
      if (must_read_south[i] & (i<=3))
        sampled_out_south[i+4] <= 1'b1;
      if (must_read_east[i] & (i >3)& (i<7))
        sampled_out_east[i+1] <= 1'b1;
      if (must_read_south[i] & (i >3)& (i<=7))
        sampled_out_south[i+4] <= 1'b1;
      if (must_read_east[i] & (i >7)& (i<11))
        sampled_out_east[i+1] <= 1'b1;
      if (must_read_south[i] & (i >7)& (i<=11))
        sampled_out_south[i+4] <= 1'b1;
      if (must_read_east[i] & (i >11)& (i<15))
        sampled_out_east[i+1] <= 1'b1;
      if (must_read_east[15] & (i==15))
        sampled_out_east[15] <= 1'b1; 

  end
  end end
     // ----------------------------------------------
    //                   ASSUMPTIONS
    // ----------------------------------------------

generate
  for (genvar i = 0; i < msize_lp; i++) begin: Coloring_pkt
      assume property (data_i[i][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1: width_lp] == i[x_cord_width_lp + y_cord_width_lp -1:0]);
   end
endgenerate


      assume property (ready_and_i[0] == 5'h15);  //15 (S ,0 ,E, 0 ,PE)
      assume property (ready_and_i[1] == 5'h17);  //17 (S ,0 ,E, W ,PE)
      assume property (ready_and_i[2] == 5'h17);  //17 (S ,0 ,E, W ,PE)
      assume property (ready_and_i[3] == 5'h13);  //13 (S ,0 ,0, W ,PE)
      assume property (ready_and_i[4] == 5'h1d);
      assume property (ready_and_i[5] == 5'h1f);
      assume property (ready_and_i[6] == 5'h1f);
      assume property (ready_and_i[7] == 5'h1b);
      assume property (ready_and_i[8] == 5'h1d);
      assume property (ready_and_i[9] == 5'h1f);
      assume property (ready_and_i[10] == 5'h1f);
      assume property (ready_and_i[11] == 5'h1b);
      assume property (ready_and_i[12] == 5'hd);
      assume property (ready_and_i[13] == 5'hf);
      assume property (ready_and_i[14] == 5'hf);
      assume property (ready_and_i[15] == 5'hb);
generate
  for (genvar i = 0; i < msize_lp; i++) begin: watch_pkt

//------ AUx code for east and south assertions---------


  // EAST LINKS: from router i to router i+1 (if not on the right edge)
  if (i <= 3) begin
    if (i<3) begin
  assume property ($stable(watched_pkt_east[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 

  assign hsk_in_east[i] = v_i[i][0]; // local East input port
  assign hsk_o_east[i]  = v_o[dest_rtr_east[i]][0] & ready_and_i[dest_rtr_east[i]][0]; // neighbor's West output

  assign ready_to_sample_east[i] = hsk_in_east[i] & yumi_o[i][0] &
                                  (data_i[i][0][width_lp-1:0] == watched_pkt_east[i]) &
                                  arbit_window;

  assign dest_rtr_east[i] = watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp -1:0];
  assign src_rtr_east[i]  = i[x_cord_width_lp + y_cord_width_lp -1:0];

  assign colored_pkt_east[i] = {src_rtr_east[i], watched_pkt_east[i]};

  assign must_read_east[i] = (tracking_cnt_east[i] == 1) & sampled_in_east[i] & decr_east[i];

  assign incr_east[i] = hsk_in_east[i] & !sampled_in_east[i] & yumi_o[i][0] &
                        (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);

  assign decr_east[i] = hsk_o_east[i] & !sampled_out_east[dest_rtr_east[i]] &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : width_lp] == src_rtr_east[i]) &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);
    end
  // SOUTH LINKS: from router i to router i+4 (if not on bottom edge)
  assume property ($stable(watched_pkt_south[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)]));

  assign hsk_in_south[i] = v_i[i][0]; // local South input port
  assign hsk_o_south[i]  = v_o[dest_rtr_south[i]][0] & ready_and_i[dest_rtr_south[i]][0]; // neighbor's North output

  assign ready_to_sample_south[i] = hsk_in_south[i] & yumi_o[i][0] &
                                  (data_i[i][0][width_lp-1:0] == watched_pkt_south[i]) &
                                  arbit_window;

  assign dest_rtr_south[i] = watched_pkt_south[i][x_cord_width_lp + y_cord_width_lp -1:0];
  assign src_rtr_south[i]  = i[x_cord_width_lp + y_cord_width_lp -1:0];

  assign colored_pkt_south[i] = {src_rtr_south[i], watched_pkt_south[i]};

  assign must_read_south[i] = (tracking_cnt_south[i] == 1) & sampled_in_south[i] & decr_south[i];

  assign incr_south[i] = hsk_in_south[i] & !sampled_in_south[i] & yumi_o[i][0] &
                         (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_south[i]);

  assign decr_south[i] = hsk_o_south[i] & !sampled_out_south[dest_rtr_south[i]] &
                         (data_o[dest_rtr_south[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : width_lp] == src_rtr_south[i]) &
                         (data_o[dest_rtr_south[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_south[i]);
  end



//For router 4 to 7 east



if(((i>3) && (i<=7))) begin 
  if(((i>3) && (i<7))) begin 

  assume property ($stable(watched_pkt_east[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 

  assign hsk_in_east[i] = v_i[i][0]; // local East input port
  assign hsk_o_east[i]  = v_o[dest_rtr_east[i]][0] & ready_and_i[dest_rtr_east[i]][0]; // neighbor's West output

  assign ready_to_sample_east[i] = hsk_in_east[i] & yumi_o[i][0] &
                                  (data_i[i][0][width_lp-1:0] == watched_pkt_east[i]) &
                                  arbit_window;

  assign dest_rtr_east[i] = watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp -1:0];
  assign src_rtr_east[i]  = i[x_cord_width_lp + y_cord_width_lp -1:0];

  assign colored_pkt_east[i] = {src_rtr_east[i], watched_pkt_east[i]};

  assign must_read_east[i] = (tracking_cnt_east[i] == 1) & sampled_in_east[i] & decr_east[i];

  assign incr_east[i] = hsk_in_east[i] & !sampled_in_east[i] & yumi_o[i][0] &
                        (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);

  assign decr_east[i] = hsk_o_east[i] & !sampled_out_east[dest_rtr_east[i]] &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : width_lp] == src_rtr_east[i]) &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);
  end
  // SOUTH LINKS: from router i to router i+4 (if not on bottom edge)
  assume property ($stable(watched_pkt_south[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)]));

  assign hsk_in_south[i] = v_i[i][0]; // local South input port
  assign hsk_o_south[i]  = v_o[dest_rtr_south[i]][0] & ready_and_i[dest_rtr_south[i]][0]; // neighbor's North output

  assign ready_to_sample_south[i] = hsk_in_south[i] & yumi_o[i][0] &
                                  (data_i[i][0][width_lp-1:0] == watched_pkt_south[i]) &
                                  arbit_window;

  assign dest_rtr_south[i] = watched_pkt_south[i][x_cord_width_lp + y_cord_width_lp -1:0];
  assign src_rtr_south[i]  = i[x_cord_width_lp + y_cord_width_lp -1:0];

  assign colored_pkt_south[i] = {src_rtr_south[i], watched_pkt_south[i]};

  assign must_read_south[i] = (tracking_cnt_south[i] == 1) & sampled_in_south[i] & decr_south[i];

  assign incr_south[i] = hsk_in_south[i] & !sampled_in_south[i] & yumi_o[i][0] &
                         (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_south[i]);

  assign decr_south[i] = hsk_o_south[i] & !sampled_out_south[dest_rtr_south[i]] &
                         (data_o[dest_rtr_south[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : width_lp] == src_rtr_south[i]) &
                         (data_o[dest_rtr_south[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_south[i]);
  end

//For router 4 to 7 east



if(((i>7) && (i<=11))) begin 
  if(((i>7) && (i<11))) begin 
  assume property ($stable(watched_pkt_east[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 

  assign hsk_in_east[i] = v_i[i][0]; // local East input port
  assign hsk_o_east[i]  = v_o[dest_rtr_east[i]][0] & ready_and_i[dest_rtr_east[i]][0]; // neighbor's West output

  assign ready_to_sample_east[i] = hsk_in_east[i] & yumi_o[i][0] &
                                  (data_i[i][0][width_lp-1:0] == watched_pkt_east[i]) &
                                  arbit_window;

  assign dest_rtr_east[i] = watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp -1:0];
  assign src_rtr_east[i]  = i[x_cord_width_lp + y_cord_width_lp -1:0];

  assign colored_pkt_east[i] = {src_rtr_east[i], watched_pkt_east[i]};

  assign must_read_east[i] = (tracking_cnt_east[i] == 1) & sampled_in_east[i] & decr_east[i];

  assign incr_east[i] = hsk_in_east[i] & !sampled_in_east[i] & yumi_o[i][0] &
                        (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);

  assign decr_east[i] = hsk_o_east[i] & !sampled_out_east[dest_rtr_east[i]] &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : width_lp] == src_rtr_east[i]) &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);
  end
  // SOUTH LINKS: from router i to router i+4 (if not on bottom edge)
  assume property ($stable(watched_pkt_south[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)]));

  assign hsk_in_south[i] = v_i[i][0]; // local South input port
  assign hsk_o_south[i]  = v_o[dest_rtr_south[i]][0] & ready_and_i[dest_rtr_south[i]][0]; // neighbor's North output

  assign ready_to_sample_south[i] = hsk_in_south[i] & yumi_o[i][0] &
                                  (data_i[i][0][width_lp-1:0] == watched_pkt_south[i]) &
                                  arbit_window;

  assign dest_rtr_south[i] = watched_pkt_south[i][x_cord_width_lp + y_cord_width_lp -1:0];
  assign src_rtr_south[i]  = i[x_cord_width_lp + y_cord_width_lp -1:0];

  assign colored_pkt_south[i] = {src_rtr_south[i], watched_pkt_south[i]};

  assign must_read_south[i] = (tracking_cnt_south[i] == 1) & sampled_in_south[i] & decr_south[i];

  assign incr_south[i] = hsk_in_south[i] & !sampled_in_south[i] & yumi_o[i][0] &
                         (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_south[i]);

  assign decr_south[i] = hsk_o_south[i] & !sampled_out_south[dest_rtr_south[i]] &
                         (data_o[dest_rtr_south[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : width_lp] == src_rtr_south[i]) &
                         (data_o[dest_rtr_south[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_south[i]);
  end


if(((i>11) && (i<15))) begin 
  assume property ($stable(watched_pkt_east[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 

  assign hsk_in_east[i] = v_i[i][0]; // local East input port
  assign hsk_o_east[i]  = v_o[dest_rtr_east[i]][0] & ready_and_i[dest_rtr_east[i]][0]; // neighbor's West output

  assign ready_to_sample_east[i] = hsk_in_east[i] & yumi_o[i][0] &
                                  (data_i[i][0][width_lp-1:0] == watched_pkt_east[i]) &
                                  arbit_window;

  assign dest_rtr_east[i] = watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp -1:0];
  assign src_rtr_east[i]  = i[x_cord_width_lp + y_cord_width_lp -1:0];

  assign colored_pkt_east[i] = {src_rtr_east[i], watched_pkt_east[i]};

  assign must_read_east[i] = (tracking_cnt_east[i] == 1) & sampled_in_east[i] & decr_east[i];

  assign incr_east[i] = hsk_in_east[i] & !sampled_in_east[i] & yumi_o[i][0] &
                        (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);

  assign decr_east[i] = hsk_o_east[i] & !sampled_out_east[dest_rtr_east[i]] &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1 : width_lp] == src_rtr_east[i]) &
                        (data_o[dest_rtr_east[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr_east[i]);
  end


if(i==15) begin
    assume property ($stable(watched_pkt_east[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 
      assign hsk_in_east[i] = (v_i[0][0] );
      assign hsk_o_east[i] = 1;//v_o[3][0] & ready_and_i[3][0];
      assign ready_to_sample_east[i] = hsk_in_east[i] & yumi_o[0][0] & (data_i[0][0][width_lp-1:0] == watched_pkt_east[i]) & arbit_window;
      assign dest_rtr_east[i] = watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp -1:0];
      assign src_rtr_east [i] = 4'b0;
      assign must_read_east[i] = ((tracking_cnt_east[i]==1) & sampled_in_east[i] & decr_east[i]);
      assign incr_east[i] = (hsk_in_east[i] ) & !sampled_in_east[i] & yumi_o[0][0] & (data_i[0][0][x_cord_width_lp + y_cord_width_lp -1:0] == 4'hf);        //hsk_in
      assign decr_east[i] = (hsk_o_east[i] & !sampled_out_east[i] & (data_o[i][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1: width_lp] == 4'h0) & (data_o[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == 4'hf));  //hsk_Out
  end





//------ AUx code for east and south assertions---------



  if(i<=3) begin
  if(i<3) begin :east
      assign watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp:0] = i +1;
    start: cover property(ready_to_sample_east[0]);
    check_assum:  assume property ( disable iff((i==dest_rtr_east[i])) (hsk_in_east[i] & !yumi_o[i][0])|=> $stable(data_i[i][0]));
//    cover property((yumi_o[i][0]==1 )&(data_i[0][0]==watched_pkt[i]));
//    cover property((yumi_o[i][0]==1) & (data_i[0][0]==watched_pkt[i]) |=> data_i[2][3]==watched_pkt[i]);
      data_integ0_3_east: assert property( disable iff((i==dest_rtr_east[i]) ) ((must_read_east[i] ) |-> (data_o[dest_rtr_east[i]][0]==colored_pkt_east[i])));
  end
      assign watched_pkt_south[i][x_cord_width_lp + y_cord_width_lp:0] = i +4;

      data_integ0_3_south: assert property( disable iff((i==dest_rtr_south[i]) ) ((must_read_south[i] ) |-> (data_o[dest_rtr_south[i]][0]==colored_pkt_south[i])));
  end

if(((i>3) && (i<=7))) begin 
if(((i>3) && (i<7))) begin :east
      assign watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp:0] = i +1;
    start: cover property(ready_to_sample_east[0]);
    check_assum:  assume property ( disable iff((i==dest_rtr_east[i])) (hsk_in_east[i] & !yumi_o[i][0])|=> $stable(data_i[i][0]));
//    cover property((yumi_o[i][0]==1 )&(data_i[0][0]==watched_pkt[i]));
//    cover property((yumi_o[i][0]==1) & (data_i[0][0]==watched_pkt[i]) |=> data_i[2][3]==watched_pkt[i]);
      data_integ3_7_east: assert property( disable iff((i==dest_rtr_east[i]) ) ((must_read_east[i] ) |-> (data_o[dest_rtr_east[i]][0]==colored_pkt_east[i])));
end
      assign watched_pkt_south[i][x_cord_width_lp + y_cord_width_lp:0] = i +4;

      data_integ3_7_south: assert property( disable iff((i==dest_rtr_south[i]) ) ((must_read_south[i] ) |-> (data_o[dest_rtr_south[i]][0]==colored_pkt_south[i])));
  end



if(((i>7) && (i<=11))) begin 
if(((i>7) && (i<11))) begin :east
      assign watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp:0] = i +1;
    start: cover property(ready_to_sample_east[0]);
    check_assum:  assume property ( disable iff((i==dest_rtr_east[i])) (hsk_in_east[i] & !yumi_o[i][0])|=> $stable(data_i[i][0]));
//    cover property((yumi_o[i][0]==1 )&(data_i[0][0]==watched_pkt[i]));
//    cover property((yumi_o[i][0]==1) & (data_i[0][0]==watched_pkt[i]) |=> data_i[2][3]==watched_pkt[i]);
      data_integ7_11_east: assert property( disable iff((i==dest_rtr_east[i]) ) ((must_read_east[i] ) |-> (data_o[dest_rtr_east[i]][0]==colored_pkt_east[i])));
end
      assign watched_pkt_south[i][x_cord_width_lp + y_cord_width_lp:0] = i +4;

      data_integ7_11_south: assert property( disable iff((i==dest_rtr_south[i]) ) ((must_read_south[i] ) |-> (data_o[dest_rtr_south[i]][0]==colored_pkt_south[i])));
  end
if(((i>11) && (i<15))) begin :east
      assign watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp:0] = i +1;
    start: cover property(ready_to_sample_east[0]);
    check_assum:  assume property ( disable iff((i==dest_rtr_east[i])) (hsk_in_east[i] & !yumi_o[i][0])|=> $stable(data_i[i][0]));
//    cover property((yumi_o[i][0]==1 )&(data_i[0][0]==watched_pkt[i]));
//    cover property((yumi_o[i][0]==1) & (data_i[0][0]==watched_pkt[i]) |=> data_i[2][3]==watched_pkt[i]);
      data_integ11_15_east: assert property( disable iff((i==dest_rtr_east[i]) ) ((must_read_east[i] ) |-> (data_o[dest_rtr_east[i]][0]==colored_pkt_east[i])));
end

  if(i==15) begin
      assign watched_pkt_east[i][x_cord_width_lp + y_cord_width_lp:0] = 4'd15;
      assign colored_pkt_east[i] = {src_rtr_east[i], watched_pkt_east[i]};
      data_integ0_15: assert property( ((must_read_east[i] ) |-> (data_o[i][0]==colored_pkt_east[i]))); 

    end



  end
endgenerate
endmodule