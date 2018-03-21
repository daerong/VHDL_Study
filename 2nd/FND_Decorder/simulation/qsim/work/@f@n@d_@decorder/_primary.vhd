library verilog;
use verilog.vl_types.all;
entity FND_Decorder is
    port(
        data            : in     vl_logic_vector(3 downto 0);
        fnd_data        : out    vl_logic_vector(6 downto 0)
    );
end FND_Decorder;
