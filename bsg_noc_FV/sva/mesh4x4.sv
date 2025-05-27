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


    logic [msize_lp-1:0][2:0] watched_req;
    logic [msize_lp-1:0][width_lp - 6 :0] tracking_cnt;
    logic [msize_lp-1:0][width_lp-1:0] watched_pkt;
    logic [msize_lp-1:0] ready_to_sample, sampled_in, sampled_out, must_read, ready_to_sample_out;
    logic [msize_lp-1:0][3:0] dest_rtr, src_rtr;
    logic [msize_lp-1:0] [x_cord_width_lp + y_cord_width_lp + width_lp  -1: 0] colored_pkt;
    logic [msize_lp-1:0]incr, decr, hsk_in, hsk_o;
    logic [2:0] test;
    logic arbit_window;


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
        tracking_cnt[i] <= 'b0;
      else
        tracking_cnt[i] <= tracking_cnt[i] + incr[i] - decr[i];


    always @(posedge clk)
      if (reset) begin 
        sampled_in[i] <= 1'b0;
//        sampled_out[i] <= 1'b0;
       end
      else if (ready_to_sample[i]) begin
        sampled_in[i] <= 1'b1;
      end 

  end
  
endgenerate

always @(posedge clk) begin
  if (reset) begin 
    sampled_out <= '0;
  end else begin
    for (integer i = 0; i < msize_lp; i++) begin
      if (must_read[i] & (i <3))
        sampled_out[i+1] <= 1'b1;
      else if (must_read[3] & (i==3))
        sampled_out[3] <= 1'b1;
      if (must_read[i] & (i >3)& (i<7))
        sampled_out[i+1] <= 1'b1;

      else if (must_read[7] & (i==7))
        sampled_out[7] <= 1'b1;    
      else if (must_read[8] & (i==8))
        sampled_out[8] <= 1'b1; end
  end
