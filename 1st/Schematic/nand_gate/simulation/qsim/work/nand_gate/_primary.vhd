library verilog;
use verilog.vl_types.all;
entity nand_gate is
    port(
        pin_name3       : out    vl_logic;
        pin_name2       : in     vl_logic;
        pin_name1       : in     vl_logic
    );
end nand_gate;
