
bind design_top mesh4x4_sva #(
  .DATA_WIDTH_P(DATA_WIDTH_P),
  .MESH_EDGE_P (MESH_EDGE_P),
  .medge_lp(medge_lp), 
  .msize_lp(msize_lp),
  .dims_lp (dims_lp),
  .dirs_lp (dirs_lp)
)
U_mesh_sva (.*);


bind bsg_mesh_router router_sva #(
  .width_p(12),
  .x_cord_width_p(2),
  .y_cord_width_p(2)
)
U_router_sva (.*);

//
//bind bsg_mesh_router router_sva #(
//  .width_p(12),
//  .x_cord_width_p(2),
//  .y_cord_width_p(2)
//)
//U_router_sva (.*);


bind bsg_two_fifo fifo_sva #(.ptr_width_lp(1)) // fifo 2 has depth 2^1
fifo_asserts(.*);


