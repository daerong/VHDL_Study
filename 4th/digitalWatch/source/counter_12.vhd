library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;
  
 
entity counter_12 is
    port(
        -- 12진 카운터에서는 hour에 대한 각각의 클럭으로 카운팅이 일어나며 reset을 통해 12로 리셋된다.
        -- 또한 FND 디코더에 연결된 4bit의 출력을 내보낸다. 12가 카운팅 되면 carry 없이 1로 돌아간다.
        -- 이를 통해 외부 입출력을 정의하면 다음과 같다.
        nRst       : in std_logic;
		  clk        : in std_logic;
        digit_one  : out std_logic_vector(3 downto 0);
        digit_ten  : out std_logic_vector(3 downto 0)
    );
    end counter_12;
    
architecture BEH of counter_12 is
    -- 다음은 내부 시그널이다. 위 port는 외부 시그널을 의미하기 때문에 실질적 동작은 아래 기술하게 된다
    signal count_one        : std_logic_vector(3 downto 0);
    signal count_ten        : std_logic_vector(3 downto 0);
    
    begin
    
    process(nRst, clk)
        begin 
        -- reset 동작은 active low라는 점에 유의하자.
        if(nRst = '0') then
				-- 12를 표현하기 위해서 아래 값으로 reset
            count_one <= "0010";
            count_ten <= "0001";
        
        -- clk'EVENT AND clk='1'은 rising edge를 clk'EVENT AND clk='0'을 falling edge를 의미
        -- RISING_EDGE(clk), FALLING_EDGE(clk)로 직접 작성하는 방법도 있다.
        elsif RISING_EDGE(clk) then
           if(count_one = 9) then
                -- (others => '0')으로 대체하여 쓸 수 있다.
                count_one <= "0000";
                count_ten <= count_ten + 1;
				else
                count_one <= count_one + 1;
            end if;
				
				if(count_one = 2 and count_ten = 1) then
                count_one <= "0001";
					 count_ten <= "0000";
				end if;
        end if;
    
        digit_one <= count_one;
        digit_ten <= count_ten;
    end process;
end BEH;