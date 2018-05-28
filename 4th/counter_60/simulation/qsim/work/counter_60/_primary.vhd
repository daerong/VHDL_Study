library verilog;
use verilog.vl_types.all;
entity counter_60 is
    port(
        nRst            : in     vl_logic;
        clk             : in     vl_logic;
        digit_one       : out    vl_logic_vector(3 downto 0);
        digit_ten       : out    vl_logic_vector(3 downto 0);
        carry           : out    vl_logic
    );
end counter_60;
