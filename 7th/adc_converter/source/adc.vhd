library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity adc is
	port(
		nRst : in std_logic;
		clk : in std_logic;
		dr : out std_logic;
		sc : in std_logic;
		oe : in std_logic;
		data : out std_logic_vector(3 downto 0)
	);
end adc;

architecture BEH of adc is
	type state_type is (IDLE, WAIT_CONV, CPLT_CONV, DATA_OE);
	signal state : state_type;
	signal cnt : std_logic_vector(3 downto 0);
begin	
	process(nRst, clk)
	begin
		if(nRst = '0') then
			state <= IDLE;
			dr <= '0';
			cnt <= (others => '0');
		elsif rising_edge(clk) then
			case state is
				when IDLE =>
					if(sc = '1') then 
						state <= WAIT_CONV;
						dr <= '0';
					else 
						state <= IDLE;
						dr <= '0';
					end if;
				when WAIT_CONV =>
					if(cnt = 10) then 
						state <= CPLT_CONV;
						dr <= '1';
					else 
						cnt <= cnt+1;
					end if;
				when CPLT_CONV =>
					if(oe = '1') then 
						state <= DATA_OE;
						dr <= '0';
					else 
						state <= CPLT_CONV;
						dr <= '1';
					end if;
				when DATA_OE =>
					state <= IDLE;
					dr <= '0';
					cnt <= (others => '0');
				when others =>
					state <= IDLE;
					dr <= '0';
					cnt <= (others => '0');
			end case;
		end if;
	end process;
	
	data <= cnt when state = DATA_OE else "0000";

end BEH;
