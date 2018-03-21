library verilog;
use verilog.vl_types.all;
entity decoder_2x4_vlg_check_tst is
    port(
        Y1              : in     vl_logic;
        Y2              : in     vl_logic;
        Y3              : in     vl_logic;
        Y4              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end decoder_2x4_vlg_check_tst;
