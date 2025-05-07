`define DATA_WIDTH_P 4
`define MESH_EDGE_P  1 
// import enum Dirs for directions
import bsg_noc_pkg::Dirs
       , bsg_noc_pkg::P  // proc (processor core)
       , bsg_noc_pkg::W  // west
       , bsg_noc_pkg::E  // east
       , bsg_noc_pkg::N  // north
       , bsg_noc_pkg::S; // south

module design_top
#(
  parameter DATA_WIDTH_P= 4,
  parameter MESH_EDGE_P = 1,
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
  
  output logic [msize_lp-1:0][dirs_lp-1:0] yumi_o,
  output logic [msize_lp-1:0][dirs_lp-1:0] v_o,
  output logic [msize_lp-1:0][dirs_lp-1:0][width_lp-1:0] data_o
);
  localparam width_lp = x_cord_width_lp + y_cord_width_lp + (`DATA_WIDTH_P) + x_cord_width_lp + y_cord_width_lp;

  localparam x_cord_width_lp = MESH_EDGE_P;
  localparam y_cord_width_lp = MESH_EDGE_P;
//  localparam width_lp = DATA_WIDTH_P + x_cord_width_lp + y_cord_width_lp;

  genvar i, j;
  generate
    for (i = 0; i < msize_lp; i = i + 1) begin : mesh_routers
      bsg_mesh_router #(
        .dims_p(2),
        .width_p(width_lp),
        .x_cord_width_p(x_cord_width_lp),
        .y_cord_width_p(y_cord_width_lp)
      ) router (
        .clk_i(clk),
        .reset_i(reset),
        .data_i(data_i[i]),
        .v_i(v_i[i]),
        .yumi_o(yumi_o[i]),
        .data_o(data_o[i]),
        .v_o(v_o[i]),
        .ready_and_i(ready_and_i[i]),
        .my_x_i(x_cord_width_lp'(i % medge_lp)),
        .my_y_i(y_cord_width_lp'(i / medge_lp))
      );
    end
  




  // disables the peripheral ports of the mesh
  for(i=0; i<msize_lp; i=i+1)
  begin
    if(i/medge_lp == 0)
      begin
        assign v_i[i][N] = 1'b0;
        assign ready_and_i[i][N] = 1'b0;
      end

    if(i/medge_lp == medge_lp-1) 
      begin
        assign v_i[i][S] = 1'b0;
        assign ready_and_i[i][S] = 1'b0;
      end

    if(i%medge_lp == 0) 
      begin
        assign v_i[i][W] = 1'b0;
        assign ready_and_i[i][W] = 1'b0;
      end

    if(i%medge_lp == medge_lp-1) 
      begin
        assign v_i[i][E] = 1'b0;
        assign ready_and_i[i][E] = 1'b0;
      end
  end


  
  /*********************************************  // horizontal fifos => data flow E to W or vice versa

  * Instantiation of fifos bridging the routers
  /*********************************************/
  
  // vertical fifos => data flow N to S or vice-versa
  for (i = 0; i < (medge_lp)*(medge_lp-1); i = i + 1) begin
      bsg_fifo_1r1w_small #(
        .width_p(width_lp),
        .els_p(msize_lp),
        .ready_THEN_valid_p(0)
      ) fifo_up (
        .clk_i(clk),
        .reset_i(reset),
        .data_i(data_o[i][S]),
        .v_i(v_o[i][S]),
        .ready_param_o(ready_and_i[i][S]),
        .data_o(data_i[i+medge_lp][N]),
        .v_o(v_i[i+medge_lp][N]),
        .yumi_i(yumi_o[i+medge_lp][N])
      );

      bsg_fifo_1r1w_small #(
        .width_p(width_lp),
        .els_p(msize_lp),
        .ready_THEN_valid_p(0)
      ) fifo_down (
        .clk_i(clk),
        .reset_i(reset),
        .data_i(data_o[i+medge_lp][N]),
        .v_i(v_o[i+medge_lp][N]),
        .ready_param_o(ready_and_i[i+medge_lp][N]),
        .data_o(data_i[i][S]),
        .v_o(v_i[i][S]),
        .yumi_i(yumi_o[i][S])
      );
    end

  // horizontal fifos => data flow E to W or vice versa

    for (i = 0; i < medge_lp; i = i + 1) begin
      for (j = 0; j < medge_lp-1; j = j + 1) begin
        bsg_fifo_1r1w_small #(
          .width_p(width_lp),
          .els_p(msize_lp),
          .ready_THEN_valid_p(0)
        ) fifo_right (
          .clk_i(clk),
          .reset_i(reset),
          .data_i(data_o[i*medge_lp + j][E]),
          .v_i(v_o[i*medge_lp + j][E]),
          .ready_param_o(ready_and_i[i*medge_lp + j][E]),
          .data_o(data_i[i*medge_lp + j + 1][W]),
          .v_o(v_i[i*medge_lp + j + 1][W]),
          .yumi_i(yumi_o[i*medge_lp + j + 1][W])
        );

        bsg_fifo_1r1w_small #(
          .width_p(width_lp),
          .els_p(msize_lp),
          .ready_THEN_valid_p(0)
        ) fifo_left (
          .clk_i(clk),
          .reset_i(reset),
          .data_i(data_o[i*medge_lp + j + 1][W]),
          .v_i(v_o[i*medge_lp + j + 1][W]),
          .ready_param_o(ready_and_i[i*medge_lp + j + 1][W]),
          .data_o(data_i[i*medge_lp + j][E]),
          .v_o(v_i[i*medge_lp + j][E]),
          .yumi_i(yumi_o[i*medge_lp + j][E])
        );
      end
    end
  endgenerate
endmodule
