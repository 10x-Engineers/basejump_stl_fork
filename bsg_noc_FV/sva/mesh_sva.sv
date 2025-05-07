module mesh_sva
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
  input  logic [msize_lp-1:0][dirs_lp-1:0][4+ width_lp-1:0] data_i,
  
  input logic [msize_lp-1:0][dirs_lp-1:0] yumi_o,
  input logic [msize_lp-1:0][dirs_lp-1:0] v_o,
  input logic [msize_lp-1:0][dirs_lp-1:0][4 + width_lp-1:0] data_o
);
  localparam width_lp = (`DATA_WIDTH_P) + x_cord_width_lp + y_cord_width_lp;

  localparam x_cord_width_lp = MESH_EDGE_P;
  localparam y_cord_width_lp = MESH_EDGE_P;
  localparam MAX             = 5;

wire [3:0] decr_tc [msize_lp-1:0][dirs_lp-1:0];
wire [3:0] decr_tc [msize_lp-1:0][dirs_lp-1:0];
//wire [dirs_lp-1:0] hsk_in ;
//reg  seen_in_watched_pkt [msize_lp-1:0][dirs_lp-1:0];
//reg  seen_out_watched_pkt [msize_lp-1:0][dirs_lp-1:0];

    logic [msize_lp-1:0][2:0] watched_req;
    logic [msize_lp-1:0][width_lp-1:0] tracking_cnt;
    logic [7:0] watched_pkt;
    logic [msize_lp-1:0]  ready_to_sample, sampled_in, sampled_out, must_read, ready_to_sample_out;
    logic [msize_lp-1:0] [3:0] dest_rtr, src_rtr;
    logic [msize_lp-1:0] [4 + width_lp  -1: 0] colored_pkt;
    logic [msize_lp-1:0]incr, decr, hsk_in, hsk_o;
  logic [2:0] test;

//-------CLocking block------------

    default clocking cb1
        @(posedge clk);
    endclocking
//-------CLocking block------------


//----Aux Code-------------


/*
generate
    for (genvar g_i=0; g_i<msize_lp; g_i=g_i+1) begin
        for (genvar b_i=0; b_i<dirs_lp; b_i=b_i+1)begin
    //assign hsk_out [g_i][b_i] = v_i[g_i][b_i] && group_bank_enable[g_i][b_i]; // do we need a handshake
        always @(posedge clk or negedge resethbl )
            if (!reset)
                seen_in_watched_id[0][0][g_i][b_i] <= 1'b0;
            else if (hsk_in[0][0] && req_out[0][0][g_i][b_i] && (data_i[g_i][b_i]==watched_id[g_i][b_i]) && !other_req_active[0])
                seen_in_watched_id[0][0][g_i][b_i] <= 1'b1;
        end
    end
endgenerate

*/
//--------------Aux code-----

//assume property(v_i[5][0]==1);
generate
  for (genvar i = 0; i < msize_lp; i++) begin: smart_trk

    always @(posedge clk)
      if (reset)
        tracking_cnt[i] <= 'b0;
      else
        tracking_cnt[i] <= tracking_cnt[i] + incr[i] - decr[i];


    always @(posedge clk) begin 
      if (reset) begin 
        sampled_in[i] <= 1'b0;
       end
      else if (ready_to_sample[i]) begin
        sampled_in[i] <= 1'b1;
      end end
    always @(posedge clk) begin
      if (reset) begin 
//        sampled_out[dest_rtr[i]] <= 1'b0;
        test <=3'b001;
      end
//      else if (sampled_in[i] & (data_o[dest_rtr[i]][0]==colored_pkt[i]) ) begin 
      else if (must_read[i]) begin 
        sampled_out[dest_rtr[i]] <= 1'b1;
        test <=3'b101;
      end end

  end
  
endgenerate

    assume property ($stable(watched_pkt[7:4])); 

//    assume property (yumi_o[0][0]==v_i[0][0]);
//    assume property (data_i[0][1][11:0]==12'h000);
//    assume property (data_i[0][4][11:0]==12'h000);
//    assume property (data_i[0][2][11:0]==12'h000);
//    assume property (data_i[0][3][11:0]==12'h000);
//    assume property (data_i[1][0][7:0]==8'h00);
//    assume property (data_i[1][2][11:0]==12'h000);
//    assume property (data_i[1][3][11:0]==12'h000);
//    assume property (data_i[1][4][11:0]==12'h000);

generate
  for (genvar i = 0; i < msize_lp; i++) begin: watch_pkt
//    assume property ($stable(watched_pkt[7:4])); 
//    if(i != watched_pkt[3:0]) begin
//      assume property(v_i[0]==5'h01);
      assign watched_pkt[3:0] = 4'h1;
//      assign hsk_in[i] = (v_i[i][0] & ready_and_i[i][0]);
      assign hsk_in[i] = v_i[i][0];// & ready_and_i[i][0]);
      assign hsk_o[i] = v_o[dest_rtr[i]][0];
      assign ready_to_sample[i] = hsk_in[i] & yumi_o[i][0] & (data_i[i][0][7:0] == watched_pkt);
      assign dest_rtr[i] = watched_pkt[x_cord_width_lp + y_cord_width_lp -1:0];
      assign src_rtr [i] = i[x_cord_width_lp + y_cord_width_lp:0];
      assign colored_pkt[i] = {src_rtr[i], watched_pkt};
      assign must_read[i] = ((tracking_cnt[i]==1) & sampled_in[i] & decr[i]);
      assign incr[i] = (hsk_in[i] ) & !sampled_in[i] & (data_i[i][0][3:0] == dest_rtr[i]);        //hsk_in
      assign decr[i] = (v_o[dest_rtr[i]][0] & !sampled_out[dest_rtr[i]]  & yumi_o[1][1] & (data_o[dest_rtr[i]][0][11:8] == src_rtr[i]) & (data_o[dest_rtr[i]][0][3:0] == dest_rtr[i]));  //hsk_Out
//      cover property(!ready_to_sample[i] |=> ready_to_sample[i]);
//      cover property(ready_to_sample[i] |=> sampled_in[i]);

  if(i==0) begin
    assume property ((hsk_in[i] & !yumi_o[i][0])|=> $stable(data_i[i][0]));
    cover property((yumi_o[i][0]==1 )&(data_i[0][0]==watched_pkt));
    cover property((yumi_o[i][0]==1) & (data_i[0][0]==watched_pkt) |=> data_i[1][1]==watched_pkt);
      data_integ: assert property( disable iff((i==dest_rtr[i]) ) ((must_read[i]  & yumi_o[1][1]) |-> ##[0:1](data_o[dest_rtr[i]][0]==colored_pkt[i]))); end
//      router_i: assert property(sampled_in[i] |=> ##[0:$]sampled_out[dest_rtr[i]]);
//      cover property(incr);
  end
//    pre_condition:  cover property((hsk_in[0] & !yumi_o[0][0] )|=>  yumi_o[0][0]);

endgenerate


// Helper assertions for smart tracker


    //--------------------------------------------------------------------------------------------
    //-- key invariants --
    //--------------------------------------------------------------------------------------------
/*    as_inv_L0:
        assert property (ready_to_sample && sampled_out |-> tracking_cnt==0);    

    as_inv_L1:
        assert property ( sampled_out |-> ready_to_sample && (tracking_cnt == 0)); 

    as_inv_L2:
        assert property (!sampled_in |-> (tracking_counter <= ptr_count));
     
    as_inv_L3:
        assert property ( sampled_in[0] && !sample_out_started |-> (tracking_counter > 0));    

    as_inv_L4:
        assert property (`cr input_sampled_completely && !sample_out_started |-> (tracking_counter <= ptr_count));
    
    as_inv_L5:
        assert property (`cr input_sampled_completely  && !sample_out_started && (pkt_rptr[rptr]==0) 
                             |-> 
                             data_in_reg[iptr][pkt_rptr[rptr]][DATA_WIDTH-1:0] == wd[0]);

    as_inv_L00: 
        assert property (`cr input_sampled_completely && not_sampled_out_completely 
                             |-> 
                             pkt_rptr[iptr] == 0);


