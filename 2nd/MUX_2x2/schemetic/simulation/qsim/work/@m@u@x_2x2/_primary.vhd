library verilog;
use verilog.vl_types.all;
entity MUX_2x2 is
    port(
        Y0              : out    vl_logic;
        B0              : in     vl_logic;
        SEL             : in     vl_logic;
        A0              : in     vl_logic;
        Y1              : out    vl_logic;
        B1              : in     vl_logic;
        A1              : in     vl_logic
    );
end MUX_2x2;
