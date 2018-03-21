library verilog;
use verilog.vl_types.all;
entity decoder_2x4 is
    port(
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        Y1              : out    vl_logic;
        Y2              : out    vl_logic;
        Y3              : out    vl_logic;
        Y4              : out    vl_logic
    );
end decoder_2x4;
