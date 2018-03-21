library verilog;
use verilog.vl_types.all;
entity MUX_2x1 is
    port(
        Y               : out    vl_logic;
        B               : in     vl_logic;
        SEL             : in     vl_logic;
        A               : in     vl_logic
    );
end MUX_2x1;
