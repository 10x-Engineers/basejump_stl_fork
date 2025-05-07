module network_sva
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
  input  logic [msize_lp-1:0][dirs_lp-1:0][width_lp-1:0] data_i,
  
  input logic [msize_lp-1:0][dirs_lp-1:0] yumi_o,
  input logic [msize_lp-1:0][dirs_lp-1:0] v_o,
  input logic [msize_lp-1:0][dirs_lp-1:0][width_lp-1:0] data_o
);
  localparam width_lp = (`DATA_WIDTH_P) + x_cord_width_lp + y_cord_width_lp;

  localparam x_cord_width_lp = MESH_EDGE_P;
  localparam y_cord_width_lp = MESH_EDGE_P;
  localparam MAX             = 5;

wire ready_to_sample_out [msize_lp-1:0][dirs_lp-1:0];
wire [3:0] decr_tc [msize_lp-1:0][dirs_lp-1:0];
wire [3:0] decr_tc [msize_lp-1:0][dirs_lp-1:0];
//wire [dirs_lp-1:0] hsk_in ;
reg  [MAX:0] tracking_cnt [msize_lp-1:0][dirs_lp-1:0];
//reg  seen_in_watched_pkt [msize_lp-1:0][dirs_lp-1:0];
//reg  seen_out_watched_pkt [msize_lp-1:0][dirs_lp-1:0];



//-------CLocking block------------

    default clocking cb1
        @(posedge clk);
    endclocking
//-------CLocking block------------


//----Aux Code-------------

/*    logic [msize_lp-1:0][dirs_lp-1:0][width_lp-1:0]  watched_pkt;

generate
  for (genvar i = 0; i < msize_lp; i++) begin : routers
    for (genvar j = i+1; j < dirs_lp; j++) begin: links
    assume property ($stable(watched_pkt[i][j]));
  end
  end
endgenerate
*/


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

    // ----------------------------------------------
    //                   ASSUMPTIONS
    // ----------------------------------------------
     logic [msize_lp-1:0][2:0] watched_req;


//--------------Aux code-----

//    assign ready_to_sample = valid_i[watched_req] & ready_and_i[watched_req];
//
//always @(posedge clk)
//  if (!reset)
//    sampled_in <= 1'b0;
//  else if (ready_to_sample)
//    sampled_in <= 1'b1;
//always @(posedge clk)
//  if (!reset)
//    sampled_out <= 1'b0;
//  else if (sampled_in && valid_o[watched_req])
//    sampled_out <= 1'b1;
//


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


logic [msize_lp-1:0][dirs_lp-1:0] hsk_in;

generate
  for (genvar i = 0; i < msize_lp; i++) begin: o_router_hsk
    for (genvar j = 0; j < dirs_lp; j++) begin: O_link_hsk
      assign hsk_in[i][j] = v_i[i][j] & ready_and_i[i][j];
    end end
endgenerate
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
logic [2:0] test;
assign test = log2_function(4);


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

generate
  for (genvar i = 0; i < msize_lp; i++) begin: o_router
    assume property ($stable(watched_req[i])); 
    assume property (watched_req[i] <5);
    assume property (watched_req[i] >0 );  end
endgenerate




      assume property (ready_and_i[0] == 5'h15);
      assume property (ready_and_i[1] == 5'h17);
      assume property (ready_and_i[2] == 5'h17);
      assume property (ready_and_i[3] == 5'h13);
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
      assume property(data_i[0][0] == 8'h02);


     // ----------------------------------------------
    //                   ASSERTIONS
    // ----------------------------------------------
//      assert property(v_i[0][0] |-> (data_i[0][0] == data_o[0][2]));   
//      assert property(hsk_out[8] |-> ( data_i[8][watched_req[8]] == data_o[8][watch_req_q[8]]));   


generate
  for (genvar i = 0; i < 16; i++) begin: router_acccess

      assign watch_req_q[i] = log2_function(design_top.mesh_routers[i].router.req[watched_req[i]]);
      assert property(hsk_out[i] & v_o[i][watch_req_q[i]] |-> ( data_i[i][watched_req[i]] == data_o[i][watch_req_q[i]]));   

    end 

endgenerate



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
cover property(hsk_out[1]==1);
//    router_4_valid: cover property((v_o[1][1]));
//
//    router_4_IO_valid: cover property(v_i[1][1] |-> ##[0:$]v_o[1][1]);
//    router_4_ready_valid: cover property(ready_and_i[1][1] |-> ##[0:$]v_o[1][1]);


endmodule