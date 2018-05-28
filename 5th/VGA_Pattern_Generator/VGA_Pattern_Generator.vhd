library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity VGA_Pattern_Generator is
    port(
        nRst : in std_logic;
        clk : in std_logic;
        VGA_CLK : out std_logic;
        VGA_BLANK : out std_logic;
        VGA_HS : out std_logic;
        VGA_VS : out std_logic;
        VGA_SYNC : out std_logic;
        VGA_R : out std_logic_vector(9 downto 0);
        VGA_G : out std_logic_vector(9 downto 0);
        VGA_B : out std_logic_vector(9 downto 0)
    );
end VGA_Pattern_Generator;
 
architecture BEH of VGA_Pattern_Generator is
 
    signal H_cnt : std_logic_vector(9 downto 0);
    signal V_cnt : std_logic_vector(9 downto 0);
    signal pclk : std_logic;
    
begin
 
    process(nRst, clk)
    begin
        if(nRst = '0') then
            pclk <= '0';
        elsif rising_edge(clk) then
            pclk <= not pclk;
        end if;
    end process;
    
    process(nRst, pclk)
    begin
        if(nRst = '0') then
            H_cnt <= (others => '0');
            V_cnt <= (others => '0');
        elsif rising_edge(pclk) then
            if(H_cnt = 799) then
                H_cnt <= (others => '0');
                if(V_cnt = 524) then
                    V_cnt <= (others => '0');
                else
                    V_cnt <= V_cnt + 1;
                end if;
            else
                H_cnt <= H_cnt + 1;
            end if;
        end if;
    end process;
    
    VGA_CLK <= pclk;
    VGA_HS <= '0' when (H_cnt >= 0) and (H_cnt <= 95) else '1';
    VGA_VS <= '0' when (V_cnt >= 0) and (V_cnt <= 1) else '1';
    VGA_BLANK <= '1' when (H_cnt >= 140) and (H_cnt <= 790) else '0';
    VGA_SYNC <= '0' when (H_cnt >= 140) and (H_cnt <= 790) else '1';
    VGA_R <= 	"1111111111" when (H_cnt >= 229) and (H_cnt <= 279) and (V_cnt >= 51) and (V_cnt <= 60) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 299) and (V_cnt >= 61) and (V_cnt <= 70) else
					"1111111111" when (H_cnt >= 199) and (H_cnt <= 309) and (V_cnt >= 71) and (V_cnt <= 80) else
					"1111111111" when (H_cnt >= 189) and (H_cnt <= 229) and (V_cnt >= 81) and (V_cnt <= 90) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 309) and (V_cnt >= 81) and (V_cnt <= 90) else
					"1111111111" when (H_cnt >= 189) and (H_cnt <= 219) and (V_cnt >= 91) and (V_cnt <= 100) else
					"1111111111" when (H_cnt >= 289) and (H_cnt <= 319) and (V_cnt >= 91) and (V_cnt <= 100) else
					"1111111111" when (H_cnt >= 179) and (H_cnt <= 209) and (V_cnt >= 101) and (V_cnt <= 110) else
					"1111111111" when (H_cnt >= 299) and (H_cnt <= 329) and (V_cnt >= 101) and (V_cnt <= 110) else
					"1111111111" when (H_cnt >= 179) and (H_cnt <= 209) and (V_cnt >= 111) and (V_cnt <= 120) else
					"1111111111" when (H_cnt >= 299) and (H_cnt <= 329) and (V_cnt >= 111) and (V_cnt <= 120) else
					"1111111111" when (H_cnt >= 179) and (H_cnt <= 209) and (V_cnt >= 121) and (V_cnt <= 130) else
					"1111111111" when (H_cnt >= 299) and (H_cnt <= 329) and (V_cnt >= 121) and (V_cnt <= 130) else
					"1111111111" when (H_cnt >= 179) and (H_cnt <= 209) and (V_cnt >= 131) and (V_cnt <= 140) else
					"1111111111" when (H_cnt >= 289) and (H_cnt <= 319) and (V_cnt >= 131) and (V_cnt <= 140) else
					"1111111111" when (H_cnt >= 189) and (H_cnt <= 219) and (V_cnt >= 141) and (V_cnt <= 150) else
					"1111111111" when (H_cnt >= 289) and (H_cnt <= 319) and (V_cnt >= 141) and (V_cnt <= 150) else
					"1111111111" when (H_cnt >= 189) and (H_cnt <= 229) and (V_cnt >= 151) and (V_cnt <= 160) else
					"1111111111" when (H_cnt >= 279) and (H_cnt <= 309) and (V_cnt >= 151) and (V_cnt <= 160) else
					"1111111111" when (H_cnt >= 199) and (H_cnt <= 309) and (V_cnt >= 161) and (V_cnt <= 170) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 289) and (V_cnt >= 171) and (V_cnt <= 180) else
					"1111111111" when (H_cnt >= 229) and (H_cnt <= 279) and (V_cnt >= 181) and (V_cnt <= 190) else
		
					"1111111111" when (H_cnt >= 159) and (H_cnt <= 349) and (V_cnt >= 221) and (V_cnt <= 230) else
					"1111111111" when (H_cnt >= 159) and (H_cnt <= 349) and (V_cnt >= 231) and (V_cnt <= 240) else
					"1111111111" when (H_cnt >= 159) and (H_cnt <= 349) and (V_cnt >= 241) and (V_cnt <= 250) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 251) and (V_cnt <= 260) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 251) and (V_cnt <= 260) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 261) and (V_cnt <= 270) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 261) and (V_cnt <= 270) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 271) and (V_cnt <= 280) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 271) and (V_cnt <= 280) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 281) and (V_cnt <= 290) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 281) and (V_cnt <= 290) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 291) and (V_cnt <= 300) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 291) and (V_cnt <= 300) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 301) and (V_cnt <= 310) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 301) and (V_cnt <= 310) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 311) and (V_cnt <= 320) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 311) and (V_cnt <= 320) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 321) and (V_cnt <= 330) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 321) and (V_cnt <= 330) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 331) and (V_cnt <= 340) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 331) and (V_cnt <= 340) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 341) and (V_cnt <= 350) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 341) and (V_cnt <= 350) else
					"1111111111" when (H_cnt >= 209) and (H_cnt <= 239) and (V_cnt >= 351) and (V_cnt <= 360) else
					"1111111111" when (H_cnt >= 269) and (H_cnt <= 299) and (V_cnt >= 351) and (V_cnt <= 360) else(others => '0');

    VGA_G <= "1111111111" when (H_cnt >= 360) and (H_cnt <= 579) else (others => '0');
    VGA_B <= "1111111111" when (H_cnt >= 580) and (H_cnt <= 789) else (others => '0');

end BEH;
