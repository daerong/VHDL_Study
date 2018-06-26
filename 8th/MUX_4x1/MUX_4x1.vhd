library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity MUX_4x1 is
    port(
        reg1 : in std_logic_vector (7 downto 0);
        reg2 : in std_logic_vector (7 downto 0);
		  reg3 : in std_logic_vector (7 downto 0);
		  reg4 : in std_logic_vector (7 downto 0);
		  SEL : in std_logic_vector (1 downto 0);
        Q : out std_logic_vector (7 downto 0)
    );
end MUX_4x1;
    
architecture BEH of MUX_4x1 is

begin
    Q <= reg1 when SEL = 0 else
	 reg2 when SEL = 1 else
	 reg3 when SEL = 2 else
	 reg4 when SEL = 3 else
	 (others => 'Z');
end BEH;
