library verilog;
use verilog.vl_types.all;
entity FND_Decorder_vlg_check_tst is
    port(
        fnd_data        : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end FND_Decorder_vlg_check_tst;
