
module router_sva
  import bsg_noc_pkg::*;
  import bsg_mesh_router_pkg::*;
  #(parameter `BSG_INV_PARAM(width_p )
    , parameter `BSG_INV_PARAM(x_cord_width_p )
    , parameter `BSG_INV_PARAM(y_cord_width_p )
    , parameter dims_p = 2
    , parameter dirs_lp = (2*dims_p)+1
)
  (
    input clk_i
    , input reset_i

    , input [dirs_lp-1:0][width_p-1:0] data_i
    , input [dirs_lp-1:0]              v_i
    , input logic [dirs_lp-1:0]       yumi_o

    , input   [dirs_lp-1:0]               ready_and_i
    , input  [dirs_lp-1:0][width_p-1:0]  data_o
    , input logic [dirs_lp-1:0]          v_o
    );

//-------ROuter assertions------------------


logic [dirs_lp-1:0] one_hot;
logic [dirs_lp-1:0][$clog2(dirs_lp)-1:0] index_value;
logic [dirs_lp-1:0] watch_req_q, req_q;
logic  hsk_rtr_out, single_req;
logic [2:0]high_reqs_i;
logic [$clog2(dirs_lp):0] watched_req;
logic [x_cord_width_p + y_cord_width_p -1:0]position;


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

function automatic integer log2_function(input integer value);
integer i;
begin
    log2_function = 0;
    for (i = value; i > 1; i = i >> 1) begin
        log2_function = log2_function + 1;
    end
end
endfunction

//--------- Seeing handshake for the specific channel and avoiding if multiple channels requesting same output channel


always @(*) begin
    case (bsg_mesh_router.req[0])
        5'h1   : begin
                single_req  = (bsg_mesh_router.xbar[0].conc_req != 0) && (bsg_mesh_router.xbar[0].conc_req == (1 << log2_function(bsg_mesh_router.xbar[0].conc_req)));
                hsk_rtr_out  =  single_req ? (bsg_mesh_router.xbar[0].conc_data[(log2_function(bsg_mesh_router.xbar[0].grants))] == data_i[0]) : 1'b0;
        end
        5'h2   :  begin
                single_req  = (bsg_mesh_router.xbar[1].conc_req != 0) && (bsg_mesh_router.xbar[1].conc_req == (1 << log2_function(bsg_mesh_router.xbar[1].conc_req)));
                hsk_rtr_out  =  single_req ? (bsg_mesh_router.xbar[1].conc_data[(log2_function(bsg_mesh_router.xbar[1].grants))] == data_i[0]) : 1'b0;
        end
        5'h4   : begin
                single_req  = (bsg_mesh_router.xbar[2].conc_req != 0) && (bsg_mesh_router.xbar[2].conc_req == (1 << log2_function(bsg_mesh_router.xbar[2].conc_req)));
                hsk_rtr_out  =  single_req ? (bsg_mesh_router.xbar[2].conc_data[(log2_function(bsg_mesh_router.xbar[2].grants))] == data_i[0]) : 1'b0;
        end
        5'h8   :  begin
                single_req  = (bsg_mesh_router.xbar[3].conc_req != 0) && (bsg_mesh_router.xbar[3].conc_req == (1 << log2_function(bsg_mesh_router.xbar[3].conc_req)));
                hsk_rtr_out  =  single_req ? (bsg_mesh_router.xbar[3].conc_data[(log2_function(bsg_mesh_router.xbar[3].grants))] == data_i[0]) : 1'b0;
        end
        5'h10  :  begin
                single_req  = (bsg_mesh_router.xbar[4].conc_req != 0) && (bsg_mesh_router.xbar[4].conc_req == (1 << log2_function(bsg_mesh_router.xbar[4].conc_req)));
                hsk_rtr_out  =  single_req ? (bsg_mesh_router.xbar[4].conc_data[(log2_function(bsg_mesh_router.xbar[4].grants))] == data_i[0]) : 1'b0;
        end
        default: hsk_rtr_out = '0; // Default case to avoid latches
    endcase
end

//function automatic int get_router_id(input int x, input int y);
//  localparam int GRID_WIDTH = 4;
//
//  get_router_id = y * GRID_WIDTH + x;
//endfunction

//assume property ($stable(watched_req)); 
assume property (watched_req < 5);
assume property (watched_req > 0);
//

assign watch_req_q = log2_function(bsg_mesh_router.req[0]);

//check_Req: cover property(bsg_mesh_router.req[watched_req]>0);

//assign position = get_router_id(my_x_i, my_y_i);
//
//assume_data:  assume property (data_i[0][width_p - 1: width_p - x_cord_width_p - y_cord_width_p -1] == position);
//

router_data_check: assert property(hsk_rtr_out & v_o[watch_req_q] |-> ( data_i[0] == data_o[watch_req_q]));   


  
//-------------Router assertions-------------

generate
  for (genvar i = 0; i < dirs_lp; i++) begin: rtr_hndshk
    in_hndshk:  assert property (@(posedge clk_i) disable iff (reset_i) (yumi_o[i] |-> v_i[i]));
    out_hndshk:  assert property (@(posedge clk_i) disable iff (reset_i) (v_o[i] |-> ready_and_i[i] ));
    no_out_without_in:  assert property (@(posedge clk_i) disable iff (reset_i) ((|v_o) |-> (|v_i)));
    valid_in_has_req:  assert property (@(posedge clk_i) disable iff (reset_i) (v_i[i] |-> (|bsg_mesh_router.req[i])));
   end
endgenerate


    

//-----Decoder assertions-------------

//assert property (@(negedge clk_i) disable iff (reset_i)  $countones(req_o) <= 1);
//
//
//assert property (@(posedge clk_i) disable iff (reset_i)
//  req[P] |-> ((x_dirs_i == my_x_i) && (y_dirs_i == my_y_i))
//);
//
////----Decoder assertions-----------------------
//
//assert ($onehot(sel_one_hot_i));
//
//always_comb begin
//  if (els_p > 0) begin
//    for (int i = 0; i < els_p; i++) begin
//      if (sel_one_hot_i[i]) begin
//        assert (data_o == data_i[i])
//          else $fatal("data_o does not match selected data_i[%0d] at time %t", i, $time);
//      end
//    end
//  end
//end
//

//-------Mux_onehot assertions-------------


endmodule