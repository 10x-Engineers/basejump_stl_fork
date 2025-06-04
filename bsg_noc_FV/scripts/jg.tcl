
global env

clear -all

#set lab_path     $env(FPV_PATH)

analyze -sv09 -f /work/bahmed/noc_verif/bsg_noc_org/flist.f

analyze -sv09 /work/bahmed/noc_verif/bsg_noc_org/bind/network_bind.sv \
			  /work/bahmed/noc_verif/bsg_noc_org/sva/mesh_east_south.sv \
			  /work/bahmed/noc_verif/bsg_noc_org/sva/fifo_sva.sv\
			  /work/bahmed/noc_verif/bsg_noc_org/sva/router_sva.sv

# check_cov -init -type all -model all

elaborate  -top design_top -disable_auto_bbox -create_related_covers {precondition witness}

#elaborate  -top design_top -bbox_m bsg_fifo_1r1w_small -create_related_covers {precondition witness}


clock clk -both_edges

reset reset

get_design_info

set_engine_mode auto

set_proofgrid_manager on


#check_assumptions -show -dead_end
#check_assumptions -live -minimize

#prove -covers -all


set_proofmaster on


# Proving all Router Properties
prove -property {design_top\.mesh_routers\[5]*}

# Assuming all Router Properties
assume -from_assert "design_top\.mesh_routers\[5\]*"

set_log_timestamp_mode on

set_proofmaster on
set_proofmaster_dir /work/bahmed/noc_verif/common/bsg_noc_org/


# Proving all Fifo Properties
prove -property {design_top\.fifos_vertical\[0\]\.fifo_up*}

# Assuming all FIFO Properties
assume -from_assert "design_top\.fifos_vertical\[0\]\.fifo_up*"


prove -property {design_top.U_mesh_sva.watch_pkt[0].genblk6.east.data_integ0_3_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[0].genblk6.east.data_integ0_3_east}
prove -property {design_top.U_mesh_sva.watch_pkt[1].genblk6.east.data_integ0_3_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[1].genblk6.east.data_integ0_3_east}
prove -property {design_top.U_mesh_sva.watch_pkt[2].genblk6.east.data_integ0_3_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[2].genblk6.east.data_integ0_3_east}




prove -property {design_top.U_mesh_sva.watch_pkt[0].genblk6.data_integ0_3_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[0].genblk6.data_integ0_3_south}
prove -property {design_top.U_mesh_sva.watch_pkt[1].genblk6.data_integ0_3_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[1].genblk6.data_integ0_3_south}
prove -property {design_top.U_mesh_sva.watch_pkt[2].genblk6.data_integ0_3_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[2].genblk6.data_integ0_3_south}
prove -property {design_top.U_mesh_sva.watch_pkt[3].genblk6.data_integ0_3_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[3].genblk6.data_integ0_3_south}

prove -property {design_top.U_mesh_sva.watch_pkt[4].genblk7.east.data_integ3_7_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[4].genblk7.east.data_integ3_7_east}
prove -property {design_top.U_mesh_sva.watch_pkt[5].genblk7.east.data_integ3_7_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[5].genblk7.east.data_integ3_7_east}
prove -property {design_top.U_mesh_sva.watch_pkt[6].genblk7.east.data_integ3_7_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[6].genblk7.east.data_integ3_7_east}




prove -property {design_top.U_mesh_sva.watch_pkt[4].genblk7.data_integ3_7_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[4].genblk7.data_integ3_7_south}
prove -property {design_top.U_mesh_sva.watch_pkt[5].genblk7.data_integ3_7_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[5].genblk7.data_integ3_7_south}
prove -property {design_top.U_mesh_sva.watch_pkt[6].genblk7.data_integ3_7_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[6].genblk7.data_integ3_7_south}
prove -property {design_top.U_mesh_sva.watch_pkt[7].genblk7.data_integ3_7_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[7].genblk7.data_integ3_7_south}


prove -property {design_top.U_mesh_sva.watch_pkt[8].genblk8.east.data_integ7_11_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[8].genblk8.east.data_integ7_11_east}
prove -property {design_top.U_mesh_sva.watch_pkt[9].genblk8.east.data_integ7_11_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[9].genblk8.east.data_integ7_11_east}
prove -property {design_top.U_mesh_sva.watch_pkt[10].genblk8.east.data_integ7_11_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[10].genblk8.east.data_integ7_11_east}



prove -property {design_top.U_mesh_sva.watch_pkt[8].genblk8.data_integ7_11_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[8].genblk8.data_integ7_11_south}
prove -property {design_top.U_mesh_sva.watch_pkt[9].genblk8.data_integ7_11_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[9].genblk8.data_integ7_11_south}
prove -property {design_top.U_mesh_sva.watch_pkt[10].genblk8.data_integ7_11_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[10].genblk8.data_integ7_11_south}
prove -property {design_top.U_mesh_sva.watch_pkt[11].genblk8.data_integ7_11_south}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[11].genblk8.data_integ7_11_south}

prove -property {design_top.U_mesh_sva.watch_pkt[12].east.data_integ11_15_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[12].east.data_integ11_15_east}
prove -property {design_top.U_mesh_sva.watch_pkt[13].east.data_integ11_15_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[13].east.data_integ11_15_east}
prove -property {design_top.U_mesh_sva.watch_pkt[14].east.data_integ11_15_east}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[14].east.data_integ11_15_east}

prove -property {design_top.U_mesh_sva.watch_pkt[15].genblk10.data_integ0_15}  -time_limit {110h} 

#prove -bg -all 
