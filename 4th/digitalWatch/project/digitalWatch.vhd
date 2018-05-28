-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"
-- CREATED		"Wed Apr 11 10:00:56 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY digitalWatch IS 
	PORT
	(
		nRst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		key_sec :  IN  STD_LOGIC;
		key_min :  IN  STD_LOGIC;
		key_hr :  IN  STD_LOGIC;
		sel_sw :  IN  STD_LOGIC;
		fnd_hr_one :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		fnd_hr_ten :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		fnd_min_one :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		fnd_min_ten :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		fnd_sec_one :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		fnd_sec_ten :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END digitalWatch;

ARCHITECTURE bdf_type OF digitalWatch IS 

COMPONENT counter_12
	PORT(nRst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 digit_one : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 digit_ten : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT counter_60
	PORT(nRst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 carry : OUT STD_LOGIC;
		 digit_one : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 digit_ten : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fnd_decoder
	PORT(data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 fnd_data : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT multiplexer
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 SEL : IN STD_LOGIC;
		 Y : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT sec_gen
	PORT(nRst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 sec_sig : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	hr_clk :  STD_LOGIC;
SIGNAL	hr_cnt_one :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	hr_cnt_ten :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	min_clk :  STD_LOGIC;
SIGNAL	min_cnt_one :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	min_cnt_ten :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	sec_clk :  STD_LOGIC;
SIGNAL	sec_cnt_one :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	sec_cnt_ten :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	sec_sig :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



b2v_U_cnt_hr : counter_12
PORT MAP(nRst => nRst,
		 clk => hr_clk,
		 digit_one => hr_cnt_one,
		 digit_ten => hr_cnt_ten);


b2v_U_cnt_min : counter_60
PORT MAP(nRst => nRst,
		 clk => min_clk,
		 carry => SYNTHESIZED_WIRE_0,
		 digit_one => min_cnt_one,
		 digit_ten => min_cnt_ten);


b2v_U_cnt_sec : counter_60
PORT MAP(nRst => nRst,
		 clk => sec_clk,
		 carry => SYNTHESIZED_WIRE_1,
		 digit_one => sec_cnt_one,
		 digit_ten => sec_cnt_ten);


b2v_U_fnd_hr_one : fnd_decoder
PORT MAP(data => hr_cnt_one,
		 fnd_data => fnd_hr_one);


b2v_U_fnd_hr_ten : fnd_decoder
PORT MAP(data => hr_cnt_ten,
		 fnd_data => fnd_hr_ten);


b2v_U_fnd_min_one : fnd_decoder
PORT MAP(data => min_cnt_one,
		 fnd_data => fnd_min_one);


b2v_U_fnd_min_ten : fnd_decoder
PORT MAP(data => min_cnt_ten,
		 fnd_data => fnd_min_ten);


b2v_U_fnd_sec_one : fnd_decoder
PORT MAP(data => sec_cnt_one,
		 fnd_data => fnd_sec_one);


b2v_U_fnd_sec_ten : fnd_decoder
PORT MAP(data => sec_cnt_ten,
		 fnd_data => fnd_sec_ten);


b2v_U_hr_mux : multiplexer
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 B => key_hr,
		 SEL => sel_sw,
		 Y => hr_clk);


b2v_U_min_mux : multiplexer
PORT MAP(A => SYNTHESIZED_WIRE_1,
		 B => key_min,
		 SEL => sel_sw,
		 Y => min_clk);


b2v_U_sec_gen : sec_gen
PORT MAP(nRst => nRst,
		 clk => clk,
		 sec_sig => sec_sig);


b2v_U_sec_mux : multiplexer
PORT MAP(A => sec_sig,
		 B => key_sec,
		 SEL => sel_sw,
		 Y => sec_clk);


END bdf_type;