library verilog;
use verilog.vl_types.all;
entity DEMUX_1x2 is
    port(
        A               : in     vl_logic;
        SEL             : in     vl_logic;
        Y1              : out    vl_logic;
        Y2              : out    vl_logic
    );
end DEMUX_1x2;