*/



//  cover_2_failure: cover property((must_read[2] |-> (data_o[dest_rtr[2]][0]==colored_pkt[2])));

//assume property(colored_pkt[1]==12'h102);

//router0_to_1 : assert property(must_read[0] |-> (data_o[1][0]==colored_pkt[1]) );
//router1_to_2 : assert property(must_read[1] |-> (data_o[2][0]==colored_pkt[1]) );

//assume_1_to_2 : assume property (must_read[1] |-> (data_o[2][0]==colored_pkt[1]) );


//cover_1_to_2 : cover property(sampled_in[1] |-> ##8 (data_o[2][0]==colored_pkt[1]) );     // at 3 it holds input 

//router0_to_3 : assert property(must_read[0] |-> (data_o[3][0]==colored_pkt[0]) );
//router6:  assert property(sampled_in[5] |=> ##[0:$]sampled_out[5]);
//router5:  assert property(sampled_in[4] |=> ##[0:$]sampled_out[4]);

    // ----------------------------------------------
    //                   ASSUMPTIONS
    // ----------------------------------------------




    logic [dirs_lp-1:0] one_hot;
    logic [$clog2(dirs_lp)-1:0] index;
    logic [msize_lp-1:0][dirs_lp-1:0][$clog2(dirs_lp)-1:0] index_value;

  function automatic int one_hot_to_index(input logic [dirs_lp-1:0] one_hot);
    int i;
    begin
