library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity register_comp is
	port(
		clk : in std_logic;
		load : in std_logic;
		in_data : in std_logic_vector(7 downto 0);
		q : out std_logic_vector(7 downto 0)
	);
	end register_comp;

architecture BEH of register_comp is
begin
	process(clk, load, in_data)
	begin
		if falling_edge(clk) then
			if(load = '1') then
				q <= in_data;
			end if;
		end if;
	end process;
end BEH;