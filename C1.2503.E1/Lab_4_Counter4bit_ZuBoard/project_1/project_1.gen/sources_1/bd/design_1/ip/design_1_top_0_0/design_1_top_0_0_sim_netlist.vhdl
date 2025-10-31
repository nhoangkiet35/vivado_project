-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Sat Aug 23 20:28:22 2025
-- Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/hkngu/Documents/Vivado/C1.2503.E1/Counter4bit_ZuBoard/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_top_0_0/design_1_top_0_0_sim_netlist.vhdl
-- Design      : design_1_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu1cg-sbva484-1-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_clk_divider_1hz is
  port (
    clk : out STD_LOGIC;
    rst_n_t_0 : out STD_LOGIC;
    clk_100MHz_t : in STD_LOGIC;
    rst_n_t : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_clk_divider_1hz : entity is "clk_divider_1hz";
end design_1_top_0_0_clk_divider_1hz;

architecture STRUCTURE of design_1_top_0_0_clk_divider_1hz is
  signal \^clk\ : STD_LOGIC;
  signal clk_1Hz_i_1_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal \counter0_carry__0_n_0\ : STD_LOGIC;
  signal \counter0_carry__0_n_1\ : STD_LOGIC;
  signal \counter0_carry__0_n_2\ : STD_LOGIC;
  signal \counter0_carry__0_n_3\ : STD_LOGIC;
  signal \counter0_carry__0_n_4\ : STD_LOGIC;
  signal \counter0_carry__0_n_5\ : STD_LOGIC;
  signal \counter0_carry__0_n_6\ : STD_LOGIC;
  signal \counter0_carry__0_n_7\ : STD_LOGIC;
  signal \counter0_carry__1_n_0\ : STD_LOGIC;
  signal \counter0_carry__1_n_1\ : STD_LOGIC;
  signal \counter0_carry__1_n_2\ : STD_LOGIC;
  signal \counter0_carry__1_n_3\ : STD_LOGIC;
  signal \counter0_carry__1_n_4\ : STD_LOGIC;
  signal \counter0_carry__1_n_5\ : STD_LOGIC;
  signal \counter0_carry__1_n_6\ : STD_LOGIC;
  signal \counter0_carry__1_n_7\ : STD_LOGIC;
  signal \counter0_carry__2_n_7\ : STD_LOGIC;
  signal counter0_carry_n_0 : STD_LOGIC;
  signal counter0_carry_n_1 : STD_LOGIC;
  signal counter0_carry_n_2 : STD_LOGIC;
  signal counter0_carry_n_3 : STD_LOGIC;
  signal counter0_carry_n_4 : STD_LOGIC;
  signal counter0_carry_n_5 : STD_LOGIC;
  signal counter0_carry_n_6 : STD_LOGIC;
  signal counter0_carry_n_7 : STD_LOGIC;
  signal \counter[26]_i_2_n_0\ : STD_LOGIC;
  signal \counter[26]_i_3_n_0\ : STD_LOGIC;
  signal \counter[26]_i_4_n_0\ : STD_LOGIC;
  signal \counter[26]_i_5_n_0\ : STD_LOGIC;
  signal \counter[26]_i_6_n_0\ : STD_LOGIC;
  signal \counter[26]_i_7_n_0\ : STD_LOGIC;
  signal \counter[26]_i_8_n_0\ : STD_LOGIC;
  signal counter_0 : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 26 downto 1 );
  signal \^rst_n_t_0\ : STD_LOGIC;
  signal \NLW_counter0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_counter0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk_1Hz_i_1 : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__2\ : label is 35;
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[10]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[11]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[12]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[13]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[14]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[15]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[16]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[17]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[18]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \counter[19]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[20]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counter[21]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counter[22]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \counter[23]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \counter[24]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \counter[25]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \counter[26]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[8]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter[9]_i_1\ : label is "soft_lutpair5";
begin
  clk <= \^clk\;
  rst_n_t_0 <= \^rst_n_t_0\;
clk_1Hz_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => \^clk\,
      O => clk_1Hz_i_1_n_0
    );
clk_1Hz_reg: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => clk_1Hz_i_1_n_0,
      Q => \^clk\
    );
\count[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n_t,
      O => \^rst_n_t_0\
    );
