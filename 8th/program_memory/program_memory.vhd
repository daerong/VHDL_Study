library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity program_memory is
	port(
		nRst : in std_logic;
		clk : in std_logic;
		address_bus : in std_logic_vector(15 downto 0);
		data_bus : out std_logic_vector(7 downto 0)
	);
	end program_memory;

architecture BEH of program_memory is
	type mem_array is array(0 to 19) of std_logic_vector (7 downto 0);
	signal mem : mem_array;
begin
	process(nRst,clk, address_bus)
		variable index : integer range 0 to 19 := 0;
	begin
		if(nRst ='0') then
			mem(0) <= "01000000";
			mem(1) <= "00001010";
			mem(2) <= "01010000";
			mem(3) <= "00000101";
			mem(4) <= "11000000";
			
			mem(5) <= "01000000";
			mem(6) <= "00001110";
			mem(7) <= "01010000";
			mem(8) <= "00001101";
			mem(9) <= "11000001";
			
			mem(10) <= "01000000";
			mem(11) <= "00001111";
			mem(12) <= "01010000";
			mem(13) <= "00001010";
			mem(14) <= "11000010";
			
			mem(15) <= "01000000";
			mem(16) <= "00001000";
			mem(17) <= "01010000";
			mem(18) <= "00000001";
			mem(19) <= "11000011";
			
		elsif rising_edge(clk) then
			index := conv_integer(address_bus (4 downto 0));
			data_bus <= mem(index);
		end if;
	end process;
end BEH;