library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity digitalWatch is 
	port
	(
		-- top entity의 입출력 포트 작성
		nRst :			in std_logic;
		clk :				in std_logic;
		
		key_sec :		in std_logic;
		key_min :		in std_logic;
		key_hr :			in std_logic;
		sel_sw :			in std_logic;
		
		fnd_hr_one :	out std_logic_vector(6 downto 0);
		fnd_hr_ten :	out std_logic_vector(6 downto 0);
		fnd_min_one :	out std_logic_vector(6 downto 0);
		fnd_min_ten :  out std_logic_vector(6 downto 0);
		fnd_sec_one :  out std_logic_vector(6 downto 0);
		fnd_sec_ten :  out std_logic_vector(6 downto 0)
	);
end digitalWatch;
architecture beh of digitalWatch is 
	-- 1초 발생기
	component sec_gen
		port(
			nRst		: in std_logic;
			clk		: in std_logic;
			sec_sig	: out std_logic
		);
	end component;
	-- 60진 카운터
	component counter_60
		port(
			-- 60진 카운터에서는 sec, min에 대한 각각의 클럭으로 카운팅이 일어나며 reset을 통해 0으로 리셋된다.
			-- 또한 FND 디코더에 연결된 4bit의 출력을 내보낸다. 60이 카운팅 되면 다음 단위로 carry가 발생한다.
			-- 이를 통해 외부 입출력을 정의하면 다음과 같다.
			nRst			: in std_logic;
			clk			: in std_logic;
			digit_one	: out std_logic_vector(3 downto 0);
			digit_ten	: out std_logic_vector(3 downto 0);
			carry			: out std_logic 
		);
	end component;
	-- 12진 카운터
	component counter_12
		 port(
			  -- 12진 카운터에서는 hour에 대한 각각의 클럭으로 카운팅이 일어나며 reset을 통해 12로 리셋된다.
			  -- 또한 FND 디코더에 연결된 4bit의 출력을 내보낸다. 12가 카운팅 되면 carry 없이 1로 돌아간다.
			  -- 이를 통해 외부 입출력을 정의하면 다음과 같다.
			  nRst       : in std_logic;
			  clk        : in std_logic;
			  digit_one  : out std_logic_vector(3 downto 0);
			  digit_ten  : out std_logic_vector(3 downto 0)
		 );
	end component;
	-- FND decoder
	component fnd_decoder
		port ( 
			data :		in std_logic_vector(3 downto 0);
			fnd_data :	out std_logic_vector(6 downto 0)
		);
	end component;
	-- MUX
	component multiplexer
		 port(
			  A : 	in std_logic;
			  B : 	in std_logic;
			  SEL : 	in std_logic;
			  Y : 	out std_logic
		 );
	end component;
	-- 내부 시그널 작성부
	signal sec_cnt_one :	std_logic_vector(3 downto 0);
	signal sec_cnt_ten :	std_logic_vector(3 downto 0);
	signal min_cnt_one :	std_logic_vector(3 downto 0);
	signal min_cnt_ten :	std_logic_vector(3 downto 0);
	signal hr_cnt_one :	std_logic_vector(3 downto 0);
	signal hr_cnt_ten :	std_logic_vector(3 downto 0);
	
	signal sec_carry :	std_logic;
	signal min_carry :	std_logic;
	signal sec_sig :		std_logic;
	signal sec_clk :		std_logic;
	signal min_sig :		std_logic;
	signal min_clk :		std_logic;
	signal hr_sig :		std_logic;
	signal hr_clk :		std_logic;

	begin
		-- 각 컴포넌트의 입출력을 정의, 하위 계층의 시그널 이름을 top entity에서 다시 정의하는 것을 볼 수 있다.
		U_sec_gen : sec_gen
		port map(
			nRst 		=> nRst,
			clk 		=> clk,
			sec_sig 	=> sec_sig
		);
		
		U_sec_mux : multiplexer
		port map(
			  A 	=> sec_sig,
			  B 	=> key_sec,
			  SEL => sel_sw,
			  Y 	=> sec_clk
		);
		
		U_cnt_sec : counter_60
		port map(
			  nRst 	=> nRst,
			  clk 	=> sec_clk,
			  digit_one => sec_cnt_one,
			  digit_ten => sec_cnt_ten,
			  carry 	=> sec_carry
		);
		
		U_min_mux : multiplexer
		port map(
			  A 	=> sec_carry,
			  B 	=> key_min,
			  SEL => sel_sw,
			  Y 	=> min_clk
		);
		
		U_cnt_min : counter_60
		port map(
			  nRst 	=> nRst,
			  clk 	=> min_clk,
			  digit_one => min_cnt_one,
			  digit_ten => min_cnt_ten,
			  carry 	=> min_carry
		);
		
		U_hr_mux : multiplexer
		port map(
			  A 	=> sec_carry,
			  B 	=> key_sec,
			  SEL => sel_sw,
			  Y 	=> hr_clk
		);
		
		U_cnt_hr : counter_12
		port map(
			  nRst 	=> nRst,
			  clk 	=> hr_clk,
			  digit_one => hr_cnt_one,
			  digit_ten => hr_cnt_ten
		);

		U_fnd_sec_one : fnd_decoder
		port map(
			  data 		=> sec_cnt_one,
			  fnd_data 	=> fnd_sec_one
		);
		
		U_fnd_sec_ten : fnd_decoder
		port map(
			  data 		=> sec_cnt_ten,
			  fnd_data 	=> fnd_sec_ten
		);
		
		U_fnd_min_one : fnd_decoder
		port map(
			  data 		=> min_cnt_one,
			  fnd_data 	=> fnd_min_one
		);
		
		U_fnd_min_ten : fnd_decoder
		port map(
			  data 		=> min_cnt_ten,
			  fnd_data 	=> fnd_min_ten
		);
		
		U_fnd_hr_one : fnd_decoder
		port map(
			  data 		=> hr_cnt_one,
			  fnd_data 	=> fnd_hr_one
		);
		
		U_fnd_hr_ten : fnd_decoder
		port map(
			  data 		=> hr_cnt_ten,
			  fnd_data 	=> fnd_hr_ten
		);
		

end beh;