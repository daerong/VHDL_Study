library verilog;
use verilog.vl_types.all;
entity counter_12_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        nRst            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end counter_12_vlg_sample_tst;