library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity shift is
	port (
		clk : in std_logic;
		din : in std_logic;
		dout : out std_logic
	);
end shift;

architecture BEH of shift is	
begin
	process(clk)
		variable a, b, c : std_logic;
	begin
		if rising_edge(clk) then
			a := din;
			b := a;
			c := b;
			dout <= c;
		end if;
	end process;
end BEH;