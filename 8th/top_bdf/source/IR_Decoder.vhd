library ieee; 
	use ieee.std_logic_1164.all; 
	use ieee.std_logic_arith.all; 
	use ieee.std_logic_unsigned.all; 

entity IR_Decoder is 
	port ( 
		nRst : in std_logic;
		clk : in std_logic;
		Data_Bus : in std_logic_vector(7 downto 0);
		SELA : out std_logic_vector (1 downto 0);
		SELB : out std_logic_vector (1 downto 0);
		SELD : out std_logic_vector (1 downto 0);
		ALU_OP : out std_logic_vector (1 downto 0);
		Bus_Sel : out std_logic
	);
end IR_Decoder; 

architecture BEH of IR_Decoder is
begin 
	process(nRst, clk)
		variable mode, D, OP : std_logic_vector(1 downto 0);
	begin
		mode := Data_Bus(7 downto 6);
		D := Data_Bus(5 downto 4);
		OP := Data_Bus(1 downto 0);
		if(nRst = '0') then
			SELA <= (others => 'Z');
			SELB <= (others => 'Z');
			SELD <= (others => 'Z');
			ALU_OP <= (others => 'Z');
			Bus_Sel <= '0';
		elsif rising_edge(clk) then 
			if(mode = "01") then
				SELA <= "00";
				SELB <= "01";
				SELD <= D;
				ALU_OP <= (others => 'Z');
				Bus_Sel <= '0';
			elsif(mode = "11") then
				SELA <= "00";
				SELB <= "01";
				SELD <= "00";
				ALU_OP <= OP;
				Bus_Sel <= '1';
			else
				SELA <= (others => 'Z');
				SELB <= (others => 'Z');
				SELD <= (others => 'Z');
				ALU_OP <= (others => 'Z');
				Bus_Sel <= '0';
			end if;
		end if; 
	end process; 
end BEH;