//      one_hot_to_index = 0;  // Default error value (no bit set)
      for (i = 0; i < dirs_lp; i++) begin
        if (one_hot[i]) begin
          one_hot_to_index = i;
          break;  // Exit the loop once the first set bit is found
        end
      end
    end
  endfunction


logic [msize_lp-1:0] hsk_in;
/*
generate
  for (genvar i = 0; i < msize_lp; i++) begin: o_router_hsk
      assign hsk_in[i] = v_i[i][0] & ready_and_i[i][0];
    end
endgenerate
*/
//--------------Aux code-----

 
//---------------------------Smart tracker-------------------

      logic [msize_lp-1:0][dirs_lp-1:0] watch_req_q, req_q, watch_req_t, watch_grants, high_reqs_i, prio, direction;
      logic [7:0] data_out;
      logic [msize_lp-1:0] hsk_out, single_req;
      logic [msize_lp-1:0][2:0]high_reqs_i;

//      assign watch_req_q = one_hot_to_index(design_top.mesh_routers[8].router.req[watched_req]);
//      assign watch_grants = one_hot_to_index(design_top.mesh_routers[8].router.xbar[0].grants);
//      assign watch_req_t = one_hot_to_index(2);
//      assign req_q = design_top.mesh_routers[8].router.req[watched_req];
//      assign data_out = design_top.mesh_routers[8].router.xbar[0].data_o[watch_req_q];
      
//      assign hsk_out = (data_i[8][watched_req] == data_o[8][watch_req_q]) ? 1'b1 : 1'b0;


function automatic integer log2_function(input integer value);
    integer i;
    begin
        log2_function = 0;
        for (i = value; i > 1; i = i >> 1) begin
            log2_function = log2_function + 1;
        end
    end
endfunction


generate 
     for (genvar i = 0; i < 16; i++) begin: direction_acccess
          always @(*) begin
            case (design_top.mesh_routers[i].router.req[watched_req[i]])
                5'h1   : begin
                        single_req[i]  = (design_top.mesh_routers[i].router.xbar[0].conc_req != 0) && (design_top.mesh_routers[i].router.xbar[0].conc_req == (1 << log2_function(design_top.mesh_routers[i].router.xbar[0].conc_req)));
                        hsk_out[i]  =  single_req[i] ? (design_top.mesh_routers[i].router.xbar[0].conc_data[(log2_function(design_top.mesh_routers[i].router.xbar[0].grants))] == data_i[watched_req[i]]) : 1'b0;
                end
                5'h2   :  begin
                        single_req[i]  = (design_top.mesh_routers[i].router.xbar[1].conc_req != 0) && (design_top.mesh_routers[i].router.xbar[1].conc_req == (1 << log2_function(design_top.mesh_routers[i].router.xbar[1].conc_req)));
                        hsk_out[i]  =  single_req[i] ? (design_top.mesh_routers[i].router.xbar[1].conc_data[(log2_function(design_top.mesh_routers[i].router.xbar[1].grants))] == data_i[watched_req[i]]) : 1'b0;
                end
                5'h4   : begin
                        single_req[i]  = (design_top.mesh_routers[i].router.xbar[2].conc_req != 0) && (design_top.mesh_routers[i].router.xbar[2].conc_req == (1 << log2_function(design_top.mesh_routers[i].router.xbar[2].conc_req)));
                        hsk_out[i]  =  single_req[i] ? (design_top.mesh_routers[i].router.xbar[2].conc_data[(log2_function(design_top.mesh_routers[i].router.xbar[2].grants))] == data_i[watched_req[i]]) : 1'b0;
                end
                5'h8   :  begin
                        single_req[i]  = (design_top.mesh_routers[i].router.xbar[3].conc_req != 0) && (design_top.mesh_routers[i].router.xbar[3].conc_req == (1 << log2_function(design_top.mesh_routers[i].router.xbar[3].conc_req)));
                        hsk_out[i]  =  single_req[i] ? (design_top.mesh_routers[i].router.xbar[3].conc_data[(log2_function(design_top.mesh_routers[i].router.xbar[3].grants))] == data_i[watched_req[i]]) : 1'b0;
                end
                5'h10  :  begin
                        single_req[i]  = (design_top.mesh_routers[i].router.xbar[4].conc_req != 0) && (design_top.mesh_routers[i].router.xbar[4].conc_req == (1 << log2_function(design_top.mesh_routers[i].router.xbar[4].conc_req)));
                        hsk_out[i]  =  single_req[i] ? (design_top.mesh_routers[i].router.xbar[4].conc_data[(log2_function(design_top.mesh_routers[i].router.xbar[4].grants))] == data_i[watched_req[i]]) : 1'b0;
                end
                default: hsk_out[i] = '0; // Default case to avoid latches
            endcase
        end
     end
