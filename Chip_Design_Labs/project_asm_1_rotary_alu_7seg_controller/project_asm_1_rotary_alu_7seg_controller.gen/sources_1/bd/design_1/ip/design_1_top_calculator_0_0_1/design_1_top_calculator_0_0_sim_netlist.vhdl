-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Sat Oct 25 20:37:15 2025
-- Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/hkngu/Documents/Vivado/Personalization/project_asm_1_rotary_alu_7seg_controller/project_asm_1_rotary_alu_7seg_controller.gen/sources_1/bd/design_1/ip/design_1_top_calculator_0_0_1/design_1_top_calculator_0_0_sim_netlist.vhdl
-- Design      : design_1_top_calculator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0_button_debounce is
  port (
    press_pulse : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enc_sw : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_calculator_0_0_button_debounce : entity is "button_debounce";
end design_1_top_calculator_0_0_button_debounce;

architecture STRUCTURE of design_1_top_calculator_0_0_button_debounce is
  signal counter : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal counter0 : STD_LOGIC_VECTOR ( 20 downto 1 );
  signal \counter0_carry__0_n_0\ : STD_LOGIC;
  signal \counter0_carry__0_n_1\ : STD_LOGIC;
  signal \counter0_carry__0_n_2\ : STD_LOGIC;
  signal \counter0_carry__0_n_3\ : STD_LOGIC;
  signal \counter0_carry__1_n_0\ : STD_LOGIC;
  signal \counter0_carry__1_n_1\ : STD_LOGIC;
  signal \counter0_carry__1_n_2\ : STD_LOGIC;
  signal \counter0_carry__1_n_3\ : STD_LOGIC;
  signal \counter0_carry__2_n_0\ : STD_LOGIC;
  signal \counter0_carry__2_n_1\ : STD_LOGIC;
  signal \counter0_carry__2_n_2\ : STD_LOGIC;
  signal \counter0_carry__2_n_3\ : STD_LOGIC;
  signal \counter0_carry__3_n_1\ : STD_LOGIC;
  signal \counter0_carry__3_n_2\ : STD_LOGIC;
  signal \counter0_carry__3_n_3\ : STD_LOGIC;
  signal counter0_carry_n_0 : STD_LOGIC;
  signal counter0_carry_n_1 : STD_LOGIC;
  signal counter0_carry_n_2 : STD_LOGIC;
  signal counter0_carry_n_3 : STD_LOGIC;
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[10]_i_1_n_0\ : STD_LOGIC;
  signal \counter[11]_i_1_n_0\ : STD_LOGIC;
  signal \counter[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter[13]_i_1_n_0\ : STD_LOGIC;
  signal \counter[14]_i_1_n_0\ : STD_LOGIC;
  signal \counter[15]_i_1_n_0\ : STD_LOGIC;
  signal \counter[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter[17]_i_1_n_0\ : STD_LOGIC;
  signal \counter[18]_i_1_n_0\ : STD_LOGIC;
  signal \counter[19]_i_1_n_0\ : STD_LOGIC;
  signal \counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter[20]_i_2_n_0\ : STD_LOGIC;
  signal \counter[20]_i_3_n_0\ : STD_LOGIC;
  signal \counter[20]_i_4_n_0\ : STD_LOGIC;
  signal \counter[20]_i_5_n_0\ : STD_LOGIC;
  signal \counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \counter[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \counter[6]_i_1_n_0\ : STD_LOGIC;
  signal \counter[7]_i_1_n_0\ : STD_LOGIC;
  signal \counter[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter[9]_i_1_n_0\ : STD_LOGIC;
  signal last_stable : STD_LOGIC;
  signal last_stable_i_1_n_0 : STD_LOGIC;
  signal press_pulse_i_1_n_0 : STD_LOGIC;
  signal stable_i_1_n_0 : STD_LOGIC;
  signal stable_reg_n_0 : STD_LOGIC;
  signal \NLW_counter0_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__3\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \counter[10]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter[11]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[12]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[13]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[14]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[15]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[16]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[17]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[18]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[19]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[20]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[8]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[9]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of last_stable_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of press_pulse_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of stable_i_1 : label is "soft_lutpair11";
begin
counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => counter0_carry_n_0,
      CO(2) => counter0_carry_n_1,
      CO(1) => counter0_carry_n_2,
      CO(0) => counter0_carry_n_3,
      CYINIT => counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => counter0(4 downto 1),
      S(3 downto 0) => counter(4 downto 1)
    );
\counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => counter0_carry_n_0,
      CO(3) => \counter0_carry__0_n_0\,
      CO(2) => \counter0_carry__0_n_1\,
      CO(1) => \counter0_carry__0_n_2\,
      CO(0) => \counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => counter0(8 downto 5),
      S(3 downto 0) => counter(8 downto 5)
    );
\counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__0_n_0\,
      CO(3) => \counter0_carry__1_n_0\,
      CO(2) => \counter0_carry__1_n_1\,
      CO(1) => \counter0_carry__1_n_2\,
      CO(0) => \counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => counter0(12 downto 9),
      S(3 downto 0) => counter(12 downto 9)
    );
\counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__1_n_0\,
      CO(3) => \counter0_carry__2_n_0\,
      CO(2) => \counter0_carry__2_n_1\,
      CO(1) => \counter0_carry__2_n_2\,
      CO(0) => \counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => counter0(16 downto 13),
      S(3 downto 0) => counter(16 downto 13)
    );
\counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__2_n_0\,
      CO(3) => \NLW_counter0_carry__3_CO_UNCONNECTED\(3),
      CO(2) => \counter0_carry__3_n_1\,
      CO(1) => \counter0_carry__3_n_2\,
      CO(0) => \counter0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => counter0(20 downto 17),
      S(3 downto 0) => counter(20 downto 17)
    );
\counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0028"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter(0),
      O => \counter[0]_i_1_n_0\
    );
\counter[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(10),
      O => \counter[10]_i_1_n_0\
    );
\counter[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(11),
      O => \counter[11]_i_1_n_0\
    );
\counter[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(12),
      O => \counter[12]_i_1_n_0\
    );
\counter[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(13),
      O => \counter[13]_i_1_n_0\
    );
\counter[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(14),
      O => \counter[14]_i_1_n_0\
    );
\counter[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(15),
      O => \counter[15]_i_1_n_0\
    );
\counter[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(16),
      O => \counter[16]_i_1_n_0\
    );
\counter[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(17),
      O => \counter[17]_i_1_n_0\
    );
\counter[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(18),
      O => \counter[18]_i_1_n_0\
    );
\counter[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(19),
      O => \counter[19]_i_1_n_0\
    );
\counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(1),
      O => \counter[1]_i_1_n_0\
    );
\counter[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(20),
      O => \counter[20]_i_1_n_0\
    );
\counter[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8FFF"
    )
        port map (
      I0 => \counter[20]_i_3_n_0\,
      I1 => \counter[20]_i_4_n_0\,
      I2 => counter(19),
      I3 => counter(20),
      I4 => \counter[20]_i_5_n_0\,
      O => \counter[20]_i_2_n_0\
    );
