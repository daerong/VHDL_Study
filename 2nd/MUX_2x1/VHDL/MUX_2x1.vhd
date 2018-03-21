library ieee;

    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity MUX_2x1 is

    port(
        A : in std_logic;
        B : in std_logic;
		  SEL : in std_logic;
        Y : out std_logic
      
    );
end MUX_2x1;
    
architecture BEH of MUX_2x1 is

begin
    Y <= A when SEL = '0' else
			B when SEL = '1' else
			'Z';	-- 예외 출력 조건을 다음과 같이 Z로 설정, Z는 대문자 사용 
end BEH;
