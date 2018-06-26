library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
	 
entity reg_Latch is
    port (
		 clk : in std_logic; 
		 load : in std_logic;
		 in_data : in std_logic_vector(7 downto 0);
		 Q : out std_logic_vector (7 downto 0)
	 );
end reg_Latch;

architecture BEH of reg_Latch is
	
begin
    process(clk)
		variable inner_data : std_logic_vector(7 downto 0);
	 begin
		if falling_edge(clk) then
			if(load = '1') then
				inner_data := in_data;
			else 
				inner_data := inner_data;
			end if;
		end if;
		Q <= inner_data;
	end process;
			
end BEH;