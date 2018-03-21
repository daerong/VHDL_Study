library ieee;
-- VHDL은 IEEE 국제 표준을 사용한다.
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity MUX_2x2 is
-- Entity 선언부 는 설계하고자 하는 시스템의 외적 연결을 담당 한다.
-- 회로의 내부적인 구조나 연결등을 고려할 필요가 없으며, 
-- 여기서 정의한 것을 통해 다음 Architecture Body 에서 내부적 동작을 표현한다.
-- 즉, 입출력 선을 정의 하는 부분이다.
    port(
        A : in std_logic_vector(1 downto 0);
		  -- 2비트 입력을 다음과 같이 간소화 하여 나타낼 수 있다.
        B : in std_logic_vector(1 downto 0);
		  SEL : in std_logic;
        Y : out std_logic_vector(1 downto 0)
        -- 선언부 마지막 문장에 세미콜론이 없음에 유의하자.
    );
end MUX_2x2;
    
architecture BEH of MUX_2x2 is
-- 시스템의 동작을 세부적으로 정의한다.
begin
    Y <= A when SEL = '0' else
			B when SEL = '1' else
			(others => 'Z'); 
			-- z는 잘못된 데이터를 의미한다.
			-- Z가 대문자임에 유의하자.
end BEH;