library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	
entity and_gate is
-- Entity 선언부 는 설계하고자 하는 시스템의 외적 연결을 담당 한다.
-- 회로의 내부적인 구조나 연결등을 고려할 필요가 없으며, 
-- 여기서 정의한 것을 통해 다음 Architecture Body 에서 내부적 동작을 표현한다.
-- 즉, 입출력 선을 정의 하는 부분이다.
	port(
		A : in std_logic;
		B : in std_logic;
		Y : out std_logic
		-- 선언부 마지막 문장에 세미콜론이 없음에 유의하자.
	);
end and_gate;
	
architecture BEH of and_gate is
-- 시스템의 동작을 세부적으로 정의한다.
begin
	Y <= A and B;
end BEH;