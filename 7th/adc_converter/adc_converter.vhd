library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity adc_converter is
	port(
		nRst : in std_logic;
		clk : in std_logic;
		t : in std_logic;
		data : out std_logic_vector (3 downto 0)
	);
end adc_converter;

architecture BEH of adc_converter is

	component sec_gen
		port(
			nRst		: in std_logic;
			clk		: in std_logic;
			sec_sig	: out std_logic
		);
	end component;

	component adc_control
		port(
			nRst : in std_logic;
			clk : in std_logic;
			t : in std_logic;
			dr : in std_logic;
			sc : out std_logic;
			oe : out std_logic
		);
	end component;
	
	component adc
		port (
			nRst : in std_logic;
			clk : in std_logic;
			dr : out std_logic;
			sc : in std_logic;
			oe : in std_logic;
			data : out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal sec_clk : std_logic;
	signal dr : std_logic;
	signal sc : std_logic;
	signal oe : std_logic;
	
	begin 
		sec_generator : sec_gen
		port map(
			nRst => nRst,
			clk => clk,
			sec_sig => sec_clk
		);

		ADC_Controller : adc_control
		port map(
			nRst => nRst,
			clk => sec_clk,
			t => t,
			dr => dr,
			sc => sc,
			oe => oe
		);
		
		ADC_Model : adc
		port map(
			nRst => nRst,
			clk => sec_clk,
			dr => dr,
			sc => sc,
			oe => oe,
			data => data
		);

end BEH;