\counter[20]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => counter(16),
      I1 => counter(11),
      I2 => counter(12),
      I3 => counter(14),
      I4 => counter(13),
      O => \counter[20]_i_3_n_0\
    );
\counter[20]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => counter(7),
      I1 => counter(8),
      I2 => counter(9),
      I3 => counter(10),
      O => \counter[20]_i_4_n_0\
    );
\counter[20]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"777F"
    )
        port map (
      I0 => counter(18),
      I1 => counter(17),
      I2 => counter(15),
      I3 => counter(16),
      O => \counter[20]_i_5_n_0\
    );
\counter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(2),
      O => \counter[2]_i_1_n_0\
    );
\counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(3),
      O => \counter[3]_i_1_n_0\
    );
\counter[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(4),
      O => \counter[4]_i_1_n_0\
    );
\counter[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(5),
      O => \counter[5]_i_1_n_0\
    );
\counter[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(6),
      O => \counter[6]_i_1_n_0\
    );
\counter[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(7),
      O => \counter[7]_i_1_n_0\
    );
\counter[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(8),
      O => \counter[8]_i_1_n_0\
    );
\counter[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2800"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => counter0(9),
      O => \counter[9]_i_1_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[0]_i_1_n_0\,
      Q => counter(0)
    );
\counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[10]_i_1_n_0\,
      Q => counter(10)
    );
\counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[11]_i_1_n_0\,
      Q => counter(11)
    );
\counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[12]_i_1_n_0\,
      Q => counter(12)
    );
\counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[13]_i_1_n_0\,
      Q => counter(13)
    );
\counter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[14]_i_1_n_0\,
      Q => counter(14)
    );
\counter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[15]_i_1_n_0\,
      Q => counter(15)
    );
\counter_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[16]_i_1_n_0\,
      Q => counter(16)
    );
\counter_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[17]_i_1_n_0\,
      Q => counter(17)
    );
\counter_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[18]_i_1_n_0\,
      Q => counter(18)
    );
\counter_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[19]_i_1_n_0\,
      Q => counter(19)
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[1]_i_1_n_0\,
      Q => counter(1)
    );
\counter_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[20]_i_1_n_0\,
      Q => counter(20)
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[2]_i_1_n_0\,
      Q => counter(2)
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[3]_i_1_n_0\,
      Q => counter(3)
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[4]_i_1_n_0\,
      Q => counter(4)
    );
\counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[5]_i_1_n_0\,
      Q => counter(5)
    );
\counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[6]_i_1_n_0\,
      Q => counter(6)
    );
\counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[7]_i_1_n_0\,
      Q => counter(7)
    );
\counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[8]_i_1_n_0\,
      Q => counter(8)
    );
\counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \counter[9]_i_1_n_0\,
      Q => counter(9)
    );
last_stable_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB10"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      I3 => last_stable,
      O => last_stable_i_1_n_0
    );
last_stable_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => last_stable_i_1_n_0,
      PRE => rst,
      Q => last_stable
    );
press_pulse_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => stable_reg_n_0,
      I1 => enc_sw,
      I2 => last_stable,
      I3 => \counter[20]_i_2_n_0\,
      O => press_pulse_i_1_n_0
    );
press_pulse_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => press_pulse_i_1_n_0,
      Q => press_pulse
    );
stable_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E4"
    )
        port map (
      I0 => \counter[20]_i_2_n_0\,
      I1 => enc_sw,
      I2 => stable_reg_n_0,
      O => stable_i_1_n_0
    );
stable_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => stable_i_1_n_0,
      PRE => rst,
      Q => stable_reg_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0_digit_driver is
  port (
    start : out STD_LOGIC;
    \scan_cnt_reg[1]\ : out STD_LOGIC;
    \data16_reg[14]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_calculator_0_0_digit_driver : entity is "digit_driver";
end design_1_top_calculator_0_0_digit_driver;

architecture STRUCTURE of design_1_top_calculator_0_0_digit_driver is
  signal \data16[0]_i_1_n_0\ : STD_LOGIC;
  signal \data16[1]_i_1_n_0\ : STD_LOGIC;
  signal \data16[2]_i_1_n_0\ : STD_LOGIC;
  signal \data16[3]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data16[14]_i_7\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \data16[1]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \data16[2]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \data16[3]_i_1\ : label is "soft_lutpair42";
begin
\data16[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \data16[0]_i_1_n_0\
    );
\data16[14]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => Q(1),
      I1 => state(0),
      I2 => Q(0),
      I3 => state(1),
      O => \scan_cnt_reg[1]\
    );
\data16[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \data16[1]_i_1_n_0\
    );
\data16[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      O => \data16[2]_i_1_n_0\
    );
\data16[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \data16[3]_i_1_n_0\
    );
\data16_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => \data16[0]_i_1_n_0\,
      PRE => rst,
      Q => \data16_reg[14]_0\(0)
    );
\data16_reg[10]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => D(2),
      PRE => rst,
      Q => \data16_reg[14]_0\(7)
    );
\data16_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => D(3),
      PRE => rst,
      Q => \data16_reg[14]_0\(8)
    );
\data16_reg[12]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => D(4),
      PRE => rst,
      Q => \data16_reg[14]_0\(9)
    );
\data16_reg[13]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => D(5),
      PRE => rst,
      Q => \data16_reg[14]_0\(10)
    );
\data16_reg[14]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => D(6),
      PRE => rst,
      Q => \data16_reg[14]_0\(11)
    );
\data16_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => \data16[1]_i_1_n_0\,
      PRE => rst,
      Q => \data16_reg[14]_0\(1)
    );
\data16_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => \data16[2]_i_1_n_0\,
      PRE => rst,
      Q => \data16_reg[14]_0\(2)
    );
\data16_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => \data16[3]_i_1_n_0\,
      PRE => rst,
      Q => \data16_reg[14]_0\(3)
    );
\data16_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => '0',
      PRE => rst,
      Q => \data16_reg[14]_0\(4)
    );
\data16_reg[8]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => D(0),
      PRE => rst,
      Q => \data16_reg[14]_0\(5)
    );
\data16_reg[9]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => E(0),
      D => D(1),
      PRE => rst,
      Q => \data16_reg[14]_0\(6)
    );
start_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => E(0),
      Q => start
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0_fsm_controller is
  port (
    state : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 6 downto 0 );
    rot_up : in STD_LOGIC;
    rot_down : in STD_LOGIC;
    \data16_reg[14]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    press_pulse : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_calculator_0_0_fsm_controller : entity is "fsm_controller";
end design_1_top_calculator_0_0_fsm_controller;

