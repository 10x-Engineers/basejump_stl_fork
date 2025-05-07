#----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2019.06
# platform  : Linux 3.10.0-1160.118.1.el7.x86_64
# version   : 2019.06 FCS 64 bits
# build date: 2019.06.29 18:06:18 PDT
#----------------------------------------
# started Tue Mar 18 14:07:12 PKT 2025
# hostname  : localhost.localdomain
# pid       : 52746
# arguments : '-label' 'session_0' '-console' 'localhost.localdomain:40100' '-style' 'windows' '-data' 'AQAAADx/////AAAAAAAAA3oBAAAAEABMAE0AUgBFAE0ATwBWAEU=' '-proj' '/work/bahmed/noc_verif/bsg_noc/jgproject/sessionLogs/session_0' '-init' '-hidden' '/work/bahmed/noc_verif/bsg_noc/jgproject/.tmp/.initCmds.tcl' '/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl'

global env

clear -all

#set lab_path     $env(FPV_PATH)

analyze -sv09 -f /work/bahmed/noc_verif/bsg_noc/flist.f

analyze -sv09 /work/bahmed/noc_verif/bsg_noc/bind/network_bind.sv \
			  /work/bahmed/noc_verif/bsg_noc/sva/network_sva.sv

# check_cov -init -type all -model all

elaborate  -top design_top -disable_auto_bbox -create_related_covers {precondition witness}

clock clk -both_edges
reset reset

get_design_info

set_engine_mode auto

set_proofgrid_manager on

prove -bg -all
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[9]._assert_23} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23:witness1} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva._cover_23 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_24} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_24} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[2]._assert_24} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_24} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_24} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_24} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva._assert_22 -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_23} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva._cover_23 -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_24} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[14]._assert_21:witness1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[12]._assert_21:witness1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[4]._assert_21:witness1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[0]._assert_21:witness1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[2]._assert_21:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