counter0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => counter(0),
      CI_TOP => '0',
      CO(7) => counter0_carry_n_0,
      CO(6) => counter0_carry_n_1,
      CO(5) => counter0_carry_n_2,
      CO(4) => counter0_carry_n_3,
      CO(3) => counter0_carry_n_4,
      CO(2) => counter0_carry_n_5,
      CO(1) => counter0_carry_n_6,
      CO(0) => counter0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(8 downto 1),
      S(7 downto 0) => counter(8 downto 1)
    );
\counter0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => counter0_carry_n_0,
      CI_TOP => '0',
      CO(7) => \counter0_carry__0_n_0\,
      CO(6) => \counter0_carry__0_n_1\,
      CO(5) => \counter0_carry__0_n_2\,
      CO(4) => \counter0_carry__0_n_3\,
      CO(3) => \counter0_carry__0_n_4\,
      CO(2) => \counter0_carry__0_n_5\,
      CO(1) => \counter0_carry__0_n_6\,
      CO(0) => \counter0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(16 downto 9),
      S(7 downto 0) => counter(16 downto 9)
    );
\counter0_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \counter0_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \counter0_carry__1_n_0\,
      CO(6) => \counter0_carry__1_n_1\,
      CO(5) => \counter0_carry__1_n_2\,
      CO(4) => \counter0_carry__1_n_3\,
      CO(3) => \counter0_carry__1_n_4\,
      CO(2) => \counter0_carry__1_n_5\,
      CO(1) => \counter0_carry__1_n_6\,
      CO(0) => \counter0_carry__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(24 downto 17),
      S(7 downto 0) => counter(24 downto 17)
    );
\counter0_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \counter0_carry__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_counter0_carry__2_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \counter0_carry__2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 2) => \NLW_counter0_carry__2_O_UNCONNECTED\(7 downto 2),
      O(1 downto 0) => data0(26 downto 25),
      S(7 downto 2) => B"000000",
      S(1 downto 0) => counter(26 downto 25)
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(0),
      O => counter_0(0)
    );
\counter[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(10),
      O => counter_0(10)
    );
\counter[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(11),
      O => counter_0(11)
    );
\counter[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(12),
      O => counter_0(12)
    );
\counter[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(13),
      O => counter_0(13)
    );
\counter[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(14),
      O => counter_0(14)
    );
\counter[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(15),
      O => counter_0(15)
    );
\counter[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(16),
      O => counter_0(16)
    );
\counter[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(17),
      O => counter_0(17)
    );
\counter[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(18),
      O => counter_0(18)
    );
\counter[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(19),
      O => counter_0(19)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(1),
      O => counter_0(1)
    );
\counter[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(20),
      O => counter_0(20)
    );
\counter[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(21),
      O => counter_0(21)
    );
\counter[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(22),
      O => counter_0(22)
    );
\counter[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(23),
      O => counter_0(23)
    );
\counter[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(24),
      O => counter_0(24)
    );
\counter[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(25),
      O => counter_0(25)
    );
\counter[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(26),
      O => counter_0(26)
    );
\counter[26]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFDF"
    )
        port map (
      I0 => counter(25),
      I1 => counter(26),
      I2 => counter(0),
      I3 => \counter[26]_i_5_n_0\,
      I4 => \counter[26]_i_6_n_0\,
      O => \counter[26]_i_2_n_0\
    );
\counter[26]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => counter(7),
      I1 => counter(8),
      I2 => counter(5),
      I3 => counter(6),
      I4 => \counter[26]_i_7_n_0\,
      O => \counter[26]_i_3_n_0\
    );
\counter[26]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
        port map (
      I0 => counter(16),
      I1 => counter(15),
      I2 => counter(13),
      I3 => counter(14),
      I4 => \counter[26]_i_8_n_0\,
      O => \counter[26]_i_4_n_0\
    );
\counter[26]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => counter(22),
      I1 => counter(21),
      I2 => counter(23),
      I3 => counter(24),
      O => \counter[26]_i_5_n_0\
    );
\counter[26]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter(2),
      I1 => counter(1),
      I2 => counter(4),
      I3 => counter(3),
      O => \counter[26]_i_6_n_0\
    );
\counter[26]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => counter(10),
      I1 => counter(9),
      I2 => counter(12),
      I3 => counter(11),
      O => \counter[26]_i_7_n_0\
    );
\counter[26]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => counter(17),
      I1 => counter(18),
      I2 => counter(20),
      I3 => counter(19),
      O => \counter[26]_i_8_n_0\
    );
