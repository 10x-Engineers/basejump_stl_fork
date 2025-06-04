module fifo_sva #( parameter ptr_width_lp = 2 )
                            
    ( input                clk_i
    , input                reset_i

    );


reg [ptr_width_lp*ptr_width_lp-1: 0]count;


always @(posedge clk_i) begin
    if (reset_i)
        count <= 4'h0;
    else begin
        if (bsg_two_fifo.enque && !bsg_two_fifo.deque)
            count <= count + 1'b1;
        else if (!bsg_two_fifo.enque && bsg_two_fifo.deque)
            count <= count - 1'b1;
    end
end

property async_rst_startup;
     @(posedge clk_i) reset_i |=> ((bsg_two_fifo.wptr_r==0) && (bsg_two_fifo.rptr_r == 0) && bsg_two_fifo.empty_r);
endproperty

property full_fifo_condition;
@(posedge clk_i) disable iff (reset_i) (count == 0 |-> !bsg_two_fifo.full_r);
//@(posedge clk_i) disable iff (reset_i) ((count == 4) && !bsg_two_fifo.deque |-> bsg_two_fifo.full_r);

endproperty

property not_full_fifo_condition;
@(posedge clk_i) disable iff (reset_i)
(count<(4) |-> !bsg_two_fifo.full_r);
endproperty

property fifo_should_go_full;
@(posedge clk_i) disable iff (reset_i) 
((count==3) && bsg_two_fifo.enque && !bsg_two_fifo.deque |=> bsg_two_fifo.full_r);
endproperty


property fifo_empty;
@(posedge clk_i) disable iff (reset_i)
 (count==0 |-> bsg_two_fifo.empty_r);
endproperty

property not_empty_fifo_condition;
@(posedge clk_i) disable iff (reset_i)
(count>0 |-> !bsg_two_fifo.empty_r);
endproperty

property empty_read_empty;
@(posedge clk_i) disable iff (reset_i)
((count==1) && bsg_two_fifo.deque && !bsg_two_fifo.enque |=> bsg_two_fifo.empty_r);
endproperty

property fifo_not_empty_not_full;
@(posedge clk_i) disable iff (reset_i)
(bsg_two_fifo.enque && bsg_two_fifo.deque |=> !bsg_two_fifo.full_r && !bsg_two_fifo.empty_r);
endproperty

//wr ptr should only increment by 1 on wr req
property inc_wr_one;
     @(posedge clk_i) disable iff(reset_i) bsg_two_fifo.enque && !bsg_two_fifo.full_r |=> (bsg_two_fifo.wptr_r-1'b1 == $past(bsg_two_fifo.wptr_r));
endproperty

//rd ptr should only increment by 1 on rd req
property inc_rd_one;
     @(posedge clk_i) disable iff(reset_i) bsg_two_fifo.deque && !bsg_two_fifo.empty_r |=> (bsg_two_fifo.rptr_r-1'b1 == $past(bsg_two_fifo.rptr_r));
endproperty

property full_write_full;
@(posedge clk_i) disable iff (reset_i) (bsg_two_fifo.full_r && bsg_two_fifo.enque && !bsg_two_fifo.deque |=> bsg_two_fifo.full_r);
endproperty



property empty_write_empty;
@(posedge clk_i) disable iff (reset_i) (bsg_two_fifo.empty_r && !bsg_two_fifo.enque && bsg_two_fifo.deque |=> bsg_two_fifo.empty_r);
endproperty


property full_write_wptr_no_change;
@(posedge clk_i) disable iff (reset_i) (bsg_two_fifo.full_r && bsg_two_fifo.enque && !bsg_two_fifo.deque |=> $stable(bsg_two_fifo.wptr_r));
endproperty


property empty_read_rptr_no_change;
@(posedge clk_i) disable iff (reset_i) (bsg_two_fifo.empty_r && bsg_two_fifo.deque && !bsg_two_fifo.enque |=> $stable(bsg_two_fifo.rptr_r));
endproperty


//reset_ptrs:  assert property (async_rst_startup);

//wr_ptr_1:     assert property (inc_wr_one);
//
//rd_ptr_1:     assert property (inc_rd_one);


//full_write: assert property (full_write_wptr_no_change);


//empty_read: assert property (empty_read_rptr_no_change);

//full_wr_full: assert property(full_write_full);
//empty_rd_empty: assert property(empty_write_empty);

//fifo_not_empty_nor_full: assert property(fifo_not_empty_not_full);
full_condition: assert property(full_fifo_condition);
not_full_condition: assert property(not_full_fifo_condition);

//fifo_go_full: assert property(fifo_should_go_full);
//empty_check: assert property(fifo_empty);
//not_empty_check: assert property(not_empty_fifo_condition);
//go_to_empty: assert property(empty_read_empty);
fifo_chek: assert property (!(bsg_two_fifo.empty_r & bsg_two_fifo.full_r));



endmodule