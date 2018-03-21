library verilog;
use verilog.vl_types.all;
entity and_gate is
    port(
        output_Y        : out    vl_logic;
        input_A         : in     vl_logic;
        input_B         : in     vl_logic
    );
end and_gate;
