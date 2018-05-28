library verilog;
use verilog.vl_types.all;
entity counter_12_vlg_check_tst is
    port(
        digit_one       : in     vl_logic_vector(3 downto 0);
        digit_ten       : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end counter_12_vlg_check_tst;