architecture STRUCTURE of design_1_top_calculator_0_0_fsm_controller is
  signal A : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \A[0]_i_1_n_0\ : STD_LOGIC;
  signal \A[1]_i_1_n_0\ : STD_LOGIC;
  signal \A[2]_i_1_n_0\ : STD_LOGIC;
  signal \A[3]_i_1_n_0\ : STD_LOGIC;
  signal \A[3]_i_2_n_0\ : STD_LOGIC;
  signal \A[3]_i_3_n_0\ : STD_LOGIC;
  signal B : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \B[0]_i_1_n_0\ : STD_LOGIC;
  signal \B[1]_i_1_n_0\ : STD_LOGIC;
  signal \B[2]_i_1_n_0\ : STD_LOGIC;
  signal \B[3]_i_1_n_0\ : STD_LOGIC;
  signal \B[3]_i_2_n_0\ : STD_LOGIC;
  signal \B[3]_i_3_n_0\ : STD_LOGIC;
  signal \data16[14]_i_10_n_0\ : STD_LOGIC;
  signal \data16[14]_i_11_n_0\ : STD_LOGIC;
  signal \data16[14]_i_12_n_0\ : STD_LOGIC;
  signal \data16[14]_i_15_n_0\ : STD_LOGIC;
  signal \data16[14]_i_16_n_0\ : STD_LOGIC;
  signal \data16[14]_i_17_n_0\ : STD_LOGIC;
  signal \data16[14]_i_18_n_0\ : STD_LOGIC;
  signal \data16[14]_i_19_n_0\ : STD_LOGIC;
  signal \data16[14]_i_20_n_0\ : STD_LOGIC;
  signal \data16[14]_i_21_n_0\ : STD_LOGIC;
  signal \data16[14]_i_22_n_0\ : STD_LOGIC;
  signal \data16[14]_i_23_n_0\ : STD_LOGIC;
  signal \data16[14]_i_24_n_0\ : STD_LOGIC;
  signal \data16[14]_i_25_n_0\ : STD_LOGIC;
  signal \data16[14]_i_26_n_0\ : STD_LOGIC;
  signal \data16[14]_i_28_n_0\ : STD_LOGIC;
  signal \data16[14]_i_29_n_0\ : STD_LOGIC;
  signal \data16[14]_i_30_n_0\ : STD_LOGIC;
  signal \data16[14]_i_31_n_0\ : STD_LOGIC;
  signal \data16[14]_i_32_n_0\ : STD_LOGIC;
  signal \data16[14]_i_35_n_0\ : STD_LOGIC;
  signal \data16[14]_i_36_n_0\ : STD_LOGIC;
  signal \data16[14]_i_37_n_0\ : STD_LOGIC;
  signal \data16[14]_i_38_n_0\ : STD_LOGIC;
  signal \data16[14]_i_39_n_0\ : STD_LOGIC;
  signal \data16[14]_i_6_n_0\ : STD_LOGIC;
  signal \data16[14]_i_9_n_0\ : STD_LOGIC;
  signal opcode : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \opcode[0]_i_1_n_0\ : STD_LOGIC;
  signal \opcode[1]_i_1_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal result : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \A[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \A[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \A[3]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \A[3]_i_3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \B[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \B[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \B[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \B[3]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \B[3]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \data16[10]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \data16[11]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \data16[12]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \data16[13]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \data16[14]_i_20\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \data16[14]_i_23\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \data16[14]_i_24\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \data16[14]_i_25\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \data16[14]_i_26\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \data16[14]_i_27\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \data16[14]_i_28\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \data16[14]_i_30\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \data16[14]_i_31\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \data16[14]_i_32\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \data16[14]_i_33\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \data16[14]_i_34\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \data16[14]_i_36\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \data16[14]_i_37\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \data16[14]_i_38\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \data16[14]_i_39\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \data16[14]_i_9\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \data16[8]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \data16[9]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \state[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \state[1]_i_1\ : label is "soft_lutpair28";
begin
  state(1 downto 0) <= \^state\(1 downto 0);
\A[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => A(0),
      O => \A[0]_i_1_n_0\
    );
\A[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => A(0),
      I1 => rot_up,
      I2 => A(1),
      O => \A[1]_i_1_n_0\
    );
\A[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA9"
    )
        port map (
      I0 => A(2),
      I1 => rot_up,
      I2 => A(1),
      I3 => A(0),
      O => \A[2]_i_1_n_0\
    );
\A[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0007000E00070000"
    )
        port map (
      I0 => \A[3]_i_3_n_0\,
      I1 => A(3),
      I2 => \^state\(0),
      I3 => \^state\(1),
      I4 => rot_up,
      I5 => rot_down,
      O => \A[3]_i_1_n_0\
    );
\A[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
        port map (
      I0 => A(3),
      I1 => rot_up,
      I2 => A(1),
      I3 => A(0),
      I4 => A(2),
      O => \A[3]_i_2_n_0\
    );
\A[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => A(0),
      I1 => A(1),
      I2 => A(2),
      O => \A[3]_i_3_n_0\
    );
\A_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \A[3]_i_1_n_0\,
      CLR => rst,
      D => \A[0]_i_1_n_0\,
      Q => A(0)
    );
\A_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \A[3]_i_1_n_0\,
      CLR => rst,
      D => \A[1]_i_1_n_0\,
      Q => A(1)
    );
\A_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \A[3]_i_1_n_0\,
      CLR => rst,
      D => \A[2]_i_1_n_0\,
      Q => A(2)
    );
\A_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \A[3]_i_1_n_0\,
      CLR => rst,
      D => \A[3]_i_2_n_0\,
      Q => A(3)
    );
\B[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => B(0),
      O => \B[0]_i_1_n_0\
    );
\B[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => rot_up,
      I1 => B(0),
      I2 => B(1),
      O => \B[1]_i_1_n_0\
    );
\B[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA9"
    )
        port map (
      I0 => B(2),
      I1 => rot_up,
      I2 => B(1),
      I3 => B(0),
      O => \B[2]_i_1_n_0\
    );
\B[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07000E0007000000"
    )
        port map (
      I0 => \B[3]_i_3_n_0\,
      I1 => B(3),
      I2 => \^state\(1),
      I3 => \^state\(0),
      I4 => rot_up,
      I5 => rot_down,
      O => \B[3]_i_1_n_0\
    );
\B[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
        port map (
      I0 => B(3),
      I1 => rot_up,
      I2 => B(1),
      I3 => B(0),
      I4 => B(2),
      O => \B[3]_i_2_n_0\
    );
\B[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => B(0),
      I1 => B(1),
      I2 => B(2),
      O => \B[3]_i_3_n_0\
    );
\B_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \B[3]_i_1_n_0\,
      CLR => rst,
      D => \B[0]_i_1_n_0\,
      Q => B(0)
    );
\B_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \B[3]_i_1_n_0\,
      CLR => rst,
      D => \B[1]_i_1_n_0\,
      Q => B(1)
    );
\B_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \B[3]_i_1_n_0\,
      CLR => rst,
      D => \B[2]_i_1_n_0\,
      Q => B(2)
    );
\B_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \B[3]_i_1_n_0\,
      CLR => rst,
      D => \B[3]_i_2_n_0\,
      Q => B(3)
    );
\data16[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C0C2"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => sel0(3),
      I3 => sel0(0),
      O => D(2)
    );