end
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


    if((i<3)) begin 
    assume property ($stable(watched_pkt[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 
      assign hsk_in[i] = (v_i[i][0] );
      assign hsk_o[i] = v_o[dest_rtr[i]][0] & ready_and_i[dest_rtr[i]][0];
      assign ready_to_sample[i] = hsk_in[i] & yumi_o[i][0] & (data_i[i][0][width_lp-1:0] == watched_pkt[i]) & arbit_window;
      assign dest_rtr[i] = watched_pkt[i][x_cord_width_lp + y_cord_width_lp -1:0];
      assign src_rtr [i] = i[x_cord_width_lp + y_cord_width_lp -1:0];
      assign colored_pkt[i] = {src_rtr[i], watched_pkt[i]};
      assign must_read[i] = ((tracking_cnt[i]==1) & sampled_in[i] & decr[i]);
      assign incr[i] = (hsk_in[i] ) & !sampled_in[i] & yumi_o[i][0] & (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr[i]);        //hsk_in
      assign decr[i] = (hsk_o[i] & !sampled_out[dest_rtr[i]] & (data_o[dest_rtr[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1: width_lp] == src_rtr[i]) & (data_o[dest_rtr[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr[i]));  //hsk_Out
    end
  if(i==3) begin
    assume property ($stable(watched_pkt[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 
      assign hsk_in[i] = (v_i[3][0] );
      assign hsk_o[7] = 1;//v_o[3][0] & ready_and_i[3][0];
      assign ready_to_sample[i] = hsk_in[i] & yumi_o[3][0] & (data_i[3][0][width_lp-1:0] == watched_pkt[i]) & arbit_window;
      assign dest_rtr[7] = watched_pkt[i][x_cord_width_lp + y_cord_width_lp -1:0];
      assign src_rtr [i] = 4'h3;
      assign must_read[7] = ((tracking_cnt[7]==1) & sampled_in[i] & decr[7]);
      assign incr[7] = (hsk_in[i] ) & !sampled_in[i] & yumi_o[3][0] & (data_i[3][0][x_cord_width_lp + y_cord_width_lp -1:0] == 7);        //hsk_in
      assign decr[7] = (hsk_o[7] & !sampled_out[7] & (data_o[7][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1: width_lp] == 4'h3) & (data_o[7][0][x_cord_width_lp + y_cord_width_lp -1:0] == 7));  //hsk_Out
  end
    if(((i>3) && (i<7))) begin 
    assume property ($stable(watched_pkt[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 
      assign hsk_in[i] = (v_i[i][0] );
      assign hsk_o[i] = v_o[dest_rtr[i]][0] & ready_and_i[dest_rtr[i]][0];
      assign ready_to_sample[i] = hsk_in[i] & yumi_o[i][0] & (data_i[i][0][width_lp-1:0] == watched_pkt[i]) & arbit_window;
      assign dest_rtr[i] = watched_pkt[i][x_cord_width_lp + y_cord_width_lp -1:0];
      assign src_rtr [i] = i[x_cord_width_lp + y_cord_width_lp -1:0];
      assign colored_pkt[i] = {src_rtr[i], watched_pkt[i]};
      assign must_read[i] = ((tracking_cnt[i]==1) & sampled_in[i] & decr[i]);
      assign incr[i] = (hsk_in[i] ) & !sampled_in[i] & yumi_o[i][0] & (data_i[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr[i]);        //hsk_in
      assign decr[i] = (hsk_o[i] & !sampled_out[dest_rtr[i]] & (data_o[dest_rtr[i]][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1: width_lp] == src_rtr[i]) & (data_o[dest_rtr[i]][0][x_cord_width_lp + y_cord_width_lp -1:0] == dest_rtr[i]));  //hsk_Out
    end


//if(i==7) begin
//    assume property ($stable(watched_pkt[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 
//      assign hsk_in[7] = (v_i[0][0] );
//      assign hsk_o[i] = 1;//v_o[3][0] & ready_and_i[3][0];
//      assign ready_to_sample[i] = hsk_in[i] & yumi_o[0][0] & (data_i[0][0][width_lp-1:0] == watched_pkt[i]) & arbit_window;
//      assign dest_rtr[i] = watched_pkt[i][x_cord_width_lp + y_cord_width_lp -1:0];
//      assign src_rtr [i] = 4'b0;
//      assign must_read[i] = ((tracking_cnt[i]==1) & sampled_in[i] & decr[i]);
//      assign incr[i] = (hsk_in[i] ) & !sampled_in[i] & yumi_o[0][0] & (data_i[0][0][x_cord_width_lp + y_cord_width_lp -1:0] == i);        //hsk_in
//      assign decr[i] = (hsk_o[i] & !sampled_out[i] & (data_o[i][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1: width_lp] == 4'h0) & (data_o[i][0][x_cord_width_lp + y_cord_width_lp -1:0] == i));  //hsk_Out
//  end

if(i==8) begin
    assume property ($stable(watched_pkt[i][width_lp - 1 : (x_cord_width_lp + y_cord_width_lp)])); 
      assign hsk_in[8] = (v_i[0][0] );
      assign hsk_o[i] = 1;//v_o[3][0] & ready_and_i[3][0];
      assign ready_to_sample[8] = hsk_in[8] & yumi_o[0][0] & (data_i[0][0][width_lp-1:0] == watched_pkt[8]) & arbit_window;
      assign dest_rtr[8] = watched_pkt[8][x_cord_width_lp + y_cord_width_lp -1:0];
      assign src_rtr [8] = 4'b0;
      assign must_read[8] = ((tracking_cnt[i]==1) & sampled_in[8] & decr[i]);
      assign incr[i] = (hsk_in[i] ) & !sampled_in[i] & yumi_o[0][0] & (data_i[0][0][x_cord_width_lp + y_cord_width_lp -1:0] == 7);        //hsk_in
      assign decr[i] = (hsk_o[i] & !sampled_out[i] & (data_o[7][0][x_cord_width_lp + y_cord_width_lp + width_lp - 1: width_lp] == 4'h0) & (data_o[7][0][x_cord_width_lp + y_cord_width_lp -1:0] == 7));  //hsk_Out
  end

  
  
  if(i<3) begin
      assign watched_pkt[i][x_cord_width_lp + y_cord_width_lp:0] = i +1;
    start: cover property(ready_to_sample[0]);
    check_assum:  assume property ( disable iff((i==dest_rtr[i])) (hsk_in[i] & !yumi_o[i][0])|=> $stable(data_i[i][0]));
//    cover property((yumi_o[i][0]==1 )&(data_i[0][0]==watched_pkt[i]));
//    cover property((yumi_o[i][0]==1) & (data_i[0][0]==watched_pkt[i]) |=> data_i[2][3]==watched_pkt[i]);
      data_integ0_3: assert property( disable iff((i==dest_rtr[i]) ) ((must_read[i] ) |-> (data_o[dest_rtr[i]][0]==colored_pkt[i])));
  end

  if(i==3) begin
      assign watched_pkt[i][x_cord_width_lp + y_cord_width_lp:0] = 7;
      assign colored_pkt[i] = {src_rtr[i], watched_pkt[i]};
      data_integ3_7: assert property( ((must_read[7] ) |-> (data_o[7][0]==colored_pkt[i]))); 

  end

    
    if(((i>3) && (i<7))) begin 
      assign watched_pkt[i][x_cord_width_lp + y_cord_width_lp:0] = i +1;
    start: cover property(ready_to_sample[0]);
    check_assum:  assume property ( disable iff((i==dest_rtr[i])) (hsk_in[i] & !yumi_o[i][0])|=> $stable(data_i[i][0]));
//    cover property((yumi_o[i][0]==1 )&(data_i[0][0]==watched_pkt[i]));
//    cover property((yumi_o[i][0]==1) & (data_i[0][0]==watched_pkt[i]) |=> data_i[2][3]==watched_pkt[i]);
      data_integ4_7: assert property( disable iff((i==dest_rtr[i]) ) ((must_read[i] ) |-> (data_o[dest_rtr[i]][0]==colored_pkt[i])));
  end
  if(i==8) begin
      assign watched_pkt[i][x_cord_width_lp + y_cord_width_lp:0] = 7;
      assign colored_pkt[i] = {src_rtr[i], watched_pkt[i]};
      data_integ0_7: assert property( ((must_read[i] ) |-> (data_o[7][0]==colored_pkt[i]))); 

    end
  end
//    pre_condition:  cover property((hsk_in[0] & !yumi_o[0][0] )|=>  yumi_o[0][0]);

endgenerate







endmodule