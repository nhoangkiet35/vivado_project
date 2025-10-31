// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Aug 19 21:05:59 2025
// Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/hkngu/Documents/Vivado/C1.2503.E1/Divided_1Hz/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_clk_divider_1hz_0_0/design_1_clk_divider_1hz_0_0_sim_netlist.v
// Design      : design_1_clk_divider_1hz_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu1cg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_clk_divider_1hz_0_0,clk_divider_1hz,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "clk_divider_1hz,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_clk_divider_1hz_0_0
   (clk_100MHz,
    rst_n,
    clk_1Hz);
  input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  output clk_1Hz;

  wire clk_100MHz;
  wire clk_1Hz;
  wire rst_n;

  design_1_clk_divider_1hz_0_0_clk_divider_1hz inst
       (.clk_100MHz(clk_100MHz),
        .clk_1Hz(clk_1Hz),
        .rst_n(rst_n));
endmodule

(* ORIG_REF_NAME = "clk_divider_1hz" *) 
module design_1_clk_divider_1hz_0_0_clk_divider_1hz
   (clk_1Hz,
    clk_100MHz,
    rst_n);
  output clk_1Hz;
  input clk_100MHz;
  input rst_n;

  wire clk_100MHz;
  wire clk_1Hz;
  wire clk_1Hz_i_1_n_0;
  wire clk_1Hz_i_2_n_0;
  wire clk_1Hz_i_3_n_0;
  wire clk_1Hz_i_4_n_0;
  wire clk_1Hz_i_5_n_0;
  wire clk_1Hz_i_6_n_0;
  wire clk_1Hz_i_7_n_0;
  wire clk_1Hz_i_8_n_0;
  wire clk_1Hz_i_9_n_0;
  wire [26:0]counter;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__0_n_4;
  wire counter0_carry__0_n_5;
  wire counter0_carry__0_n_6;
  wire counter0_carry__0_n_7;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__1_n_4;
  wire counter0_carry__1_n_5;
  wire counter0_carry__1_n_6;
  wire counter0_carry__1_n_7;
  wire counter0_carry__2_n_7;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire counter0_carry_n_4;
  wire counter0_carry_n_5;
  wire counter0_carry_n_6;
  wire counter0_carry_n_7;
  wire [26:0]counter_0;
  wire [26:1]data0;
  wire rst_n;
  wire [7:1]NLW_counter0_carry__2_CO_UNCONNECTED;
  wire [7:2]NLW_counter0_carry__2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    clk_1Hz_i_1
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(clk_1Hz),
        .O(clk_1Hz_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    clk_1Hz_i_2
       (.I0(rst_n),
        .O(clk_1Hz_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFDF)) 
    clk_1Hz_i_3
       (.I0(counter[25]),
        .I1(counter[26]),
        .I2(counter[0]),
        .I3(clk_1Hz_i_6_n_0),
        .I4(clk_1Hz_i_7_n_0),
        .O(clk_1Hz_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFEFFF)) 
    clk_1Hz_i_4
       (.I0(counter[7]),
        .I1(counter[8]),
        .I2(counter[5]),
        .I3(counter[6]),
        .I4(clk_1Hz_i_8_n_0),
        .O(clk_1Hz_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    clk_1Hz_i_5
       (.I0(counter[16]),
        .I1(counter[15]),
        .I2(counter[13]),
        .I3(counter[14]),
        .I4(clk_1Hz_i_9_n_0),
        .O(clk_1Hz_i_5_n_0));
  LUT4 #(
    .INIT(16'hFF7F)) 
    clk_1Hz_i_6
       (.I0(counter[22]),
        .I1(counter[21]),
        .I2(counter[23]),
        .I3(counter[24]),
        .O(clk_1Hz_i_6_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    clk_1Hz_i_7
       (.I0(counter[2]),
        .I1(counter[1]),
        .I2(counter[4]),
        .I3(counter[3]),
        .O(clk_1Hz_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    clk_1Hz_i_8
       (.I0(counter[10]),
        .I1(counter[9]),
        .I2(counter[12]),
        .I3(counter[11]),
        .O(clk_1Hz_i_8_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    clk_1Hz_i_9
       (.I0(counter[17]),
        .I1(counter[18]),
        .I2(counter[20]),
        .I3(counter[19]),
        .O(clk_1Hz_i_9_n_0));
  FDCE clk_1Hz_reg
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(clk_1Hz_i_1_n_0),
        .Q(clk_1Hz));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 counter0_carry
       (.CI(counter[0]),
        .CI_TOP(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3,counter0_carry_n_4,counter0_carry_n_5,counter0_carry_n_6,counter0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:1]),
        .S(counter[8:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3,counter0_carry__0_n_4,counter0_carry__0_n_5,counter0_carry__0_n_6,counter0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:9]),
        .S(counter[16:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3,counter0_carry__1_n_4,counter0_carry__1_n_5,counter0_carry__1_n_6,counter0_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:17]),
        .S(counter[24:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_counter0_carry__2_CO_UNCONNECTED[7:1],counter0_carry__2_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__2_O_UNCONNECTED[7:2],data0[26:25]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,counter[26:25]}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .O(counter_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[10]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[10]),
        .O(counter_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[11]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[11]),
        .O(counter_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[12]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[12]),
        .O(counter_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[13]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[13]),
        .O(counter_0[13]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[14]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[14]),
        .O(counter_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[15]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[15]),
        .O(counter_0[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[16]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[16]),
        .O(counter_0[16]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[17]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[17]),
        .O(counter_0[17]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[18]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[18]),
        .O(counter_0[18]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[19]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[19]),
        .O(counter_0[19]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[1]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[1]),
        .O(counter_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[20]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[20]),
        .O(counter_0[20]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[21]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[21]),
        .O(counter_0[21]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[22]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[22]),
        .O(counter_0[22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[23]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[23]),
        .O(counter_0[23]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[24]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[24]),
        .O(counter_0[24]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[25]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[25]),
        .O(counter_0[25]));
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[26]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[26]),
        .O(counter_0[26]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[2]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[2]),
        .O(counter_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[3]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[3]),
        .O(counter_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[4]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[4]),
        .O(counter_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[5]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[5]),
        .O(counter_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[6]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[6]),
        .O(counter_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[7]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[7]),
        .O(counter_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[8]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[8]),
        .O(counter_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \counter[9]_i_1 
       (.I0(clk_1Hz_i_3_n_0),
        .I1(clk_1Hz_i_4_n_0),
        .I2(clk_1Hz_i_5_n_0),
        .I3(data0[9]),
        .O(counter_0[9]));
  FDCE \counter_reg[0] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[0]),
        .Q(counter[0]));
  FDCE \counter_reg[10] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[10]),
        .Q(counter[10]));
  FDCE \counter_reg[11] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[11]),
        .Q(counter[11]));
  FDCE \counter_reg[12] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[12]),
        .Q(counter[12]));
  FDCE \counter_reg[13] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[13]),
        .Q(counter[13]));
  FDCE \counter_reg[14] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[14]),
        .Q(counter[14]));
  FDCE \counter_reg[15] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[15]),
        .Q(counter[15]));
  FDCE \counter_reg[16] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[16]),
        .Q(counter[16]));
  FDCE \counter_reg[17] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[17]),
        .Q(counter[17]));
  FDCE \counter_reg[18] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[18]),
        .Q(counter[18]));
  FDCE \counter_reg[19] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[19]),
        .Q(counter[19]));
  FDCE \counter_reg[1] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[1]),
        .Q(counter[1]));
  FDCE \counter_reg[20] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[20]),
        .Q(counter[20]));
  FDCE \counter_reg[21] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[21]),
        .Q(counter[21]));
  FDCE \counter_reg[22] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[22]),
        .Q(counter[22]));
  FDCE \counter_reg[23] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[23]),
        .Q(counter[23]));
  FDCE \counter_reg[24] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[24]),
        .Q(counter[24]));
  FDCE \counter_reg[25] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[25]),
        .Q(counter[25]));
  FDCE \counter_reg[26] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[26]),
        .Q(counter[26]));
  FDCE \counter_reg[2] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[2]),
        .Q(counter[2]));
  FDCE \counter_reg[3] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[3]),
        .Q(counter[3]));
  FDCE \counter_reg[4] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[4]),
        .Q(counter[4]));
  FDCE \counter_reg[5] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[5]),
        .Q(counter[5]));
  FDCE \counter_reg[6] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[6]),
        .Q(counter[6]));
  FDCE \counter_reg[7] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[7]),
        .Q(counter[7]));
  FDCE \counter_reg[8] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[8]),
        .Q(counter[8]));
  FDCE \counter_reg[9] 
       (.C(clk_100MHz),
        .CE(1'b1),
        .CLR(clk_1Hz_i_2_n_0),
        .D(counter_0[9]),
        .Q(counter[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
