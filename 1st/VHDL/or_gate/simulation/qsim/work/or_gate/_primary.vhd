library verilog;
use verilog.vl_types.all;
entity or_gate is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Y               : out    vl_logic
    );
end or_gate;