\data16[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9886"
    )
        port map (
      I0 => sel0(0),
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => sel0(3),
      O => D(3)
    );
\data16[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0CCE"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => sel0(3),
      I3 => sel0(1),
      O => D(4)
    );
\data16[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"280E"
    )
        port map (
      I0 => sel0(0),
      I1 => sel0(1),
      I2 => sel0(3),
      I3 => sel0(2),
      O => D(5)
    );
\data16[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6141"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(3),
      I2 => sel0(2),
      I3 => sel0(0),
      O => D(6)
    );
\data16[14]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A800A800A80000"
    )
        port map (
      I0 => \data16[14]_i_24_n_0\,
      I1 => \data16[14]_i_19_n_0\,
      I2 => \data16[14]_i_20_n_0\,
      I3 => opcode(1),
      I4 => result(2),
      I5 => result(3),
      O => \data16[14]_i_10_n_0\
    );
\data16[14]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFAAC000000000"
    )
        port map (
      I0 => opcode(1),
      I1 => B(1),
      I2 => \^state\(0),
      I3 => \^state\(1),
      I4 => Q(0),
      I5 => Q(1),
      O => \data16[14]_i_11_n_0\
    );
\data16[14]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFE0000AAAE0000"
    )
        port map (
      I0 => Q(0),
      I1 => A(3),
      I2 => \^state\(0),
      I3 => \^state\(1),
      I4 => Q(1),
      I5 => B(3),
      O => \data16[14]_i_12_n_0\
    );
\data16[14]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAEAEABAEABABABA"
    )
        port map (
      I0 => \data16[14]_i_25_n_0\,
      I1 => \data16[14]_i_26_n_0\,
      I2 => \data16[14]_i_23_n_0\,
      I3 => p_1_in(2),
      I4 => \data16[14]_i_28_n_0\,
      I5 => \data16[14]_i_29_n_0\,
      O => result(3)
    );
\data16[14]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEAAEBAA"
    )
        port map (
      I0 => \data16[14]_i_30_n_0\,
      I1 => A(2),
      I2 => B(2),
      I3 => \data16[14]_i_23_n_0\,
      I4 => \data16[14]_i_29_n_0\,
      O => result(2)
    );
\data16[14]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBABAAABBBBBBBB"
    )
        port map (
      I0 => opcode(1),
      I1 => \data16[14]_i_20_n_0\,
      I2 => \data16[14]_i_31_n_0\,
      I3 => \data16[14]_i_32_n_0\,
      I4 => p_1_in(3),
      I5 => opcode(0),
      O => \data16[14]_i_15_n_0\
    );
\data16[14]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0000E200000000"
    )
        port map (
      I0 => A(2),
      I1 => \^state\(0),
      I2 => B(2),
      I3 => \^state\(1),
      I4 => Q(0),
      I5 => Q(1),
      O => \data16[14]_i_16_n_0\
    );
\data16[14]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000C00000000A0"
    )
        port map (
      I0 => A(0),
      I1 => result(0),
      I2 => Q(1),
      I3 => \^state\(0),
      I4 => Q(0),
      I5 => \^state\(1),
      O => \data16[14]_i_17_n_0\
    );
\data16[14]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00B88800000000"
    )
        port map (
      I0 => opcode(0),
      I1 => \^state\(1),
      I2 => B(0),
      I3 => \^state\(0),
      I4 => Q(0),
      I5 => Q(1),
      O => \data16[14]_i_18_n_0\
    );
\data16[14]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001717FF00000000"
    )
        port map (
      I0 => \data16[14]_i_29_n_0\,
      I1 => \data16[14]_i_28_n_0\,
      I2 => p_1_in(2),
      I3 => \data16[14]_i_32_n_0\,
      I4 => p_1_in(3),
      I5 => opcode(0),
      O => \data16[14]_i_19_n_0\
    );
\data16[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF48"
    )
        port map (
      I0 => \data16[14]_i_6_n_0\,
      I1 => \data16_reg[14]\,
      I2 => result(1),
      I3 => \data16[14]_i_9_n_0\,
      I4 => \data16[14]_i_10_n_0\,
      I5 => \data16[14]_i_11_n_0\,
      O => sel0(1)
    );
\data16[14]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3220"
    )
        port map (
      I0 => \data16[14]_i_35_n_0\,
      I1 => opcode(0),
      I2 => B(3),
      I3 => A(3),
      O => \data16[14]_i_20_n_0\
    );
\data16[14]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DCCC899989991000"
    )
        port map (
      I0 => opcode(0),
      I1 => opcode(1),
      I2 => B(0),
      I3 => A(0),
      I4 => B(1),
      I5 => A(1),
      O => \data16[14]_i_21_n_0\
    );
\data16[14]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F5E7F7E7E7E7E7"
    )
        port map (
      I0 => B(0),
      I1 => \data16[14]_i_36_n_0\,
      I2 => A(0),
      I3 => B(1),
      I4 => A(1),
      I5 => \data16[14]_i_37_n_0\,
      O => \data16[14]_i_22_n_0\
    );
\data16[14]_i_23\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => opcode(0),
      I1 => opcode(1),
      O => \data16[14]_i_23_n_0\
    );
\data16[14]_i_24\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^state\(1),
      I1 => \^state\(0),
      I2 => Q(0),
      O => \data16[14]_i_24_n_0\
    );
\data16[14]_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E809E806"
    )
        port map (
      I0 => A(3),
      I1 => B(3),
      I2 => opcode(0),
      I3 => opcode(1),
      I4 => \data16[14]_i_35_n_0\,
      O => \data16[14]_i_25_n_0\
    );
\data16[14]_i_26\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(3),
      I1 => A(3),
      O => \data16[14]_i_26_n_0\
    );
\data16[14]_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CF4DB2F3"
    )
        port map (
      I0 => B(2),
      I1 => A(3),
      I2 => B(3),
      I3 => \data16[14]_i_38_n_0\,
      I4 => A(2),
      O => p_1_in(2)
    );
\data16[14]_i_28\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"71F3CF8E"
    )
        port map (
      I0 => A(2),
      I1 => A(3),
      I2 => B(3),
      I3 => \data16[14]_i_38_n_0\,
      I4 => B(2),
      O => \data16[14]_i_28_n_0\
    );
\data16[14]_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC0CFBFFFFCFBABB"
    )
        port map (
      I0 => \data16[14]_i_37_n_0\,
      I1 => A(1),
      I2 => B(0),
      I3 => A(0),
      I4 => \data16[14]_i_36_n_0\,
      I5 => B(1),
      O => \data16[14]_i_29_n_0\
    );
\data16[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAEAEAAA"
    )
        port map (
      I0 => \data16[14]_i_12_n_0\,
      I1 => \data16_reg[14]\,
      I2 => result(3),
      I3 => result(2),
      I4 => \data16[14]_i_15_n_0\,
      I5 => result(1),
      O => sel0(3)
    );
