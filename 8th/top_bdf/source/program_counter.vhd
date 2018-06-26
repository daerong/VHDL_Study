library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity program_counter is
	port(
		nRst : in std_logic;
		clk : in std_logic;
		address_bus : out std_logic_vector(15 downto 0)
	);
	end program_counter;

architecture BEH of program_counter is
	signal address_cnt : std_logic_vector(15 downto 0);
begin
	process(nRst,clk)
	begin
		if(nRst ='0') then
			address_cnt <= (others => '0');
		elsif rising_edge(clk) then
			if(address_cnt = 50) then
				address_cnt <=(others =>'0');
			else
				address_cnt <= address_cnt + 1;
			end if;
		end if;
	end process;
	address_bus <= address_cnt;
end BEH;