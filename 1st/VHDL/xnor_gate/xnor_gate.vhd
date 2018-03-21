library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity xnor_gate is

    port(
        A : in std_logic;
        B : in std_logic;
        Y : out std_logic

    );
end xnor_gate;
    
architecture BEH of xnor_gate is

begin
    Y <= A xnor B;
end BEH;
