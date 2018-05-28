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

-- DATE "04/10/2018 21:02:35"

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

ENTITY 	counter_60 IS
    PORT (
	nRst : IN std_logic;
	clk : IN std_logic;
	digit_one : OUT std_logic_vector(3 DOWNTO 0);
	digit_ten : OUT std_logic_vector(3 DOWNTO 0);
	carry : OUT std_logic
	);
END counter_60;

-- Design Ports Information
-- digit_one[0]	=>  Location: PIN_AC2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_one[1]	=>  Location: PIN_AB3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_one[2]	=>  Location: PIN_AE3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_one[3]	=>  Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[0]	=>  Location: PIN_AD3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[1]	=>  Location: PIN_AD2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[2]	=>  Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- digit_ten[3]	=>  Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- carry	=>  Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- nRst	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF counter_60 IS
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
SIGNAL ww_carry : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \nRst~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \onecnt[0]~3_combout\ : std_logic;
SIGNAL \nRst~combout\ : std_logic;
SIGNAL \nRst~clkctrl_outclk\ : std_logic;
SIGNAL \onecnt~2_combout\ : std_logic;
SIGNAL \onecnt~0_combout\ : std_logic;
SIGNAL \onecnt[2]~1_combout\ : std_logic;
SIGNAL \tencnt[0]~4_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \tencnt[3]~2_combout\ : std_logic;
SIGNAL \tencnt[3]~3_combout\ : std_logic;
SIGNAL \tencnt~1_combout\ : std_logic;
SIGNAL \tencnt~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL tencnt : std_logic_vector(3 DOWNTO 0);
SIGNAL onecnt : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_nRst~clkctrl_outclk\ : std_logic;

BEGIN

ww_nRst <= nRst;
ww_clk <= clk;
digit_one <= ww_digit_one;
digit_ten <= ww_digit_ten;
carry <= ww_carry;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\nRst~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \nRst~combout\);
\ALT_INV_nRst~clkctrl_outclk\ <= NOT \nRst~clkctrl_outclk\;

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

-- Location: LCCOMB_X1_Y4_N24
\onecnt[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \onecnt[0]~3_combout\ = !onecnt(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => onecnt(0),
	combout => \onecnt[0]~3_combout\);

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

-- Location: LCFF_X1_Y4_N25
\onecnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \onecnt[0]~3_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => onecnt(0));

-- Location: LCCOMB_X1_Y4_N10
\onecnt~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \onecnt~2_combout\ = (onecnt(2) & (onecnt(3) $ (((onecnt(0) & onecnt(1)))))) # (!onecnt(2) & (onecnt(3) & ((onecnt(1)) # (!onecnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => onecnt(2),
	datab => onecnt(0),
	datac => onecnt(3),
	datad => onecnt(1),
	combout => \onecnt~2_combout\);

-- Location: LCFF_X1_Y4_N11
\onecnt[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \onecnt~2_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => onecnt(3));

-- Location: LCCOMB_X1_Y4_N14
\onecnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \onecnt~0_combout\ = (onecnt(0) & (!onecnt(1) & ((onecnt(2)) # (!onecnt(3))))) # (!onecnt(0) & (((onecnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => onecnt(2),
	datab => onecnt(0),
	datac => onecnt(1),
	datad => onecnt(3),
	combout => \onecnt~0_combout\);

-- Location: LCFF_X1_Y4_N15
\onecnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \onecnt~0_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => onecnt(1));

-- Location: LCCOMB_X1_Y4_N12
\onecnt[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \onecnt[2]~1_combout\ = onecnt(2) $ (((onecnt(0) & onecnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => onecnt(0),
	datac => onecnt(2),
	datad => onecnt(1),
	combout => \onecnt[2]~1_combout\);

-- Location: LCFF_X1_Y4_N13
\onecnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \onecnt[2]~1_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => onecnt(2));

-- Location: LCCOMB_X1_Y4_N28
\tencnt[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \tencnt[0]~4_combout\ = !tencnt(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => tencnt(0),
	combout => \tencnt[0]~4_combout\);

-- Location: LCCOMB_X1_Y4_N20
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (onecnt(3) & (!onecnt(1) & (onecnt(0) & !onecnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => onecnt(3),
	datab => onecnt(1),
	datac => onecnt(0),
	datad => onecnt(2),
	combout => \Equal0~0_combout\);

-- Location: LCFF_X1_Y4_N29
\tencnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tencnt[0]~4_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	ena => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => tencnt(0));

-- Location: LCCOMB_X1_Y4_N26
\tencnt[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \tencnt[3]~2_combout\ = (tencnt(0) & (tencnt(2) & tencnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => tencnt(0),
	datac => tencnt(2),
	datad => tencnt(1),
	combout => \tencnt[3]~2_combout\);

-- Location: LCCOMB_X1_Y4_N18
\tencnt[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \tencnt[3]~3_combout\ = tencnt(3) $ (((\Equal0~0_combout\ & \tencnt[3]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datac => tencnt(3),
	datad => \tencnt[3]~2_combout\,
	combout => \tencnt[3]~3_combout\);

-- Location: LCFF_X1_Y4_N19
\tencnt[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tencnt[3]~3_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => tencnt(3));

-- Location: LCCOMB_X1_Y4_N16
\tencnt~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \tencnt~1_combout\ = (tencnt(1) & (tencnt(0) $ ((tencnt(2))))) # (!tencnt(1) & (tencnt(2) & ((tencnt(3)) # (!tencnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tencnt(1),
	datab => tencnt(0),
	datac => tencnt(2),
	datad => tencnt(3),
	combout => \tencnt~1_combout\);

-- Location: LCFF_X1_Y4_N17
\tencnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tencnt~1_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	ena => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => tencnt(2));

-- Location: LCCOMB_X1_Y4_N30
\tencnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tencnt~0_combout\ = (tencnt(1) & (((!tencnt(0))))) # (!tencnt(1) & (tencnt(0) & ((tencnt(3)) # (!tencnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tencnt(3),
	datab => tencnt(2),
	datac => tencnt(1),
	datad => tencnt(0),
	combout => \tencnt~0_combout\);

-- Location: LCFF_X1_Y4_N31
\tencnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \tencnt~0_combout\,
	aclr => \ALT_INV_nRst~clkctrl_outclk\,
	ena => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => tencnt(1));

-- Location: LCCOMB_X1_Y4_N22
\Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!tencnt(3) & (tencnt(2) & (!tencnt(1) & tencnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tencnt(3),
	datab => tencnt(2),
	datac => tencnt(1),
	datad => tencnt(0),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X1_Y4_N8
\process_0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\Equal1~0_combout\ & \Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal1~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \process_0~0_combout\);

-- Location: PIN_AC2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => onecnt(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(0));

-- Location: PIN_AB3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => onecnt(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(1));

-- Location: PIN_AE3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => onecnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(2));

-- Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => onecnt(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_one(3));

-- Location: PIN_AD3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => tencnt(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(0));

-- Location: PIN_AD2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => tencnt(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(1));

-- Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => tencnt(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(2));

-- Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	datain => tencnt(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_digit_ten(3));

-- Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\carry~I\ : cycloneii_io
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
	datain => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_carry);
END structure;