\data16[14]_i_30\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E809E806"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      I2 => opcode(0),
      I3 => opcode(1),
      I4 => \data16[14]_i_39_n_0\,
      O => \data16[14]_i_30_n_0\
    );
\data16[14]_i_31\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDBF0DB0"
    )
        port map (
      I0 => B(3),
      I1 => A(3),
      I2 => B(2),
      I3 => A(2),
      I4 => \data16[14]_i_29_n_0\,
      O => \data16[14]_i_31_n_0\
    );
\data16[14]_i_32\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FDFFBF2"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      I2 => A(3),
      I3 => \data16[14]_i_38_n_0\,
      I4 => B(3),
      O => \data16[14]_i_32_n_0\
    );
\data16[14]_i_33\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BF2FF4FD"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      I2 => B(3),
      I3 => \data16[14]_i_38_n_0\,
      I4 => A(3),
      O => p_1_in(3)
    );
\data16[14]_i_34\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ADD0"
    )
        port map (
      I0 => opcode(1),
      I1 => opcode(0),
      I2 => B(0),
      I3 => A(0),
      O => result(0)
    );
\data16[14]_i_35\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF880F8800000"
    )
        port map (
      I0 => B(0),
      I1 => A(0),
      I2 => A(1),
      I3 => B(1),
      I4 => A(2),
      I5 => B(2),
      O => \data16[14]_i_35_n_0\
    );
\data16[14]_i_36\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => A(2),
      I1 => B(2),
      I2 => B(3),
      I3 => A(3),
      O => \data16[14]_i_36_n_0\
    );
\data16[14]_i_37\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => B(3),
      I1 => A(3),
      I2 => B(2),
      I3 => A(2),
      O => \data16[14]_i_37_n_0\
    );
\data16[14]_i_38\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF0B"
    )
        port map (
      I0 => A(0),
      I1 => B(0),
      I2 => B(1),
      I3 => A(1),
      O => \data16[14]_i_38_n_0\
    );
\data16[14]_i_39\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => B(0),
      I1 => A(0),
      I2 => A(1),
      I3 => B(1),
      O => \data16[14]_i_39_n_0\
    );
\data16[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAEEEEAAAAAE"
    )
        port map (
      I0 => \data16[14]_i_16_n_0\,
      I1 => \data16_reg[14]\,
      I2 => result(1),
      I3 => \data16[14]_i_15_n_0\,
      I4 => result(2),
      I5 => result(3),
      O => sel0(2)
    );
\data16[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF8000"
    )
        port map (
      I0 => \^state\(0),
      I1 => Q(0),
      I2 => \^state\(1),
      I3 => \data16[14]_i_6_n_0\,
      I4 => \data16[14]_i_17_n_0\,
      I5 => \data16[14]_i_18_n_0\,
      O => sel0(0)
    );
\data16[14]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF1000EF100000E"
    )
        port map (
      I0 => \data16[14]_i_19_n_0\,
      I1 => \data16[14]_i_20_n_0\,
      I2 => opcode(1),
      I3 => result(2),
      I4 => result(3),
      I5 => result(1),
      O => \data16[14]_i_6_n_0\
    );
\data16[14]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAEAEABA"
    )
        port map (
      I0 => \data16[14]_i_21_n_0\,
      I1 => \data16[14]_i_22_n_0\,
      I2 => \data16[14]_i_23_n_0\,
      I3 => B(1),
      I4 => A(1),
      O => result(1)
    );
\data16[14]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => A(1),
      I1 => Q(1),
      I2 => \^state\(0),
      I3 => \^state\(1),
      O => \data16[14]_i_9_n_0\
    );
\data16[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0892"
    )
        port map (
      I0 => sel0(0),
      I1 => sel0(3),
      I2 => sel0(2),
      I3 => sel0(1),
      O => D(0)
    );
\data16[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CAA8"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(3),
      I2 => sel0(1),
      I3 => sel0(0),
      O => D(1)
    );
\opcode[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F3F70C08"
    )
        port map (
      I0 => rot_down,
      I1 => \^state\(1),
      I2 => \^state\(0),
      I3 => rot_up,
      I4 => opcode(0),
      O => \opcode[0]_i_1_n_0\
    );
\opcode[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F6FFF7FF09000800"
    )
        port map (
      I0 => opcode(0),
      I1 => rot_up,
      I2 => \^state\(0),
      I3 => \^state\(1),
      I4 => rot_down,
      I5 => opcode(1),
      O => \opcode[1]_i_1_n_0\
    );
\opcode_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \opcode[0]_i_1_n_0\,
      Q => opcode(0)
    );
\opcode_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \opcode[1]_i_1_n_0\,
      Q => opcode(1)
    );
\state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => press_pulse,
      I1 => \^state\(0),
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^state\(0),
      I1 => press_pulse,
      I2 => \^state\(1),
      O => \state[1]_i_1_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \state[0]_i_1_n_0\,
      Q => \^state\(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \state[1]_i_1_n_0\,
      Q => \^state\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0_rotary_decoder is
  port (
    rot_up : out STD_LOGIC;
    rot_down : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enc_b : in STD_LOGIC;
    enc_a : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_calculator_0_0_rotary_decoder : entity is "rotary_decoder";
end design_1_top_calculator_0_0_rotary_decoder;

architecture STRUCTURE of design_1_top_calculator_0_0_rotary_decoder is
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal step_down_i_1_n_0 : STD_LOGIC;
  signal step_up_i_1_n_0 : STD_LOGIC;
  signal sync_a : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sync_b : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of step_down_i_1 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of step_up_i_1 : label is "soft_lutpair29";
begin
\curr_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => sync_b(1),
      Q => p_0_in(0)
    );
\curr_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => sync_a(1),
      Q => p_0_in(1)
    );
\prev_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => p_0_in(0),
      Q => p_0_in(2)
    );
\prev_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => p_0_in(1),
      Q => p_0_in(3)
    );
step_down_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => p_0_in(3),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      I3 => p_0_in(1),
      O => step_down_i_1_n_0
    );
step_down_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => step_down_i_1_n_0,
      Q => rot_down
    );
step_up_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      O => step_up_i_1_n_0
    );
step_up_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => step_up_i_1_n_0,
      Q => rot_up
    );
\sync_a_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => enc_a,
      Q => sync_a(0),
      R => '0'
    );
\sync_a_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => sync_a(0),
      Q => sync_a(1),
      R => '0'
    );
\sync_b_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => enc_b,
      Q => sync_b(0),
      R => '0'
    );
