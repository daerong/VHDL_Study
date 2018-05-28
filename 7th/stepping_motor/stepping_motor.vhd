library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity stepping_motor is
	port(
		nRst : in std_logic;
		clk : in std_logic;
		dir : in std_logic;
		result : out std_logic_vector(3 downto 0)
	);
end stepping_motor;

architecture state_machine of stepping_motor is
	type state_type is (s0, s1, s2, s3);
	signal state : state_type;
begin	
	process(nRst, clk)
	begin
		if(nRst = '0') then
			state <= s0;
		elsif rising_edge(clk) then
			case state is
				when s0 =>
					if(dir = '1') then state <= s1;
					else state <= s3;
					end if;
				when s1 =>
					if(dir = '1') then state <= s2;
					else state <= s2;
					end if;
				when s2 =>
					if(dir = '1') then state <= s3;
					else state <= s1;
					end if;
				when s3 =>
					if(dir = '1') then state <= s0;
					else state <= s0;
					end if;
				when others =>
					state <= s0;
			end case;
		end if;
	end process;
	
	result <= "0001" when state = s0 else
				"0010" when state = s1 else
				"0100" when state = s2 else
				"1000" when state = s3 else
	"0000";

end state_machine;
