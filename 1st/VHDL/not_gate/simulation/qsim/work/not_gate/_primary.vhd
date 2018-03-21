library verilog;
use verilog.vl_types.all;
entity not_gate is
    port(
        A               : in     vl_logic;
        Y               : out    vl_logic
    );
end not_gate;