\sync_b_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => sync_b(0),
      Q => sync_b(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0_shift_74hc595 is
  port (
    SCLK : out STD_LOGIC;
    RCLK : out STD_LOGIC;
    DIO : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    start : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_calculator_0_0_shift_74hc595 : entity is "shift_74hc595";
end design_1_top_calculator_0_0_shift_74hc595;

architecture STRUCTURE of design_1_top_calculator_0_0_shift_74hc595 is
  signal \^dio\ : STD_LOGIC;
  signal DIO_i_1_n_0 : STD_LOGIC;
  signal DIO_i_2_n_0 : STD_LOGIC;
  signal DIO_i_3_n_0 : STD_LOGIC;
  signal DIO_i_4_n_0 : STD_LOGIC;
  signal DIO_i_5_n_0 : STD_LOGIC;
  signal DIO_i_6_n_0 : STD_LOGIC;
  signal DIO_i_7_n_0 : STD_LOGIC;
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \^rclk\ : STD_LOGIC;
  signal RCLK_i_1_n_0 : STD_LOGIC;
  signal \^sclk\ : STD_LOGIC;
  signal SCLK_i_1_n_0 : STD_LOGIC;
  signal SCLK_i_2_n_0 : STD_LOGIC;
  signal SCLK_i_3_n_0 : STD_LOGIC;
  signal SCLK_i_4_n_0 : STD_LOGIC;
  signal SCLK_i_5_n_0 : STD_LOGIC;
  signal SCLK_i_6_n_0 : STD_LOGIC;
  signal bit_idx : STD_LOGIC;
  signal \bit_idx[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[3]_i_1_n_0\ : STD_LOGIC;
  signal \bit_idx[4]_i_2_n_0\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[2]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[3]\ : STD_LOGIC;
  signal \bit_idx_reg_n_0_[4]\ : STD_LOGIC;
  signal busy_inv_i_1_n_0 : STD_LOGIC;
  signal clkcnt : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \clkcnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \clkcnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \clkcnt[6]_i_2_n_0\ : STD_LOGIC;
  signal \clkcnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \clkcnt[7]_i_3_n_0\ : STD_LOGIC;
  signal clkcnt_0 : STD_LOGIC;
  signal \clkcnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \clkcnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \clkcnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \clkcnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \clkcnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \clkcnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \clkcnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \clkcnt_reg_n_0_[7]\ : STD_LOGIC;
  signal shift_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal shift_reg_1 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of DIO_i_3 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of DIO_i_7 : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_1\ : label is "soft_lutpair39";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "IDLE:000,LOAD:001,SHIFT:010,LATCH:011,DONE:100,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "IDLE:000,LOAD:001,SHIFT:010,LATCH:011,DONE:100,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "IDLE:000,LOAD:001,SHIFT:010,LATCH:011,DONE:100,";
  attribute SOFT_HLUTNM of RCLK_i_1 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of SCLK_i_3 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of SCLK_i_5 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of SCLK_i_6 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \bit_idx[0]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \bit_idx[1]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \bit_idx[2]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \bit_idx[3]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of busy_inv_i_1 : label is "soft_lutpair36";
  attribute inverted : string;
  attribute inverted of busy_reg_inv : label is "yes";
  attribute SOFT_HLUTNM of \clkcnt[0]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \clkcnt[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \clkcnt[2]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \clkcnt[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \clkcnt[5]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \clkcnt[6]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \clkcnt[6]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \clkcnt[7]_i_2\ : label is "soft_lutpair34";
begin
  DIO <= \^dio\;
  E(0) <= \^e\(0);
  RCLK <= \^rclk\;
  SCLK <= \^sclk\;
DIO_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000002"
    )
        port map (
      I0 => DIO_i_2_n_0,
      I1 => \clkcnt_reg_n_0_[7]\,
      I2 => \clkcnt_reg_n_0_[4]\,
      I3 => \clkcnt_reg_n_0_[5]\,
      I4 => DIO_i_3_n_0,
      I5 => \^dio\,
      O => DIO_i_1_n_0
    );
DIO_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DIO_i_4_n_0,
      I1 => DIO_i_5_n_0,
      I2 => \bit_idx_reg_n_0_[3]\,
      I3 => shift_reg(4),
      I4 => \bit_idx_reg_n_0_[2]\,
      I5 => DIO_i_6_n_0,
      O => DIO_i_2_n_0
    );
DIO_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[6]\,
      I1 => state(1),
      I2 => \clkcnt_reg_n_0_[0]\,
      I3 => \clkcnt_reg_n_0_[1]\,
      I4 => DIO_i_7_n_0,
      O => DIO_i_3_n_0
    );
DIO_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => shift_reg(15),
      I1 => shift_reg(14),
      I2 => \bit_idx_reg_n_0_[1]\,
      I3 => shift_reg(13),
      I4 => \bit_idx_reg_n_0_[0]\,
      I5 => shift_reg(12),
      O => DIO_i_4_n_0
    );
DIO_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => shift_reg(11),
      I1 => shift_reg(10),
      I2 => \bit_idx_reg_n_0_[1]\,
      I3 => shift_reg(9),
      I4 => \bit_idx_reg_n_0_[0]\,
      I5 => shift_reg(8),
      O => DIO_i_5_n_0
    );
DIO_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => shift_reg(3),
      I1 => shift_reg(2),
      I2 => \bit_idx_reg_n_0_[1]\,
      I3 => shift_reg(1),
      I4 => \bit_idx_reg_n_0_[0]\,
      I5 => shift_reg(0),
      O => DIO_i_6_n_0
    );
DIO_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[3]\,
      I1 => \clkcnt_reg_n_0_[2]\,
      I2 => state(2),
      I3 => state(0),
      O => DIO_i_7_n_0
    );
DIO_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => DIO_i_1_n_0,
      Q => \^dio\
    );
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000000022E2"
    )
        port map (
      I0 => start,
      I1 => state(1),
      I2 => \FSM_sequential_state[0]_i_2_n_0\,
      I3 => \FSM_sequential_state[0]_i_3_n_0\,
      I4 => state(2),
      I5 => state(0),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[0]\,
      I1 => \FSM_sequential_state[0]_i_4_n_0\,
      I2 => \clkcnt_reg_n_0_[6]\,
      I3 => \clkcnt_reg_n_0_[4]\,
      I4 => \clkcnt_reg_n_0_[1]\,
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \bit_idx_reg_n_0_[4]\,
      I1 => \bit_idx_reg_n_0_[3]\,
      I2 => \bit_idx_reg_n_0_[2]\,
      I3 => \bit_idx_reg_n_0_[1]\,
      I4 => \bit_idx_reg_n_0_[0]\,
      O => \FSM_sequential_state[0]_i_3_n_0\
    );
\FSM_sequential_state[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[3]\,
      I1 => \clkcnt_reg_n_0_[2]\,
      I2 => \clkcnt_reg_n_0_[5]\,
      I3 => \clkcnt_reg_n_0_[7]\,
      O => \FSM_sequential_state[0]_i_4_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1)
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => state(2)
    );
RCLK_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FC40"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(0),
      I3 => \^rclk\,
      O => RCLK_i_1_n_0
    );
RCLK_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => RCLK_i_1_n_0,
      Q => \^rclk\
    );
SCLK_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2FFF2F202000202"
    )
        port map (
      I0 => SCLK_i_2_n_0,
      I1 => SCLK_i_3_n_0,
      I2 => state(2),
      I3 => SCLK_i_4_n_0,
      I4 => state(1),
      I5 => \^sclk\,
      O => SCLK_i_1_n_0
    );
