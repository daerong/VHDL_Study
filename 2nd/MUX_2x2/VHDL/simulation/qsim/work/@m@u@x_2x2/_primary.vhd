library verilog;
use verilog.vl_types.all;
entity MUX_2x2 is
    port(
        A               : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(1 downto 0);
        SEL             : in     vl_logic;
        Y               : out    vl_logic_vector(1 downto 0)
    );
end MUX_2x2;
