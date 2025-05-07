
global env

clear -all

#set lab_path     $env(FPV_PATH)

analyze -sv09 -f /work/bahmed/noc_verif/bsg_noc/flist.f

analyze -sv09 /work/bahmed/noc_verif/bsg_noc/bind/network_bind.sv \
			  /work/bahmed/noc_verif/bsg_noc/sva/mesh2x2.sv
#			  /work/bahmed/noc_verif/bsg_noc/sva/mesh_sva.sv
#			  /work/bahmed/noc_verif/bsg_noc/sva/network_sva.sv

# check_cov -init -type all -model all

elaborate  -top design_top -disable_auto_bbox -create_related_covers {precondition witness}



clock clk -both_edges
reset reset

get_design_info

set_engine_mode auto

set_proofgrid_manager on

prove -bg -all
