library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity nand_gate is
    port(
        A : in std_logic;
		  B : in std_logic;
        Y : out std_logic
    );
end nand_gate;
    
architecture BEH of nand_gate is
begin
    Y <= A nand B;
end BEH;