endgenerate  

     // ----------------------------------------------
    //                   ASSUMPTIONS
    // ----------------------------------------------
/*
generate
  for (genvar i = 0; i < msize_lp; i++) begin: o_router
    assume property ($stable(watched_req[i])); end
//    assume property (watched_req[i] <5);
//    assume property (watched_req[i] >0 );  end
endgenerate
*/
//      assume property (data_i[0][0][3:0] == 4'h01);
//      assume property (data_i[0][0][11:8] == 4'h0);
//      assume property (data_i[1][0][11:8] == 4'h1);
//      assume property (data_i[2][0][11:8] == 4'h2);
//      assume property (data_i[3][0][11:8] == 4'h3);
//      assume property (data_i[4][0][11:8] == 4'h4);
//      assume property (data_i[5][0][11:8] == 4'h5);
//      assume property (data_i[6][0][11:8] == 4'h6);
//      assume property (data_i[7][0][11:8] == 4'h7);
//      assume property (data_i[8][0][11:8] == 4'h8);
//      assume property (data_i[9][0][11:8] == 4'h9);
//      assume property (data_i[10][0][11:8] == 4'ha);
//      assume property (data_i[11][0][11:8] == 4'hb);
//      assume property (data_i[12][0][11:8] == 4'hc);
//      assume property (data_i[13][0][11:8] == 4'hd);
//      assume property (data_i[14][0][11:8] == 4'he);
//      assume property (data_i[15][0][11:8] == 4'hf);
//      assume property (v_i[0]==5'h1);
//      assume property (v_i[1]==5'h2);
//
//

//      assume property (ready_and_i[0] == 5'h15); //15
//      assume property (ready_and_i[1] == 5'h17);  //17
//      assume property (ready_and_i[2] == 5'h17);
//      assume property (ready_and_i[3] == 5'h13);
//      assume property (ready_and_i[4] == 5'h1d);
//      assume property (ready_and_i[5] == 5'h1f);
//      assume property (ready_and_i[6] == 5'h1f);
//      assume property (ready_and_i[7] == 5'h1b);
//      assume property (ready_and_i[8] == 5'h1d);
//      assume property (ready_and_i[9] == 5'h1f);
//      assume property (ready_and_i[10] == 5'h1f);
//      assume property (ready_and_i[11] == 5'h1b);
//      assume property (ready_and_i[12] == 5'hd);
//      assume property (ready_and_i[13] == 5'hf);
//      assume property (ready_and_i[14] == 5'hf);
//      assume property (ready_and_i[15] == 5'hb);
//      assume property(data_i[0][0] == 8'h02);


     // ----------------------------------------------
    //                   ASSERTIONS
    // ----------------------------------------------
//      assert property(v_i[0][0] |-> (data_i[0][0] == data_o[0][2]));   
//      assert property(hsk_out[8] |-> ( data_i[8][watched_req[8]] == data_o[8][watch_req_q[8]]));   


generate
  for (genvar i = 0; i < 16; i++) begin: router_acccess

      assign watch_req_q[i] = log2_function(design_top.mesh_routers[i].router.req[watched_req[i]]);
//      assert property(hsk_out[i] & v_o[i][watch_req_q[i]] |-> ( data_i[i][watched_req[i]] == data_o[i][watch_req_q[i]]));   

    end 

endgenerate
//      assert property(hsk_out[1] & v_o[1][watch_req_q[1]] |-> ( data_i[1][watched_req[1]] == data_o[1][watch_req_q[1]]));   



//---------------------------Smart tracker-------------------
//property request_zero;
//  @(posedge clk) disable iff (rst) (request==0) |=> !grant_valid;
//
//endproperty
//request0: assert property(request_zero);
/*
generate
  for (genvar i = 0; i < msize_lp; i++) begin: o_router
    for (genvar j = i+1; j < dirs_lp; j++) begin: O_link
        property valid_o;
            @(posedge clk) disable iff (reset)
            (!v_o[i][j] |->  (data_o[i][j]==0));
        endproperty
        assert property(valid_o);  end  end
endgenerate





generate
  for (genvar i = 0; i < 16; i++) begin : handshake
    property valid_handshake;
        @(posedge clk) disable iff (reset)
        (v_o[i] && ready_and_i[i]) |-> ##1 yumi_o[i];
    endproperty
assert property(valid_handshake);  end
endgenerate
*/
    // ---------------------------------------------
    //                    COVERS
    // ---------------------------------------------
//cover property(hsk_out[1]==1);
//    router_4_valid: cover property((v_o[1][1]));
//
//    router_4_IO_valid: cover property(v_i[1][1] |-> ##[0:$]v_o[1][1]);
//    router_4_ready_valid: cover property(ready_and_i[1][1] |-> ##[0:$]v_o[1][1]);


endmodule