library verilog;
use verilog.vl_types.all;
entity not_gate is
    port(
        pin_name2       : out    vl_logic;
        pin_name1       : in     vl_logic
    );
end not_gate;
