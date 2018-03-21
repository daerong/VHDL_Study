library verilog;
use verilog.vl_types.all;
entity FND_Decorder_vlg_sample_tst is
    port(
        data            : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end FND_Decorder_vlg_sample_tst;