\counter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(2),
      O => counter_0(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(3),
      O => counter_0(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(4),
      O => counter_0(4)
    );
\counter[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(5),
      O => counter_0(5)
    );
\counter[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(6),
      O => counter_0(6)
    );
\counter[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(7),
      O => counter_0(7)
    );
\counter[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(8),
      O => counter_0(8)
    );
\counter[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => \counter[26]_i_2_n_0\,
      I1 => \counter[26]_i_3_n_0\,
      I2 => \counter[26]_i_4_n_0\,
      I3 => data0(9),
      O => counter_0(9)
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(0),
      Q => counter(0)
    );
\counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(10),
      Q => counter(10)
    );
\counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(11),
      Q => counter(11)
    );
\counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(12),
      Q => counter(12)
    );
\counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(13),
      Q => counter(13)
    );
\counter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(14),
      Q => counter(14)
    );
\counter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(15),
      Q => counter(15)
    );
\counter_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(16),
      Q => counter(16)
    );
\counter_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(17),
      Q => counter(17)
    );
\counter_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(18),
      Q => counter(18)
    );
\counter_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(19),
      Q => counter(19)
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(1),
      Q => counter(1)
    );
\counter_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(20),
      Q => counter(20)
    );
\counter_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(21),
      Q => counter(21)
    );
\counter_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(22),
      Q => counter(22)
    );
\counter_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(23),
      Q => counter(23)
    );
\counter_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(24),
      Q => counter(24)
    );
\counter_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(25),
      Q => counter(25)
    );
\counter_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(26),
      Q => counter(26)
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(2),
      Q => counter(2)
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(3),
      Q => counter(3)
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(4),
      Q => counter(4)
    );
\counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(5),
      Q => counter(5)
    );
\counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(6),
      Q => counter(6)
    );
\counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(7),
      Q => counter(7)
    );
\counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(8),
      Q => counter(8)
    );
\counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk_100MHz_t,
      CE => '1',
      CLR => \^rst_n_t_0\,
      D => counter_0(9),
      Q => counter(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_counter_4bit is
  port (
    counter_t : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    \count_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_counter_4bit : entity is "counter_4bit";
end design_1_top_0_0_counter_4bit;

architecture STRUCTURE of design_1_top_0_0_counter_4bit is
  signal \^counter_t\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair14";
begin
  counter_t(3 downto 0) <= \^counter_t\(3 downto 0);
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^counter_t\(0),
      O => p_0_in(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^counter_t\(0),
      I1 => \^counter_t\(1),
      O => p_0_in(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^counter_t\(0),
      I1 => \^counter_t\(1),
      I2 => \^counter_t\(2),
      O => p_0_in(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^counter_t\(1),
      I1 => \^counter_t\(0),
      I2 => \^counter_t\(2),
      I3 => \^counter_t\(3),
      O => p_0_in(3)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_reg[3]_0\,
      D => p_0_in(0),
      Q => \^counter_t\(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_reg[3]_0\,
      D => p_0_in(1),
      Q => \^counter_t\(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_reg[3]_0\,
      D => p_0_in(2),
      Q => \^counter_t\(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \count_reg[3]_0\,
      D => p_0_in(3),
      Q => \^counter_t\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_top is
  port (
    counter_t : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_100MHz_t : in STD_LOGIC;
    rst_n_t : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_top : entity is "top";
end design_1_top_0_0_top;

architecture STRUCTURE of design_1_top_0_0_top is
  signal IC1_n_1 : STD_LOGIC;
  signal clk : STD_LOGIC;
begin
IC1: entity work.design_1_top_0_0_clk_divider_1hz
     port map (
      clk => clk,
      clk_100MHz_t => clk_100MHz_t,
      rst_n_t => rst_n_t,
      rst_n_t_0 => IC1_n_1
    );
IC2: entity work.design_1_top_0_0_counter_4bit
     port map (
      clk => clk,
      \count_reg[3]_0\ => IC1_n_1,
      counter_t(3 downto 0) => counter_t(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0 is
  port (
    clk_100MHz_t : in STD_LOGIC;
    rst_n_t : in STD_LOGIC;
    counter_t : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_top_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_top_0_0 : entity is "design_1_top_0_0,top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_top_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_top_0_0 : entity is "top,Vivado 2025.1";
end design_1_top_0_0;

architecture STRUCTURE of design_1_top_0_0 is
begin
inst: entity work.design_1_top_0_0_top
     port map (
      clk_100MHz_t => clk_100MHz_t,
      counter_t(3 downto 0) => counter_t(3 downto 0),
      rst_n_t => rst_n_t
    );
end STRUCTURE;
