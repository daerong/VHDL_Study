library ieee;
 
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity decoder_2x4 is
 
    port(
        SELD : in std_logic_vector(1 downto 0);
        A : out std_logic;
        B : out std_logic;
		  C : out std_logic;
		  D : out std_logic
    );
end decoder_2x4;
    
architecture BEH of decoder_2x4 is
 
begin
    A <= '1' when SELD = 0 else '0'; -- 각 비트가 가질 수 있는 경우의 수는 8가지 임
    B <= '1' when SELD = 1 else '0'; -- 예외는 모두 0으로 처리
	 C <= '1' when SELD = 2 else '0';
    D <= '1' when SELD = 3 else '0';
end BEH;