SCLK_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => \clkcnt_reg_n_0_[4]\,
      I3 => \clkcnt_reg_n_0_[1]\,
      I4 => \clkcnt_reg_n_0_[2]\,
      I5 => \clkcnt_reg_n_0_[0]\,
      O => SCLK_i_2_n_0
    );
SCLK_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[6]\,
      I1 => \clkcnt_reg_n_0_[7]\,
      I2 => \clkcnt_reg_n_0_[5]\,
      I3 => \clkcnt_reg_n_0_[3]\,
      O => SCLK_i_3_n_0
    );
SCLK_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000010"
    )
        port map (
      I0 => state(0),
      I1 => SCLK_i_5_n_0,
      I2 => \clkcnt_reg_n_0_[4]\,
      I3 => \clkcnt_reg_n_0_[1]\,
      I4 => SCLK_i_6_n_0,
      I5 => \clkcnt_reg_n_0_[6]\,
      O => SCLK_i_4_n_0
    );
SCLK_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[2]\,
      I1 => \clkcnt_reg_n_0_[0]\,
      O => SCLK_i_5_n_0
    );
SCLK_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[3]\,
      I1 => \clkcnt_reg_n_0_[5]\,
      I2 => \clkcnt_reg_n_0_[7]\,
      O => SCLK_i_6_n_0
    );
SCLK_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => SCLK_i_1_n_0,
      Q => \^sclk\
    );
\bit_idx[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \bit_idx_reg_n_0_[0]\,
      I1 => state(1),
      O => \bit_idx[0]_i_1_n_0\
    );
\bit_idx[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D7"
    )
        port map (
      I0 => state(1),
      I1 => \bit_idx_reg_n_0_[0]\,
      I2 => \bit_idx_reg_n_0_[1]\,
      O => \bit_idx[1]_i_1_n_0\
    );
\bit_idx[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A9FF"
    )
        port map (
      I0 => \bit_idx_reg_n_0_[2]\,
      I1 => \bit_idx_reg_n_0_[1]\,
      I2 => \bit_idx_reg_n_0_[0]\,
      I3 => state(1),
      O => \bit_idx[2]_i_1_n_0\
    );
\bit_idx[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA9FFFF"
    )
        port map (
      I0 => \bit_idx_reg_n_0_[3]\,
      I1 => \bit_idx_reg_n_0_[0]\,
      I2 => \bit_idx_reg_n_0_[1]\,
      I3 => \bit_idx_reg_n_0_[2]\,
      I4 => state(1),
      O => \bit_idx[3]_i_1_n_0\
    );
\bit_idx[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11114000"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => \FSM_sequential_state[0]_i_3_n_0\,
      I3 => \FSM_sequential_state[0]_i_2_n_0\,
      I4 => state(0),
      O => bit_idx
    );
\bit_idx[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE000000010000"
    )
        port map (
      I0 => \bit_idx_reg_n_0_[0]\,
      I1 => \bit_idx_reg_n_0_[1]\,
      I2 => \bit_idx_reg_n_0_[2]\,
      I3 => \bit_idx_reg_n_0_[3]\,
      I4 => state(1),
      I5 => \bit_idx_reg_n_0_[4]\,
      O => \bit_idx[4]_i_2_n_0\
    );
\bit_idx_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => bit_idx,
      CLR => rst,
      D => \bit_idx[0]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[0]\
    );
\bit_idx_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => bit_idx,
      CLR => rst,
      D => \bit_idx[1]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[1]\
    );
\bit_idx_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => bit_idx,
      CLR => rst,
      D => \bit_idx[2]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[2]\
    );
\bit_idx_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => bit_idx,
      CLR => rst,
      D => \bit_idx[3]_i_1_n_0\,
      Q => \bit_idx_reg_n_0_[3]\
    );
\bit_idx_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => bit_idx,
      CLR => rst,
      D => \bit_idx[4]_i_2_n_0\,
      Q => \bit_idx_reg_n_0_[4]\
    );
busy_inv_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF05"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      I3 => \^e\(0),
      O => busy_inv_i_1_n_0
    );
busy_reg_inv: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => busy_inv_i_1_n_0,
      PRE => rst,
      Q => \^e\(0)
    );
\clkcnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[0]\,
      I1 => state(1),
      O => clkcnt(0)
    );
\clkcnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[0]\,
      I1 => \clkcnt_reg_n_0_[1]\,
      I2 => state(1),
      O => clkcnt(1)
    );
\clkcnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \clkcnt[6]_i_2_n_0\,
      I1 => \clkcnt_reg_n_0_[0]\,
      I2 => \clkcnt_reg_n_0_[1]\,
      I3 => \clkcnt_reg_n_0_[2]\,
      O => clkcnt(2)
    );
\clkcnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888888"
    )
        port map (
      I0 => state(1),
      I1 => \clkcnt_reg_n_0_[3]\,
      I2 => \clkcnt_reg_n_0_[2]\,
      I3 => \clkcnt_reg_n_0_[0]\,
      I4 => \clkcnt_reg_n_0_[1]\,
      O => \clkcnt[3]_i_1_n_0\
    );
\clkcnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \clkcnt[6]_i_2_n_0\,
      I1 => \clkcnt_reg_n_0_[2]\,
      I2 => \clkcnt_reg_n_0_[0]\,
      I3 => \clkcnt_reg_n_0_[1]\,
      I4 => \clkcnt_reg_n_0_[3]\,
      I5 => \clkcnt_reg_n_0_[4]\,
      O => clkcnt(4)
    );
\clkcnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAA00000000"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[5]\,
      I1 => \clkcnt_reg_n_0_[4]\,
      I2 => \clkcnt_reg_n_0_[2]\,
      I3 => \clkcnt[5]_i_2_n_0\,
      I4 => \clkcnt_reg_n_0_[3]\,
      I5 => \clkcnt[6]_i_2_n_0\,
      O => clkcnt(5)
    );
\clkcnt[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[0]\,
      I1 => \clkcnt_reg_n_0_[1]\,
      O => \clkcnt[5]_i_2_n_0\
    );
\clkcnt[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => \clkcnt[6]_i_2_n_0\,
      I1 => \clkcnt[7]_i_3_n_0\,
      I2 => \clkcnt_reg_n_0_[6]\,
      O => clkcnt(6)
    );
\clkcnt[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => \FSM_sequential_state[0]_i_2_n_0\,
      O => \clkcnt[6]_i_2_n_0\
    );
\clkcnt[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(2),
      O => clkcnt_0
    );
\clkcnt[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8828"
    )
        port map (
      I0 => state(1),
      I1 => \clkcnt_reg_n_0_[7]\,
      I2 => \clkcnt_reg_n_0_[6]\,
      I3 => \clkcnt[7]_i_3_n_0\,
      O => \clkcnt[7]_i_2_n_0\
    );
\clkcnt[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \clkcnt_reg_n_0_[4]\,
      I1 => \clkcnt_reg_n_0_[2]\,
      I2 => \clkcnt_reg_n_0_[0]\,
      I3 => \clkcnt_reg_n_0_[1]\,
      I4 => \clkcnt_reg_n_0_[3]\,
      I5 => \clkcnt_reg_n_0_[5]\,
      O => \clkcnt[7]_i_3_n_0\
    );
\clkcnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => clkcnt(0),
      Q => \clkcnt_reg_n_0_[0]\
    );
\clkcnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => clkcnt(1),
      Q => \clkcnt_reg_n_0_[1]\
    );
\clkcnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => clkcnt(2),
      Q => \clkcnt_reg_n_0_[2]\
    );
\clkcnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => \clkcnt[3]_i_1_n_0\,
      Q => \clkcnt_reg_n_0_[3]\
    );
\clkcnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => clkcnt(4),
      Q => \clkcnt_reg_n_0_[4]\
    );
\clkcnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => clkcnt(5),
      Q => \clkcnt_reg_n_0_[5]\
    );
\clkcnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => clkcnt(6),
      Q => \clkcnt_reg_n_0_[6]\
    );
\clkcnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => clkcnt_0,
      CLR => rst,
      D => \clkcnt[7]_i_2_n_0\,
      Q => \clkcnt_reg_n_0_[7]\
    );
\shift_reg[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state(2),
      I1 => state(0),
      I2 => state(1),
      O => shift_reg_1
    );
\shift_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(0),
      Q => shift_reg(0)
    );
\shift_reg_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(7),
      Q => shift_reg(10)
    );
\shift_reg_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(8),
      Q => shift_reg(11)
    );
\shift_reg_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(9),
      Q => shift_reg(12)
    );
\shift_reg_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(10),
      Q => shift_reg(13)
    );
\shift_reg_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(11),
      Q => shift_reg(14)
    );
\shift_reg_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => '1',
      Q => shift_reg(15)
    );
\shift_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(1),
      Q => shift_reg(1)
    );
\shift_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(2),
      Q => shift_reg(2)
    );
\shift_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(3),
      Q => shift_reg(3)
    );
\shift_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(4),
      Q => shift_reg(4)
    );
\shift_reg_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(5),
      Q => shift_reg(8)
    );
\shift_reg_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => shift_reg_1,
      CLR => rst,
      D => Q(6),
      Q => shift_reg(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0_digit_scan is
  port (
    SCLK : out STD_LOGIC;
    RCLK : out STD_LOGIC;
    DIO : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \scan_cnt_reg[1]_0\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    D : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_calculator_0_0_digit_scan : entity is "digit_scan";
end design_1_top_calculator_0_0_digit_scan;

architecture STRUCTURE of design_1_top_calculator_0_0_digit_scan is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal busy : STD_LOGIC;
  signal data16 : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \scan_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \scan_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal start : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \scan_cnt[0]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \scan_cnt[1]_i_1\ : label is "soft_lutpair43";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
\scan_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \scan_cnt[0]_i_1_n_0\
    );
\scan_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \scan_cnt[1]_i_1_n_0\
    );
\scan_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \scan_cnt[0]_i_1_n_0\,
      Q => \^q\(0)
    );
\scan_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \scan_cnt[1]_i_1_n_0\,
      Q => \^q\(1)
    );
shifter: entity work.design_1_top_calculator_0_0_shift_74hc595
     port map (
      DIO => DIO,
      E(0) => busy,
      Q(11 downto 5) => data16(14 downto 8),
      Q(4 downto 0) => data16(4 downto 0),
      RCLK => RCLK,
      SCLK => SCLK,
      clk => clk,
      rst => rst,
      start => start
    );
u_digit_driver: entity work.design_1_top_calculator_0_0_digit_driver
     port map (
      D(6 downto 0) => D(6 downto 0),
      E(0) => busy,
      Q(1 downto 0) => \^q\(1 downto 0),
      clk => clk,
      \data16_reg[14]_0\(11 downto 5) => data16(14 downto 8),
      \data16_reg[14]_0\(4 downto 0) => data16(4 downto 0),
      rst => rst,
      \scan_cnt_reg[1]\ => \scan_cnt_reg[1]_0\,
      start => start,
      state(1 downto 0) => state(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0_top_calculator is
  port (
    SCLK : out STD_LOGIC;
    RCLK : out STD_LOGIC;
    DIO : out STD_LOGIC;
    enc_sw : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enc_b : in STD_LOGIC;
    enc_a : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_calculator_0_0_top_calculator : entity is "top_calculator";
end design_1_top_calculator_0_0_top_calculator;

architecture STRUCTURE of design_1_top_calculator_0_0_top_calculator is
  signal press_pulse : STD_LOGIC;
  signal rot_down : STD_LOGIC;
  signal rot_up : STD_LOGIC;
  signal scan_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \u_hex7seg/seg\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal u_scan_n_5 : STD_LOGIC;
begin
bdeb: entity work.design_1_top_calculator_0_0_button_debounce
     port map (
      clk => clk,
      enc_sw => enc_sw,
      press_pulse => press_pulse,
      rst => rst
    );
fsm_u: entity work.design_1_top_calculator_0_0_fsm_controller
     port map (
      D(6 downto 0) => \u_hex7seg/seg\(6 downto 0),
      Q(1 downto 0) => scan_cnt(1 downto 0),
      clk => clk,
      \data16_reg[14]\ => u_scan_n_5,
      press_pulse => press_pulse,
      rot_down => rot_down,
      rot_up => rot_up,
      rst => rst,
      state(1 downto 0) => state(1 downto 0)
    );
rdec: entity work.design_1_top_calculator_0_0_rotary_decoder
     port map (
      clk => clk,
      enc_a => enc_a,
      enc_b => enc_b,
      rot_down => rot_down,
      rot_up => rot_up,
      rst => rst
    );
u_scan: entity work.design_1_top_calculator_0_0_digit_scan
     port map (
      D(6 downto 0) => \u_hex7seg/seg\(6 downto 0),
      DIO => DIO,
      Q(1 downto 0) => scan_cnt(1 downto 0),
      RCLK => RCLK,
      SCLK => SCLK,
      clk => clk,
      rst => rst,
      \scan_cnt_reg[1]_0\ => u_scan_n_5,
      state(1 downto 0) => state(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_calculator_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enc_a : in STD_LOGIC;
    enc_b : in STD_LOGIC;
    enc_sw : in STD_LOGIC;
    SCLK : out STD_LOGIC;
    RCLK : out STD_LOGIC;
    DIO : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_top_calculator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_top_calculator_0_0 : entity is "design_1_top_calculator_0_0,top_calculator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_top_calculator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_top_calculator_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_top_calculator_0_0 : entity is "top_calculator,Vivado 2025.1";
end design_1_top_calculator_0_0;

architecture STRUCTURE of design_1_top_calculator_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_MODE of rst : signal is "slave";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.design_1_top_calculator_0_0_top_calculator
     port map (
      DIO => DIO,
      RCLK => RCLK,
      SCLK => SCLK,
      clk => clk,
      enc_a => enc_a,
      enc_b => enc_b,
      enc_sw => enc_sw,
      rst => rst
    );
end STRUCTURE;
