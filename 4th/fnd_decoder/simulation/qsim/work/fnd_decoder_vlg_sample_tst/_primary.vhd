library verilog;
use verilog.vl_types.all;
entity fnd_decoder_vlg_sample_tst is
    port(
        data            : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end fnd_decoder_vlg_sample_tst;
