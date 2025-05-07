bind pipeline pipeline_sva #(.WORD_WIDTH(WORD_WIDTH),
                            .PIPE_DEPTH(PIPE_DEPTH),
                            .FIFO_DEPTH(FIFO_DEPTH),
                            .FIFO_RAMSTYLE(FIFO_RAMSTYLE)
                            ) 
                            u_pipeline_sva (.*);