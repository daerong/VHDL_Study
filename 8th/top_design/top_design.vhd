library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity top_design is
	port(
		nRst : in std_logic;
		clk : in std_logic;
		OUT_ADDRESS : out std_logic_vector(15 downto 0);
		OUT_DATABUS : out std_logic_vector(7 downto 0);
		OUT_PROMDATA : out std_logic_vector(7 downto 0);
		OUT_REG1 : out std_logic_vector(7 downto 0);
		OUT_REG2 : out std_logic_vector(7 downto 0);
		OUT_REG3 : out std_logic_vector(7 downto 0);
		OUT_REG4 : out std_logic_vector(7 downto 0)
	);
	end top_design;

architecture BEH of top_design is
	
	component program_counter
		port(
			nRst : in std_logic;
			clk : in std_logic;
			address_bus : out std_logic_vector(15 downto 0)
		);
	end component;
	
	component program_memory
		port(
			nRst : in std_logic;
			clk : in std_logic;
			address_bus : in std_logic_vector(15 downto 0);
			data_bus : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component IR_Decoder is 
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
	end component;
	
	component decoder_2x4
		 port(
			  SELD : in std_logic_vector(1 downto 0);
			  A : out std_logic;
			  B : out std_logic;
			  C : out std_logic;
			  D : out std_logic
		 );
	end component;
	
	component MUX_2x1
		 port(
			  A : in std_logic_vector (7 downto 0);
			  B : in std_logic_vector (7 downto 0);
			  sel : in std_logic;
			  Q : out std_logic_vector (7 downto 0)     
		 );
	end component;

	component reg_Latch
		port (
			clk : in std_logic; 
			load : in std_logic;
			in_data : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector (7 downto 0)
		);
	end component;
	
	component MUX_4x1
		 port(
			  reg1 : in std_logic_vector (7 downto 0);
			  reg2 : in std_logic_vector (7 downto 0);
			  reg3 : in std_logic_vector (7 downto 0);
			  reg4 : in std_logic_vector (7 downto 0);
			  SEL : in std_logic_vector (1 downto 0);
			  Q : out std_logic_vector (7 downto 0)
		 );
	end component;
	
	component ALU
		 port(
			op : in std_logic_vector (1 downto 0);
			A : in std_logic_vector (7 downto 0);
			B : in std_logic_vector (7 downto 0);
			Q : out std_logic_vector (7 downto 0)
		 );
	end component;
	
	signal ADDRESS : std_logic_vector (15 downto 0);
	signal DATA_BUS : std_logic_vector (7 downto 0);
	signal PROM_DATA : std_logic_vector (7 downto 0);
	signal SELA, SELB, SELD, ALU_OP : std_logic_vector (1 downto 0);	-- IR_Decoder output
	signal A, B, C, D : std_logic;							-- decoder_2x4 output
	signal reg1, reg2, reg3, reg4 : std_logic_vector (7 downto 0);		-- reg_Latch output
	signal QA, QB : std_logic_vector (7 downto 0);		-- mux_4x1 output
	signal in_data : std_logic_vector (7 downto 0);		-- mux_2x1 output
	signal RESULT : std_logic_vector (7 downto 0);		-- ALU output
	signal Bus_Sel : std_logic;

begin
	PC : program_counter
	port map(
		nRst => nRst,
		clk => clk,
		address_bus => ADDRESS
	);

	PM : program_memory
	port map(
		nRst => nRst,
		clk => clk,
		address_bus => ADDRESS,
		data_bus => PROM_DATA
	);
	
	IR_DEC : IR_Decoder
	port map( 
		nRst => nRst,
		clk => clk,
		Data_Bus => PROM_DATA,
		SELA => SELA,
		SELB => SELB,
		SELD => SELD,
		ALU_OP => ALU_OP,
		Bus_Sel => Bus_Sel
	);
	
	DEC : decoder_2x4
	port map(
		  SELD => SELD,
		  A => A,
		  B => B,
		  C => C,
		  D => D
	 );
	
	DATA_BUS_MUX : MUX_2x1
	port map(
		  A => PROM_DATA,
		  B => RESULT,
		  sel => Bus_Sel,
		  Q => DATA_BUS
	 );
	
	
	U_REG01 : reg_Latch
	port map(
		clk => clk,
		load => B,
		in_data => DATA_BUS,
		Q => reg1
	);
	
	U_REG02 : reg_Latch
	port map(
		clk => clk,
		load => C,
		in_data => DATA_BUS,
		Q => reg2
	);
	
	U_REG03 : reg_Latch
	port map(
		clk => clk,
		load => A,
		in_data => DATA_BUS,
		Q => reg3
	);	
	
	U_REG04 : reg_Latch
	port map(
		clk => clk,
		load => D,
		in_data => DATA_BUS,
		Q => reg4
	);	
	
	ALU_A_MUX : MUX_4x1
	port map(
		 reg1 => reg1,
		 reg2 => reg2,
		 reg3 => reg3,
		 reg4 => reg4,
		 SEL => SELA,
		 Q => QA
	);
	
	ALU_B_MUX : MUX_4x1
	port map(
		 reg1 => reg1,
		 reg2 => reg2,
		 reg3 => reg3,
		 reg4 => reg4,
		 SEL => SELB,
		 Q => QB
	);
	
	ALU_UNIT : ALU
	port map(
		op => ALU_OP,
		A => QA,
		B => QB,
		Q => RESULT
	);
	
		OUT_ADDRESS <= ADDRESS;
		OUT_DATABUS <= DATA_BUS;
		OUT_PROMDATA <= PROM_DATA;
		OUT_REG1 <= reg1;
		OUT_REG2 <= reg2;
		OUT_REG3 <= reg3;
		OUT_REG4 <= reg4;

end BEH;