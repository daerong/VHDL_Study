library ieee;
   use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	

entity sec_gen is
	port(
		nRst		: in std_logic;
		clk		: in std_logic;
		sec_sig	: out std_logic
	);
end sec_gen;
 
architecture BEH of sec_gen is
	
	signal cnt : std_logic_vector(31 downto 0);
	signal sig : std_logic;
	
	begin
	sec_sig <=sig;
	-- begin ~ end 문장
	-- initial, if, case, always 등을 사용할 때 블록을 지정할때 사용한다. 
	-- C 언어에서 {… }와 같은 개념이다.

	
	process(nRst,clk)
		begin
			if(nRst = '0') then
				sig <= '0';
				cnt <=(others =>'0');
			elsif rising_edge(clk) then
				-- 입력클럭 50MHz이므로 50% 듀티사이클 펄스는 아래와 같이 구할 수 있다.
				if(cnt = 24999999) then
					cnt <= (others =>'0');
					sig <= not sig;
				else
					cnt <= cnt + 1;
				end if;
			end if;
	end process;
	
end BEH;