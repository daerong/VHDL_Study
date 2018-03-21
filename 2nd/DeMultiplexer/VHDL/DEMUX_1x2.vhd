library ieee;
 
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity DEMUX_1x2 is
 
    port(
        A : in std_logic;
        SEL : in std_logic;
        Y1 : out std_logic;
		  Y2 : out std_logic
      
    );
end DEMUX_1x2;
    
architecture BEH of DEMUX_1x2 is
 
begin
    Y1 <= A when SEL = '0' else '0'; -- 각 비트가 가질 수 있는 경우의 수는 8가지
    Y2 <= A when SEL = '1' else '0'; -- Z는 잘못된 데이터, 여기서 0은 사용자가 처리하고자 하는 데이터
end BEH;