
global env

clear -all

#set lab_path     $env(FPV_PATH)

analyze -sv09 -f /work/bahmed/noc_verif/bsg_noc_org/flist.f

analyze -sv09 /work/bahmed/noc_verif/bsg_noc_org/bind/network_bind.sv \
			  /work/bahmed/noc_verif/bsg_noc_org/sva/mesh4x4.sv
#			  /work/bahmed/noc_verif/bsg_noc_org/sva/mesh2x2.sv

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


#all assertions
#prove -property {design_top(\\.[^.]+)*\\.[a-zA-Z0-9_]*} -regexp


# Proving all Router Properties
prove -property {design_top\.mesh_rou*}

# Assuming all Router Properties
assume -from_assert "design_top\.mesh_rou*"



# Proving all Fifo Properties
prove -property {design_top\.fifos*}

# Assuming all FIFO Properties
assume -from_assert "design_top\.fifos*"


prove -property {design_top.U_mesh_sva.watch_pkt[0].genblk5.data_integ0_3}
prove -property {design_top.U_mesh_sva.watch_pkt[1].genblk5.data_integ0_3}
prove -property {design_top.U_mesh_sva.watch_pkt[2].genblk5.data_integ0_3}
prove -property {design_top.U_mesh_sva.watch_pkt[3].genblk6.data_integ3_7} 
prove -property {design_top.U_mesh_sva.watch_pkt[4].genblk7.data_integ4_7}
prove -property {design_top.U_mesh_sva.watch_pkt[5].genblk7.data_integ4_7}
prove -property {design_top.U_mesh_sva.watch_pkt[6].genblk7.data_integ4_7}

assume -from_assert  {design_top.U_mesh_sva.watch_pkt[0].genblk5.data_integ0_3}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[1].genblk5.data_integ0_3}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[2].genblk5.data_integ0_3}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[3].genblk6.data_integ3_7}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[4].genblk7.data_integ4_7}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[5].genblk7.data_integ4_7}
assume -from_assert  {design_top.U_mesh_sva.watch_pkt[6].genblk7.data_integ4_7}

prove -property {design_top.U_mesh_sva.watch_pkt[8].genblk8.data_integ0_7}  -time_limit {72h}


#prove -bg -all 
