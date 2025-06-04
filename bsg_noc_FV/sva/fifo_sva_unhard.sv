module fifo_unhard_sva #( parameter ptr_width_lp = 2 )
                            
    ( input                clk_i
    , input                reset_i
    , input                v_i
    , input                yumi_i
    );


reg [ptr_width_lp*ptr_width_lp-1: 0]count;


always @(posedge clk_i) begin
    if (reset_i)
        count <= 4'h0;
    else begin
        if (v_i && !yumi_i)
            count <= count + 1'b1;
        else if (!v_i && yumi_i)
            count <= count - 1'b1;
    end
end

     property async_rst_startup;
          @(posedge clk_i) reset_i |=> (bsg_fifo_1r1w_small_unhardened.wptr_r==0 && bsg_fifo_1r1w_small_unhardened.rptr_r == 0 && bsg_fifo_1r1w_small_unhardened.empty);
     endproperty

property full_fifo_condition;
@(posedge clk_i) disable iff (reset_i) (count == 0 |-> !bsg_fifo_1r1w_small_unhardened.full);
//@(posedge clk_i) disable iff (reset_i) ((count == 4) && !yumi_i |-> bsg_fifo_1r1w_small_unhardened.full);

endproperty

property not_full_fifo_condition;
@(posedge clk_i) disable iff (reset_i)
(count<(4) |-> !bsg_fifo_1r1w_small_unhardened.full);
endproperty

property fifo_should_go_full;
@(posedge clk_i) disable iff (reset_i) 
((count==3) && v_i && !yumi_i |=> bsg_fifo_1r1w_small_unhardened.full);
endproperty


property fifo_empty;
@(posedge clk_i) disable iff (reset_i)
 (count==0 |-> bsg_fifo_1r1w_small_unhardened.empty);
endproperty

property not_empty_fifo_condition;
@(posedge clk_i) disable iff (reset_i)
(count>0 |-> !bsg_fifo_1r1w_small_unhardened.empty);
endproperty

property empty_read_empty;
@(posedge clk_i) disable iff (reset_i)
((count==1) && yumi_i && !v_i |=> bsg_fifo_1r1w_small_unhardened.empty);
endproperty

property fifo_not_empty_not_full;
@(posedge clk_i) disable iff (reset_i)
(v_i && yumi_i |=> !bsg_fifo_1r1w_small_unhardened.full && !bsg_fifo_1r1w_small_unhardened.empty);
endproperty

//wr ptr should only increment by 1 on wr req
     property inc_wr_one;
      @(posedge clk_i) disable iff(reset_i) v_i && !bsg_fifo_1r1w_small_unhardened.full |=> (bsg_fifo_1r1w_small_unhardened.wptr_r-1'b1 == $past(bsg_fifo_1r1w_small_unhardened.wptr_r));
     endproperty

//rd ptr should only increment by 1 on rd req
     property inc_rd_one;
      @(posedge clk_i) disable iff(reset_i) yumi_i && !bsg_fifo_1r1w_small_unhardened.empty |=> (bsg_fifo_1r1w_small_unhardened.rptr_r-1'b1 == $past(bsg_fifo_1r1w_small_unhardened.rptr_r));
     endproperty

     property full_write_full;
     @(posedge clk_i) disable iff (reset_i) (bsg_fifo_1r1w_small_unhardened.full && v_i && !yumi_i |=> bsg_fifo_1r1w_small_unhardened.full);
     endproperty



     property empty_write_empty;
     @(posedge clk_i) disable iff (reset_i) (bsg_fifo_1r1w_small_unhardened.empty && !v_i && yumi_i |=> bsg_fifo_1r1w_small_unhardened.empty);
     endproperty


     property full_write_wptr_no_change;
     @(posedge clk_i) disable iff (reset_i) (bsg_fifo_1r1w_small_unhardened.full && v_i && !yumi_i |=> $stable(bsg_fifo_1r1w_small_unhardened.wptr_r));
     endproperty


     property empty_read_rptr_no_change;
     @(posedge clk_i) disable iff (reset_i) (bsg_fifo_1r1w_small_unhardened.empty && yumi_i && !v_i |=> $stable(bsg_fifo_1r1w_small_unhardened.rptr_r));
     endproperty



//reset_ptrs:  assert property (async_rst_startup);

wr_ptr_1:     assert property (inc_wr_one);

rd_ptr_1:     assert property (inc_rd_one);


//full_write: assert property (full_write_wptr_no_change);


//empty_read: assert property (empty_read_rptr_no_change);
//
//full_wr_full: assert property(full_write_full);
//empty_rd_empty: assert property(empty_write_empty);

fifo_not_empty_nor_full: assert property(fifo_not_empty_not_full);
full_condition: assert property(full_fifo_condition);
not_full_condition: assert property(not_full_fifo_condition);

//fifo_go_full: assert property(fifo_should_go_full);
empty_check: assert property(fifo_empty);
not_empty_check: assert property(not_empty_fifo_condition);
go_to_empty: assert property(empty_read_empty);
fifo_chek: assert property (!(bsg_fifo_1r1w_small_unhardened.empty & bsg_fifo_1r1w_small_unhardened.full));


endmodule