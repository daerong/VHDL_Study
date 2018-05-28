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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "04/10/2018 21:48:28"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	counter_12 IS
    PORT (
	nRst : IN std_logic;
	clk : IN std_logic;
	digit_one : OUT std_logic_vector(3 DOWNTO 0);
	digit_ten : OUT std_logic_vector(3 DOWNTO 0)
	);
END counter_12;

-- Design Ports Information
-- digit_one[0]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_one[1]	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_one[2]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_one[3]	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[0]	=>  Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[1]	=>  Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[2]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[3]	=>  Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- nRst	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF counter_12 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_nRst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_digit_one : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_digit_ten : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \nRst~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \count_one[0]~3_combout\ : std_logic;
SIGNAL \nRst~combout\ : std_logic;
SIGNAL \nRst~clkctrl_outclk\ : std_logic;
SIGNAL \Add1~1_combout\ : std_logic;
SIGNAL \count_one~1_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \count_one~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \count_ten[2]~5_combout\ : std_logic;
SIGNAL \count_ten[1]~3_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \count_ten[3]~4_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \count_ten~2_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \count_one~0_combout\ : std_logic;
SIGNAL count_ten : std_logic_vector(3 DOWNTO 0);
SIGNAL count_one : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_nRst~clkctrl_outclk\ : std_logic;
SIGNAL ALT_INV_count_ten : std_logic_vector(0 DOWNTO 0);
SIGNAL ALT_INV_count_one : std_logic_vector(1 DOWNTO 1);

BEGIN

ww_nRst <= nRst;
ww_clk <= clk;
digit_one <= ww_digit_one;
digit_ten <= ww_digit_ten;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\nRst~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \nRst~combout\);
\ALT_INV_nRst~clkctrl_outclk\ <= NOT \nRst~clkctrl_outclk\;
ALT_INV_count_ten(0) <= NOT count_ten(0);
ALT_INV_count_one(1) <= NOT count_one(1);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y33_N4
\count_one[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_one[0]~3_combout\ = !count_one(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count_one(0),
	combout => \count_one[0]~3_combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nRst~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_nRst,
	combout => \nRst~combout\);

-- Location: CLKCTRL_G1
\nRst~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \nRst~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \nRst~clkctrl_outclk\);

-- Location: LCFF_X1_Y33_N5
\count_one[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_one[0]~3_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_one(0));

-- Location: LCCOMB_X1_Y33_N20
\Add1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~1_combout\ = count_one(2) $ (((count_one(0) & !count_one(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_one(0),
	datac => count_one(2),
	datad => count_one(1),
	combout => \Add1~1_combout\);

-- Location: LCCOMB_X1_Y33_N24
\count_one~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_one~1_combout\ = (\Add1~1_combout\ & (!\Equal0~0_combout\ & ((!\process_0~0_combout\) # (!\process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~1_combout\,
	datab => \process_0~0_combout\,
	datac => \Add1~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \count_one~1_combout\);

-- Location: LCFF_X1_Y33_N25
\count_one[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_one~1_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_one(2));

-- Location: LCCOMB_X1_Y33_N30
\Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = count_one(3) $ (((count_one(0) & (count_one(2) & !count_one(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_one(3),
	datab => count_one(0),
	datac => count_one(2),
	datad => count_one(1),
	combout => \Add1~2_combout\);

-- Location: LCCOMB_X1_Y33_N22
\count_one~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_one~2_combout\ = (\Add1~2_combout\ & (!\Equal0~0_combout\ & ((!\process_0~0_combout\) # (!\process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~1_combout\,
	datab => \Add1~2_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \count_one~2_combout\);

-- Location: LCFF_X1_Y33_N23
\count_one[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_one~2_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_one(3));

-- Location: LCCOMB_X1_Y33_N2
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!count_one(2) & (count_one(3) & (count_one(0) & count_one(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_one(2),
	datab => count_one(3),
	datac => count_one(0),
	datad => count_one(1),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y33_N16
\count_ten[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_ten[2]~5_combout\ = count_ten(2) $ (((count_ten(1) & (!count_ten(0) & \Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_ten(1),
	datab => count_ten(0),
	datac => count_ten(2),
	datad => \Equal0~0_combout\,
	combout => \count_ten[2]~5_combout\);

-- Location: LCFF_X1_Y33_N17
\count_ten[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_ten[2]~5_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_ten(2));

-- Location: LCCOMB_X1_Y33_N18
\count_ten[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_ten[1]~3_combout\ = count_ten(1) $ (((!count_ten(0) & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_ten(0),
	datac => count_ten(1),
	datad => \Equal0~0_combout\,
	combout => \count_ten[1]~3_combout\);

-- Location: LCFF_X1_Y33_N19
\count_ten[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_ten[1]~3_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_ten(1));

-- Location: LCCOMB_X1_Y33_N28
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (count_ten(1) & !count_ten(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_ten(1),
	datad => count_ten(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X1_Y33_N26
\count_ten[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_ten[3]~4_combout\ = count_ten(3) $ (((count_ten(2) & (\Add0~0_combout\ & \Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_ten(2),
	datab => \Add0~0_combout\,
	datac => count_ten(3),
	datad => \Equal0~0_combout\,
	combout => \count_ten[3]~4_combout\);

-- Location: LCFF_X1_Y33_N27
\count_ten[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_ten[3]~4_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_ten(3));

-- Location: LCCOMB_X1_Y33_N12
\process_0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = (!count_ten(1) & (!count_one(0) & (!count_ten(2) & !count_ten(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_ten(1),
	datab => count_one(0),
	datac => count_ten(2),
	datad => count_ten(3),
	combout => \process_0~1_combout\);

-- Location: LCCOMB_X1_Y33_N0
\count_ten~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_ten~2_combout\ = (\process_0~0_combout\ & ((\process_0~1_combout\) # (\Equal0~0_combout\ $ (count_ten(0))))) # (!\process_0~0_combout\ & (\Equal0~0_combout\ $ ((count_ten(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~0_combout\,
	datac => count_ten(0),
	datad => \process_0~1_combout\,
	combout => \count_ten~2_combout\);

-- Location: LCFF_X1_Y33_N1
\count_ten[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_ten~2_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_ten(0));

-- Location: LCCOMB_X1_Y33_N14
\process_0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (!count_one(1) & (!count_ten(0) & (!count_one(2) & !count_one(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_one(1),
	datab => count_ten(0),
	datac => count_one(2),
	datad => count_one(3),
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X1_Y33_N8
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = count_one(0) $ (!count_one(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count_one(0),
	datad => count_one(1),
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X1_Y33_N10
\count_one~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_one~0_combout\ = ((\Equal0~0_combout\) # ((\process_0~1_combout\ & \process_0~0_combout\))) # (!\Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~1_combout\,
	datab => \process_0~0_combout\,
	datac => \Add1~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \count_one~0_combout\);

-- Location: LCFF_X1_Y33_N11
\count_one[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count_one~0_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_one(1));

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_one[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => count_one(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(0));

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_one[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => ALT_INV_count_one(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(1));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_one[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => count_one(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(2));

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_one[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => count_one(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(3));

-- Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_ten[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => ALT_INV_count_ten(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(0));

-- Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_ten[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => count_ten(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(1));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_ten[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => count_ten(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(2));

-- Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\digit_ten[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => count_ten(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(3));
END structure;


