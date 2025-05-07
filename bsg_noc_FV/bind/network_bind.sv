bind design_top mesh2x2_sva #(
  .DATA_WIDTH_P(DATA_WIDTH_P),
  .MESH_EDGE_P (MESH_EDGE_P),
  .medge_lp(medge_lp), 
  .msize_lp(msize_lp),
  .dims_lp (dims_lp),
  .dirs_lp (dirs_lp)
)
U_mesh_sva (.*);

/*
bind design_top network_sva #(
  .DATA_WIDTH_P(DATA_WIDTH_P),
  .MESH_EDGE_P (MESH_EDGE_P),
  .medge_lp(medge_lp), 
  .msize_lp(msize_lp),
  .dims_lp (dims_lp),
  .dirs_lp (dirs_lp)
)
U_mesh_sva (.*); 
*/