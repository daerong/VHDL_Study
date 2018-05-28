library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity gray_counter is
	port(
		nRst : in std_logic;
		clk : in std_logic;
		count : out std_logic_vector(2 downto 0)
	);
end gray_counter;

architecture state_machine of gray_counter is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
	signal state : state_type;
begin	
	state_move : process(nRst, clk)
	begin
		if(nRst = '0') then
			state <= s0;
		elsif rising_edge(clk) then
			case state is
				when s0 => state <= s1;
				when s1 => state <= s2;
				when s2 => state <= s3;
				when s3 => state <= s4;
				when s4 => state <= s5;
				when s5 => state <= s6;
				when s6 => state <= s7;
				when s7 => state <= s0;
				when others => state <= s0;
			end case;
		end if;
	end process;
	
	count <= "000" when state = s0 else
				"001" when state = s1 else
				"011" when state = s2 else
				"010" when state = s3 else
				"110" when state = s4 else
				"111" when state = s5 else
				"101" when state = s6 else
				"100" when state = s7 else
				"000";
end state_machine;
