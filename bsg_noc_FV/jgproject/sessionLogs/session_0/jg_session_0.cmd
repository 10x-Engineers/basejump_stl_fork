#----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2019.06
# platform  : Linux 3.10.0-1160.118.1.el7.x86_64
# version   : 2019.06 FCS 64 bits
# build date: 2019.06.29 18:06:18 PDT
#----------------------------------------
# started Mon Mar 24 09:49:03 PKT 2025
# hostname  : localhost.localdomain
# pid       : 55182
# arguments : '-label' 'session_0' '-console' 'localhost.localdomain:42721' '-style' 'windows' '-data' 'AQAAADx/////AAAAAAAAA3oBAAAAEABMAE0AUgBFAE0ATwBWAEU=' '-proj' '/work/bahmed/noc_verif/bsg_noc/jgproject/sessionLogs/session_0' '-init' '-hidden' '/work/bahmed/noc_verif/bsg_noc/jgproject/.tmp/.initCmds.tcl' '/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl'

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
clear
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
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[0]._assert_22} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[14]._assert_22} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.router_acccess[1]._assert_22} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[15]._assert_22:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[15]._assert_23:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[15]._assert_23:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_3} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.router_acccess[12]._assert_24:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[11]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[10]._cover_4} -new_window
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
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_3} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_4} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_5} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[2]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[4]._cover_5} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:2] + 1] -window visualize:2; visualize -freeze [visualize -get_length -window visualize:2] -window visualize:2; visualize -replot -bg -window visualize:2
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[4]._cover_5} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[4]._cover_4} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:2] + 1] -window visualize:2; visualize -freeze [visualize -get_length -window visualize:2] -window visualize:2; visualize -replot -bg -window visualize:2
visualize -min_length [expr [visualize -get_length -window visualize:2] + 1] -window visualize:2; visualize -freeze [visualize -get_length -window visualize:2] -window visualize:2; visualize -replot -bg -window visualize:2
visualize -min_length [expr [visualize -get_length -window visualize:2] + 1] -window visualize:2; visualize -freeze [visualize -get_length -window visualize:2] -window visualize:2; visualize -replot -bg -window visualize:2
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_3} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_4} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_6} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_6} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_6} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_6} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[8]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[4]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_6} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_8} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_7} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5]._cover_7} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.router6:witness1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[5].router0:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[7].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:precondition1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:precondition1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:precondition1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ:witness1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].router_i:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:2] + 1] -window visualize:2; visualize -freeze [visualize -get_length -window visualize:2] -window visualize:2; visualize -replot -bg -window visualize:2
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.router0_to_2:witness1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_1 -new_window
visualize -property <embedded>::design_top.U_mesh_sva.router0_to_1:precondition1 -new_window
visualize -property <embedded>::design_top.U_mesh_sva.router0_to_1:witness1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.router0_to_2:precondition1 -new_window
visualize -property <embedded>::design_top.U_mesh_sva.router0_to_2:witness1 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -property <embedded>::design_top.U_mesh_sva.router0_to_2:witness1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[2].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
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
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[2].data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[3].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
prove -bg -all
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva._assert_42:precondition1 -new_window
visualize -property <embedded>::design_top.U_mesh_sva._assert_42:witness1 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:1] + 1] -window visualize:1; visualize -freeze [visualize -get_length -window visualize:1] -window visualize:1; visualize -replot -bg -window visualize:1
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
visualize -property <embedded>::design_top.U_mesh_sva.router1_to_2:witness1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_2_failure -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.cover_1_to_2 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[3].genblk1.data_integ:witness1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[3].genblk1.data_integ:witness1} -new_window
 check_assumptions -show -dead_end to show this property in the property table
 check_assumptions -show -dead_end
 check_assumptions -show -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
 check_assumptions -show -dead_end
 check_assumptions -show -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[2].genblk1.data_integ:witness1} -new_window
check_assumptions -show -dead_end
get_design_info -property {<embedded>::design_top.U_mesh_sva.watch_pkt[2].genblk1.data_integ} -gui
complexity_manager -property {{<embedded>::design_top.U_mesh_sva.watch_pkt[2].genblk1.data_integ}}
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
check_assumptions -show -dead_end
get_design_info -property <embedded>::design_top.U_mesh_sva.cover_2_failure -gui
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.router0_to_1:precondition1 -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -go_backward -window {visualize:0}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property <embedded>::design_top.U_mesh_sva.router0_to_1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
get_design_info -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._assume_3} -gui
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._assume_3:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0]._cover_2} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva.pre_condition -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:precondition1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
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
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -trace -task <embedded> -dead_end
check_assumptions -show -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[15].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:precondition1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:precondition1} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:2] + 1] -window visualize:2; visualize -freeze [visualize -get_length -window visualize:2] -window visualize:2; visualize -replot -bg -window visualize:2
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
prove -bg -all
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -go_backward -window {visualize:0}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_7} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_7} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_7} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_7} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_7} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_8} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._assume_6:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_8} -new_window
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property <embedded>::design_top.U_mesh_sva._assume_1:witness1 -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
visualize -reset
visualize -property {<embedded>::design_top.genblk4[0].genblk1[2].fifo_right.unhardened.un.fifo.mem_1r1w._assert_1:witness1} -new_window
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
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -trace -task <embedded> -dead_end
check_assumptions -show -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_3} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:precondition1} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
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
visualize -property {<embedded>::design_top.genblk3[1].fifo_down.unhardened.un.fifo.mem_1r1w._assert_2:precondition1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -go_backward -window {visualize:0}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.genblk3[0].fifo_down.unhardened.un.fifo.mem_1r1w._assert_1:precondition1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.start} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.start} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ:witness1} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_5} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1._cover_5} -new_window
visualize -min_length [expr [visualize -get_length -window visualize:0] + 1] -window visualize:0; visualize -freeze [visualize -get_length -window visualize:0] -window visualize:0; visualize -replot -bg -window visualize:0
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
visualize -reset
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[0].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
check_assumptions -show -dead_end
check_assumptions -trace -task <embedded> -dead_end
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].genblk1.data_integ} -new_window
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
visualize -violation -property {<embedded>::design_top.U_mesh_sva.watch_pkt[1].genblk1.data_integ} -new_window
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
prove -bg -task {<embedded>}
include {/work/bahmed/noc_verif/bsg_noc/scripts/jg.tcl}
