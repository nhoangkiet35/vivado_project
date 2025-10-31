// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sat Oct 25 20:37:15 2025
// Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/hkngu/Documents/Vivado/Personalization/project_asm_1_rotary_alu_7seg_controller/project_asm_1_rotary_alu_7seg_controller.gen/sources_1/bd/design_1/ip/design_1_top_calculator_0_0_1/design_1_top_calculator_0_0_sim_netlist.v
// Design      : design_1_top_calculator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_top_calculator_0_0,top_calculator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "top_calculator,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_top_calculator_0_0
   (clk,
    rst,
    enc_a,
    enc_b,
    enc_sw,
    SCLK,
    RCLK,
    DIO);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input enc_a;
  input enc_b;
  input enc_sw;
  output SCLK;
  output RCLK;
  output DIO;

  wire DIO;
  wire RCLK;
  wire SCLK;
  wire clk;
  wire enc_a;
  wire enc_b;
  wire enc_sw;
  wire rst;

  design_1_top_calculator_0_0_top_calculator inst
       (.DIO(DIO),
        .RCLK(RCLK),
        .SCLK(SCLK),
        .clk(clk),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .enc_sw(enc_sw),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "button_debounce" *) 
module design_1_top_calculator_0_0_button_debounce
   (press_pulse,
    clk,
    rst,
    enc_sw);
  output press_pulse;
  input clk;
  input rst;
  input enc_sw;

  wire clk;
  wire [20:0]counter;
  wire [20:1]counter0;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__2_n_0;
  wire counter0_carry__2_n_1;
  wire counter0_carry__2_n_2;
  wire counter0_carry__2_n_3;
  wire counter0_carry__3_n_1;
  wire counter0_carry__3_n_2;
  wire counter0_carry__3_n_3;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[10]_i_1_n_0 ;
  wire \counter[11]_i_1_n_0 ;
  wire \counter[12]_i_1_n_0 ;
  wire \counter[13]_i_1_n_0 ;
  wire \counter[14]_i_1_n_0 ;
  wire \counter[15]_i_1_n_0 ;
  wire \counter[16]_i_1_n_0 ;
  wire \counter[17]_i_1_n_0 ;
  wire \counter[18]_i_1_n_0 ;
  wire \counter[19]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[20]_i_1_n_0 ;
  wire \counter[20]_i_2_n_0 ;
  wire \counter[20]_i_3_n_0 ;
  wire \counter[20]_i_4_n_0 ;
  wire \counter[20]_i_5_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[4]_i_1_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[6]_i_1_n_0 ;
  wire \counter[7]_i_1_n_0 ;
  wire \counter[8]_i_1_n_0 ;
  wire \counter[9]_i_1_n_0 ;
  wire enc_sw;
  wire last_stable;
  wire last_stable_i_1_n_0;
  wire press_pulse;
  wire press_pulse_i_1_n_0;
  wire rst;
  wire stable_i_1_n_0;
  wire stable_reg_n_0;
  wire [3:3]NLW_counter0_carry__3_CO_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[4:1]),
        .S(counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[8:5]),
        .S(counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[12:9]),
        .S(counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({counter0_carry__2_n_0,counter0_carry__2_n_1,counter0_carry__2_n_2,counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[16:13]),
        .S(counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__3
       (.CI(counter0_carry__2_n_0),
        .CO({NLW_counter0_carry__3_CO_UNCONNECTED[3],counter0_carry__3_n_1,counter0_carry__3_n_2,counter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[20:17]),
        .S(counter[20:17]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0028)) 
    \counter[0]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter[0]),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[10]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[10]),
        .O(\counter[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[11]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[11]),
        .O(\counter[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[12]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[12]),
        .O(\counter[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[13]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[13]),
        .O(\counter[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[14]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[14]),
        .O(\counter[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[15]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[15]),
        .O(\counter[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[16]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[16]),
        .O(\counter[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[17]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[17]),
        .O(\counter[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[18]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[18]),
        .O(\counter[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[19]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[19]),
        .O(\counter[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[1]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[1]),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[20]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[20]),
        .O(\counter[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8FFF)) 
    \counter[20]_i_2 
       (.I0(\counter[20]_i_3_n_0 ),
        .I1(\counter[20]_i_4_n_0 ),
        .I2(counter[19]),
        .I3(counter[20]),
        .I4(\counter[20]_i_5_n_0 ),
        .O(\counter[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \counter[20]_i_3 
       (.I0(counter[16]),
        .I1(counter[11]),
        .I2(counter[12]),
        .I3(counter[14]),
        .I4(counter[13]),
        .O(\counter[20]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h01FF)) 
    \counter[20]_i_4 
       (.I0(counter[7]),
        .I1(counter[8]),
        .I2(counter[9]),
        .I3(counter[10]),
        .O(\counter[20]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h777F)) 
    \counter[20]_i_5 
       (.I0(counter[18]),
        .I1(counter[17]),
        .I2(counter[15]),
        .I3(counter[16]),
        .O(\counter[20]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[2]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[2]),
        .O(\counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[3]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[3]),
        .O(\counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[4]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[4]),
        .O(\counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[5]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[5]),
        .O(\counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[6]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[6]),
        .O(\counter[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[7]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[7]),
        .O(\counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[8]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[8]),
        .O(\counter[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \counter[9]_i_1 
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(counter0[9]),
        .O(\counter[9]_i_1_n_0 ));
  FDCE \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter[0]));
  FDCE \counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[10]_i_1_n_0 ),
        .Q(counter[10]));
  FDCE \counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[11]_i_1_n_0 ),
        .Q(counter[11]));
  FDCE \counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[12]_i_1_n_0 ),
        .Q(counter[12]));
  FDCE \counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[13]_i_1_n_0 ),
        .Q(counter[13]));
  FDCE \counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[14]_i_1_n_0 ),
        .Q(counter[14]));
  FDCE \counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[15]_i_1_n_0 ),
        .Q(counter[15]));
  FDCE \counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[16]_i_1_n_0 ),
        .Q(counter[16]));
  FDCE \counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[17]_i_1_n_0 ),
        .Q(counter[17]));
  FDCE \counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[18]_i_1_n_0 ),
        .Q(counter[18]));
  FDCE \counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[19]_i_1_n_0 ),
        .Q(counter[19]));
  FDCE \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[1]_i_1_n_0 ),
        .Q(counter[1]));
  FDCE \counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[20]_i_1_n_0 ),
        .Q(counter[20]));
  FDCE \counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[2]_i_1_n_0 ),
        .Q(counter[2]));
  FDCE \counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[3]_i_1_n_0 ),
        .Q(counter[3]));
  FDCE \counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[4]_i_1_n_0 ),
        .Q(counter[4]));
  FDCE \counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[5]_i_1_n_0 ),
        .Q(counter[5]));
  FDCE \counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[6]_i_1_n_0 ),
        .Q(counter[6]));
  FDCE \counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[7]_i_1_n_0 ),
        .Q(counter[7]));
  FDCE \counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[8]_i_1_n_0 ),
        .Q(counter[8]));
  FDCE \counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\counter[9]_i_1_n_0 ),
        .Q(counter[9]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFB10)) 
    last_stable_i_1
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .I3(last_stable),
        .O(last_stable_i_1_n_0));
  FDPE last_stable_reg
       (.C(clk),
        .CE(1'b1),
        .D(last_stable_i_1_n_0),
        .PRE(rst),
        .Q(last_stable));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    press_pulse_i_1
       (.I0(stable_reg_n_0),
        .I1(enc_sw),
        .I2(last_stable),
        .I3(\counter[20]_i_2_n_0 ),
        .O(press_pulse_i_1_n_0));
  FDCE press_pulse_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(press_pulse_i_1_n_0),
        .Q(press_pulse));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hE4)) 
    stable_i_1
       (.I0(\counter[20]_i_2_n_0 ),
        .I1(enc_sw),
        .I2(stable_reg_n_0),
        .O(stable_i_1_n_0));
  FDPE stable_reg
       (.C(clk),
        .CE(1'b1),
        .D(stable_i_1_n_0),
        .PRE(rst),
        .Q(stable_reg_n_0));
endmodule

(* ORIG_REF_NAME = "digit_driver" *) 
module design_1_top_calculator_0_0_digit_driver
   (start,
    \scan_cnt_reg[1] ,
    \data16_reg[14]_0 ,
    E,
    clk,
    rst,
    Q,
    state,
    D);
  output start;
  output \scan_cnt_reg[1] ;
  output [11:0]\data16_reg[14]_0 ;
  input [0:0]E;
  input clk;
  input rst;
  input [1:0]Q;
  input [1:0]state;
  input [6:0]D;

  wire [6:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire \data16[0]_i_1_n_0 ;
  wire \data16[1]_i_1_n_0 ;
  wire \data16[2]_i_1_n_0 ;
  wire \data16[3]_i_1_n_0 ;
  wire [11:0]\data16_reg[14]_0 ;
  wire rst;
  wire \scan_cnt_reg[1] ;
  wire start;
  wire [1:0]state;

  LUT2 #(
    .INIT(4'h1)) 
    \data16[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\data16[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \data16[14]_i_7 
       (.I0(Q[1]),
        .I1(state[0]),
        .I2(Q[0]),
        .I3(state[1]),
        .O(\scan_cnt_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data16[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\data16[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data16[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\data16[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data16[3]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\data16[3]_i_1_n_0 ));
  FDPE \data16_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\data16[0]_i_1_n_0 ),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [0]));
  FDPE \data16_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [7]));
  FDPE \data16_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [8]));
  FDPE \data16_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [9]));
  FDPE \data16_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [10]));
  FDPE \data16_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [11]));
  FDPE \data16_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\data16[1]_i_1_n_0 ),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [1]));
  FDPE \data16_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\data16[2]_i_1_n_0 ),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [2]));
  FDPE \data16_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\data16[3]_i_1_n_0 ),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [3]));
  FDPE \data16_reg[4] 
       (.C(clk),
        .CE(E),
        .D(1'b0),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [4]));
  FDPE \data16_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [5]));
  FDPE \data16_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .PRE(rst),
        .Q(\data16_reg[14]_0 [6]));
  FDCE start_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(E),
        .Q(start));
endmodule

(* ORIG_REF_NAME = "digit_scan" *) 
module design_1_top_calculator_0_0_digit_scan
   (SCLK,
    RCLK,
    DIO,
    Q,
    \scan_cnt_reg[1]_0 ,
    clk,
    rst,
    state,
    D);
  output SCLK;
  output RCLK;
  output DIO;
  output [1:0]Q;
  output \scan_cnt_reg[1]_0 ;
  input clk;
  input rst;
  input [1:0]state;
  input [6:0]D;

  wire [6:0]D;
  wire DIO;
  wire [1:0]Q;
  wire RCLK;
  wire SCLK;
  wire busy;
  wire clk;
  wire [14:0]data16;
  wire rst;
  wire \scan_cnt[0]_i_1_n_0 ;
  wire \scan_cnt[1]_i_1_n_0 ;
  wire \scan_cnt_reg[1]_0 ;
  wire start;
  wire [1:0]state;

  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \scan_cnt[0]_i_1 
       (.I0(Q[0]),
        .O(\scan_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \scan_cnt[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\scan_cnt[1]_i_1_n_0 ));
  FDCE \scan_cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\scan_cnt[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE \scan_cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\scan_cnt[1]_i_1_n_0 ),
        .Q(Q[1]));
  design_1_top_calculator_0_0_shift_74hc595 shifter
       (.DIO(DIO),
        .E(busy),
        .Q({data16[14:8],data16[4:0]}),
        .RCLK(RCLK),
        .SCLK(SCLK),
        .clk(clk),
        .rst(rst),
        .start(start));
  design_1_top_calculator_0_0_digit_driver u_digit_driver
       (.D(D),
        .E(busy),
        .Q(Q),
        .clk(clk),
        .\data16_reg[14]_0 ({data16[14:8],data16[4:0]}),
        .rst(rst),
        .\scan_cnt_reg[1] (\scan_cnt_reg[1]_0 ),
        .start(start),
        .state(state));
endmodule

(* ORIG_REF_NAME = "fsm_controller" *) 
module design_1_top_calculator_0_0_fsm_controller
   (state,
    D,
    rot_up,
    rot_down,
    \data16_reg[14] ,
    Q,
    press_pulse,
    clk,
    rst);
  output [1:0]state;
  output [6:0]D;
  input rot_up;
  input rot_down;
  input \data16_reg[14] ;
  input [1:0]Q;
  input press_pulse;
  input clk;
  input rst;

  wire [3:0]A;
  wire \A[0]_i_1_n_0 ;
  wire \A[1]_i_1_n_0 ;
  wire \A[2]_i_1_n_0 ;
  wire \A[3]_i_1_n_0 ;
  wire \A[3]_i_2_n_0 ;
  wire \A[3]_i_3_n_0 ;
  wire [3:0]B;
  wire \B[0]_i_1_n_0 ;
  wire \B[1]_i_1_n_0 ;
  wire \B[2]_i_1_n_0 ;
  wire \B[3]_i_1_n_0 ;
  wire \B[3]_i_2_n_0 ;
  wire \B[3]_i_3_n_0 ;
  wire [6:0]D;
  wire [1:0]Q;
  wire clk;
  wire \data16[14]_i_10_n_0 ;
  wire \data16[14]_i_11_n_0 ;
  wire \data16[14]_i_12_n_0 ;
  wire \data16[14]_i_15_n_0 ;
  wire \data16[14]_i_16_n_0 ;
  wire \data16[14]_i_17_n_0 ;
  wire \data16[14]_i_18_n_0 ;
  wire \data16[14]_i_19_n_0 ;
  wire \data16[14]_i_20_n_0 ;
  wire \data16[14]_i_21_n_0 ;
  wire \data16[14]_i_22_n_0 ;
  wire \data16[14]_i_23_n_0 ;
  wire \data16[14]_i_24_n_0 ;
  wire \data16[14]_i_25_n_0 ;
  wire \data16[14]_i_26_n_0 ;
  wire \data16[14]_i_28_n_0 ;
  wire \data16[14]_i_29_n_0 ;
  wire \data16[14]_i_30_n_0 ;
  wire \data16[14]_i_31_n_0 ;
  wire \data16[14]_i_32_n_0 ;
  wire \data16[14]_i_35_n_0 ;
  wire \data16[14]_i_36_n_0 ;
  wire \data16[14]_i_37_n_0 ;
  wire \data16[14]_i_38_n_0 ;
  wire \data16[14]_i_39_n_0 ;
  wire \data16[14]_i_6_n_0 ;
  wire \data16[14]_i_9_n_0 ;
  wire \data16_reg[14] ;
  wire [1:0]opcode;
  wire \opcode[0]_i_1_n_0 ;
  wire \opcode[1]_i_1_n_0 ;
  wire [3:2]p_1_in;
  wire press_pulse;
  wire [3:0]result;
  wire rot_down;
  wire rot_up;
  wire rst;
  wire [3:0]sel0;
  wire [1:0]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;

  LUT1 #(
    .INIT(2'h1)) 
    \A[0]_i_1 
       (.I0(A[0]),
        .O(\A[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \A[1]_i_1 
       (.I0(A[0]),
        .I1(rot_up),
        .I2(A[1]),
        .O(\A[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \A[2]_i_1 
       (.I0(A[2]),
        .I1(rot_up),
        .I2(A[1]),
        .I3(A[0]),
        .O(\A[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0007000E00070000)) 
    \A[3]_i_1 
       (.I0(\A[3]_i_3_n_0 ),
        .I1(A[3]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(rot_up),
        .I5(rot_down),
        .O(\A[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \A[3]_i_2 
       (.I0(A[3]),
        .I1(rot_up),
        .I2(A[1]),
        .I3(A[0]),
        .I4(A[2]),
        .O(\A[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \A[3]_i_3 
       (.I0(A[0]),
        .I1(A[1]),
        .I2(A[2]),
        .O(\A[3]_i_3_n_0 ));
  FDCE \A_reg[0] 
       (.C(clk),
        .CE(\A[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\A[0]_i_1_n_0 ),
        .Q(A[0]));
  FDCE \A_reg[1] 
       (.C(clk),
        .CE(\A[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\A[1]_i_1_n_0 ),
        .Q(A[1]));
  FDCE \A_reg[2] 
       (.C(clk),
        .CE(\A[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\A[2]_i_1_n_0 ),
        .Q(A[2]));
  FDCE \A_reg[3] 
       (.C(clk),
        .CE(\A[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\A[3]_i_2_n_0 ),
        .Q(A[3]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \B[0]_i_1 
       (.I0(B[0]),
        .O(\B[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \B[1]_i_1 
       (.I0(rot_up),
        .I1(B[0]),
        .I2(B[1]),
        .O(\B[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \B[2]_i_1 
       (.I0(B[2]),
        .I1(rot_up),
        .I2(B[1]),
        .I3(B[0]),
        .O(\B[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h07000E0007000000)) 
    \B[3]_i_1 
       (.I0(\B[3]_i_3_n_0 ),
        .I1(B[3]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(rot_up),
        .I5(rot_down),
        .O(\B[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \B[3]_i_2 
       (.I0(B[3]),
        .I1(rot_up),
        .I2(B[1]),
        .I3(B[0]),
        .I4(B[2]),
        .O(\B[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \B[3]_i_3 
       (.I0(B[0]),
        .I1(B[1]),
        .I2(B[2]),
        .O(\B[3]_i_3_n_0 ));
  FDCE \B_reg[0] 
       (.C(clk),
        .CE(\B[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\B[0]_i_1_n_0 ),
        .Q(B[0]));
  FDCE \B_reg[1] 
       (.C(clk),
        .CE(\B[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\B[1]_i_1_n_0 ),
        .Q(B[1]));
  FDCE \B_reg[2] 
       (.C(clk),
        .CE(\B[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\B[2]_i_1_n_0 ),
        .Q(B[2]));
  FDCE \B_reg[3] 
       (.C(clk),
        .CE(\B[3]_i_1_n_0 ),
        .CLR(rst),
        .D(\B[3]_i_2_n_0 ),
        .Q(B[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hC0C2)) 
    \data16[10]_i_1 
       (.I0(sel0[1]),
        .I1(sel0[2]),
        .I2(sel0[3]),
        .I3(sel0[0]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h9886)) 
    \data16[11]_i_1 
       (.I0(sel0[0]),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0CCE)) 
    \data16[12]_i_1 
       (.I0(sel0[2]),
        .I1(sel0[0]),
        .I2(sel0[3]),
        .I3(sel0[1]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h280E)) 
    \data16[13]_i_1 
       (.I0(sel0[0]),
        .I1(sel0[1]),
        .I2(sel0[3]),
        .I3(sel0[2]),
        .O(D[5]));
  LUT4 #(
    .INIT(16'h6141)) 
    \data16[14]_i_1 
       (.I0(sel0[1]),
        .I1(sel0[3]),
        .I2(sel0[2]),
        .I3(sel0[0]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h00A800A800A80000)) 
    \data16[14]_i_10 
       (.I0(\data16[14]_i_24_n_0 ),
        .I1(\data16[14]_i_19_n_0 ),
        .I2(\data16[14]_i_20_n_0 ),
        .I3(opcode[1]),
        .I4(result[2]),
        .I5(result[3]),
        .O(\data16[14]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFAAC000000000)) 
    \data16[14]_i_11 
       (.I0(opcode[1]),
        .I1(B[1]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\data16[14]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAFE0000AAAE0000)) 
    \data16[14]_i_12 
       (.I0(Q[0]),
        .I1(A[3]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(Q[1]),
        .I5(B[3]),
        .O(\data16[14]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hEAEAEABAEABABABA)) 
    \data16[14]_i_13 
       (.I0(\data16[14]_i_25_n_0 ),
        .I1(\data16[14]_i_26_n_0 ),
        .I2(\data16[14]_i_23_n_0 ),
        .I3(p_1_in[2]),
        .I4(\data16[14]_i_28_n_0 ),
        .I5(\data16[14]_i_29_n_0 ),
        .O(result[3]));
  LUT5 #(
    .INIT(32'hBEAAEBAA)) 
    \data16[14]_i_14 
       (.I0(\data16[14]_i_30_n_0 ),
        .I1(A[2]),
        .I2(B[2]),
        .I3(\data16[14]_i_23_n_0 ),
        .I4(\data16[14]_i_29_n_0 ),
        .O(result[2]));
  LUT6 #(
    .INIT(64'hBBBABAAABBBBBBBB)) 
    \data16[14]_i_15 
       (.I0(opcode[1]),
        .I1(\data16[14]_i_20_n_0 ),
        .I2(\data16[14]_i_31_n_0 ),
        .I3(\data16[14]_i_32_n_0 ),
        .I4(p_1_in[3]),
        .I5(opcode[0]),
        .O(\data16[14]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFF0000E200000000)) 
    \data16[14]_i_16 
       (.I0(A[2]),
        .I1(state[0]),
        .I2(B[2]),
        .I3(state[1]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\data16[14]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h00000C00000000A0)) 
    \data16[14]_i_17 
       (.I0(A[0]),
        .I1(result[0]),
        .I2(Q[1]),
        .I3(state[0]),
        .I4(Q[0]),
        .I5(state[1]),
        .O(\data16[14]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFF00B88800000000)) 
    \data16[14]_i_18 
       (.I0(opcode[0]),
        .I1(state[1]),
        .I2(B[0]),
        .I3(state[0]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\data16[14]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h001717FF00000000)) 
    \data16[14]_i_19 
       (.I0(\data16[14]_i_29_n_0 ),
        .I1(\data16[14]_i_28_n_0 ),
        .I2(p_1_in[2]),
        .I3(\data16[14]_i_32_n_0 ),
        .I4(p_1_in[3]),
        .I5(opcode[0]),
        .O(\data16[14]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF48)) 
    \data16[14]_i_2 
       (.I0(\data16[14]_i_6_n_0 ),
        .I1(\data16_reg[14] ),
        .I2(result[1]),
        .I3(\data16[14]_i_9_n_0 ),
        .I4(\data16[14]_i_10_n_0 ),
        .I5(\data16[14]_i_11_n_0 ),
        .O(sel0[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h3220)) 
    \data16[14]_i_20 
       (.I0(\data16[14]_i_35_n_0 ),
        .I1(opcode[0]),
        .I2(B[3]),
        .I3(A[3]),
        .O(\data16[14]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hDCCC899989991000)) 
    \data16[14]_i_21 
       (.I0(opcode[0]),
        .I1(opcode[1]),
        .I2(B[0]),
        .I3(A[0]),
        .I4(B[1]),
        .I5(A[1]),
        .O(\data16[14]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hF7F5E7F7E7E7E7E7)) 
    \data16[14]_i_22 
       (.I0(B[0]),
        .I1(\data16[14]_i_36_n_0 ),
        .I2(A[0]),
        .I3(B[1]),
        .I4(A[1]),
        .I5(\data16[14]_i_37_n_0 ),
        .O(\data16[14]_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data16[14]_i_23 
       (.I0(opcode[0]),
        .I1(opcode[1]),
        .O(\data16[14]_i_23_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \data16[14]_i_24 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(Q[0]),
        .O(\data16[14]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hE809E806)) 
    \data16[14]_i_25 
       (.I0(A[3]),
        .I1(B[3]),
        .I2(opcode[0]),
        .I3(opcode[1]),
        .I4(\data16[14]_i_35_n_0 ),
        .O(\data16[14]_i_25_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \data16[14]_i_26 
       (.I0(B[3]),
        .I1(A[3]),
        .O(\data16[14]_i_26_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hCF4DB2F3)) 
    \data16[14]_i_27 
       (.I0(B[2]),
        .I1(A[3]),
        .I2(B[3]),
        .I3(\data16[14]_i_38_n_0 ),
        .I4(A[2]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h71F3CF8E)) 
    \data16[14]_i_28 
       (.I0(A[2]),
        .I1(A[3]),
        .I2(B[3]),
        .I3(\data16[14]_i_38_n_0 ),
        .I4(B[2]),
        .O(\data16[14]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hCC0CFBFFFFCFBABB)) 
    \data16[14]_i_29 
       (.I0(\data16[14]_i_37_n_0 ),
        .I1(A[1]),
        .I2(B[0]),
        .I3(A[0]),
        .I4(\data16[14]_i_36_n_0 ),
        .I5(B[1]),
        .O(\data16[14]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAEAAEAEAAA)) 
    \data16[14]_i_3 
       (.I0(\data16[14]_i_12_n_0 ),
        .I1(\data16_reg[14] ),
        .I2(result[3]),
        .I3(result[2]),
        .I4(\data16[14]_i_15_n_0 ),
        .I5(result[1]),
        .O(sel0[3]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hE809E806)) 
    \data16[14]_i_30 
       (.I0(A[2]),
        .I1(B[2]),
        .I2(opcode[0]),
        .I3(opcode[1]),
        .I4(\data16[14]_i_39_n_0 ),
        .O(\data16[14]_i_30_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFDBF0DB0)) 
    \data16[14]_i_31 
       (.I0(B[3]),
        .I1(A[3]),
        .I2(B[2]),
        .I3(A[2]),
        .I4(\data16[14]_i_29_n_0 ),
        .O(\data16[14]_i_31_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h4FDFFBF2)) 
    \data16[14]_i_32 
       (.I0(A[2]),
        .I1(B[2]),
        .I2(A[3]),
        .I3(\data16[14]_i_38_n_0 ),
        .I4(B[3]),
        .O(\data16[14]_i_32_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hBF2FF4FD)) 
    \data16[14]_i_33 
       (.I0(A[2]),
        .I1(B[2]),
        .I2(B[3]),
        .I3(\data16[14]_i_38_n_0 ),
        .I4(A[3]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hADD0)) 
    \data16[14]_i_34 
       (.I0(opcode[1]),
        .I1(opcode[0]),
        .I2(B[0]),
        .I3(A[0]),
        .O(result[0]));
  LUT6 #(
    .INIT(64'hFFFFF880F8800000)) 
    \data16[14]_i_35 
       (.I0(B[0]),
        .I1(A[0]),
        .I2(A[1]),
        .I3(B[1]),
        .I4(A[2]),
        .I5(B[2]),
        .O(\data16[14]_i_35_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    \data16[14]_i_36 
       (.I0(A[2]),
        .I1(B[2]),
        .I2(B[3]),
        .I3(A[3]),
        .O(\data16[14]_i_36_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    \data16[14]_i_37 
       (.I0(B[3]),
        .I1(A[3]),
        .I2(B[2]),
        .I3(A[2]),
        .O(\data16[14]_i_37_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hBF0B)) 
    \data16[14]_i_38 
       (.I0(A[0]),
        .I1(B[0]),
        .I2(B[1]),
        .I3(A[1]),
        .O(\data16[14]_i_38_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    \data16[14]_i_39 
       (.I0(B[0]),
        .I1(A[0]),
        .I2(A[1]),
        .I3(B[1]),
        .O(\data16[14]_i_39_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAEEEEAAAAAE)) 
    \data16[14]_i_4 
       (.I0(\data16[14]_i_16_n_0 ),
        .I1(\data16_reg[14] ),
        .I2(result[1]),
        .I3(\data16[14]_i_15_n_0 ),
        .I4(result[2]),
        .I5(result[3]),
        .O(sel0[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF8000)) 
    \data16[14]_i_5 
       (.I0(state[0]),
        .I1(Q[0]),
        .I2(state[1]),
        .I3(\data16[14]_i_6_n_0 ),
        .I4(\data16[14]_i_17_n_0 ),
        .I5(\data16[14]_i_18_n_0 ),
        .O(sel0[0]));
  LUT6 #(
    .INIT(64'hFFF1000EF100000E)) 
    \data16[14]_i_6 
       (.I0(\data16[14]_i_19_n_0 ),
        .I1(\data16[14]_i_20_n_0 ),
        .I2(opcode[1]),
        .I3(result[2]),
        .I4(result[3]),
        .I5(result[1]),
        .O(\data16[14]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hBAEAEABA)) 
    \data16[14]_i_8 
       (.I0(\data16[14]_i_21_n_0 ),
        .I1(\data16[14]_i_22_n_0 ),
        .I2(\data16[14]_i_23_n_0 ),
        .I3(B[1]),
        .I4(A[1]),
        .O(result[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \data16[14]_i_9 
       (.I0(A[1]),
        .I1(Q[1]),
        .I2(state[0]),
        .I3(state[1]),
        .O(\data16[14]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0892)) 
    \data16[8]_i_1 
       (.I0(sel0[0]),
        .I1(sel0[3]),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hCAA8)) 
    \data16[9]_i_1 
       (.I0(sel0[2]),
        .I1(sel0[3]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hF3F70C08)) 
    \opcode[0]_i_1 
       (.I0(rot_down),
        .I1(state[1]),
        .I2(state[0]),
        .I3(rot_up),
        .I4(opcode[0]),
        .O(\opcode[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF6FFF7FF09000800)) 
    \opcode[1]_i_1 
       (.I0(opcode[0]),
        .I1(rot_up),
        .I2(state[0]),
        .I3(state[1]),
        .I4(rot_down),
        .I5(opcode[1]),
        .O(\opcode[1]_i_1_n_0 ));
  FDCE \opcode_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\opcode[0]_i_1_n_0 ),
        .Q(opcode[0]));
  FDCE \opcode_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\opcode[1]_i_1_n_0 ),
        .Q(opcode[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \state[0]_i_1 
       (.I0(press_pulse),
        .I1(state[0]),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \state[1]_i_1 
       (.I0(state[0]),
        .I1(press_pulse),
        .I2(state[1]),
        .O(\state[1]_i_1_n_0 ));
  FDCE \state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\state[0]_i_1_n_0 ),
        .Q(state[0]));
  FDCE \state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\state[1]_i_1_n_0 ),
        .Q(state[1]));
endmodule

(* ORIG_REF_NAME = "rotary_decoder" *) 
module design_1_top_calculator_0_0_rotary_decoder
   (rot_up,
    rot_down,
    clk,
    rst,
    enc_b,
    enc_a);
  output rot_up;
  output rot_down;
  input clk;
  input rst;
  input enc_b;
  input enc_a;

  wire clk;
  wire enc_a;
  wire enc_b;
  wire [3:0]p_0_in;
  wire rot_down;
  wire rot_up;
  wire rst;
  wire step_down_i_1_n_0;
  wire step_up_i_1_n_0;
  wire [1:0]sync_a;
  wire [1:0]sync_b;

  FDCE \curr_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(sync_b[1]),
        .Q(p_0_in[0]));
  FDCE \curr_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(sync_a[1]),
        .Q(p_0_in[1]));
  FDCE \prev_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[0]),
        .Q(p_0_in[2]));
  FDCE \prev_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[1]),
        .Q(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h6006)) 
    step_down_i_1
       (.I0(p_0_in[3]),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(step_down_i_1_n_0));
  FDCE step_down_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(step_down_i_1_n_0),
        .Q(rot_down));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h6006)) 
    step_up_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .O(step_up_i_1_n_0));
  FDCE step_up_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(step_up_i_1_n_0),
        .Q(rot_up));
  FDRE \sync_a_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(enc_a),
        .Q(sync_a[0]),
        .R(1'b0));
  FDRE \sync_a_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(sync_a[0]),
        .Q(sync_a[1]),
        .R(1'b0));
  FDRE \sync_b_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(enc_b),
        .Q(sync_b[0]),
        .R(1'b0));
  FDRE \sync_b_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(sync_b[0]),
        .Q(sync_b[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "shift_74hc595" *) 
module design_1_top_calculator_0_0_shift_74hc595
   (SCLK,
    RCLK,
    DIO,
    E,
    clk,
    rst,
    start,
    Q);
  output SCLK;
  output RCLK;
  output DIO;
  output [0:0]E;
  input clk;
  input rst;
  input start;
  input [11:0]Q;

  wire DIO;
  wire DIO_i_1_n_0;
  wire DIO_i_2_n_0;
  wire DIO_i_3_n_0;
  wire DIO_i_4_n_0;
  wire DIO_i_5_n_0;
  wire DIO_i_6_n_0;
  wire DIO_i_7_n_0;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[0]_i_3_n_0 ;
  wire \FSM_sequential_state[0]_i_4_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire [11:0]Q;
  wire RCLK;
  wire RCLK_i_1_n_0;
  wire SCLK;
  wire SCLK_i_1_n_0;
  wire SCLK_i_2_n_0;
  wire SCLK_i_3_n_0;
  wire SCLK_i_4_n_0;
  wire SCLK_i_5_n_0;
  wire SCLK_i_6_n_0;
  wire bit_idx;
  wire \bit_idx[0]_i_1_n_0 ;
  wire \bit_idx[1]_i_1_n_0 ;
  wire \bit_idx[2]_i_1_n_0 ;
  wire \bit_idx[3]_i_1_n_0 ;
  wire \bit_idx[4]_i_2_n_0 ;
  wire \bit_idx_reg_n_0_[0] ;
  wire \bit_idx_reg_n_0_[1] ;
  wire \bit_idx_reg_n_0_[2] ;
  wire \bit_idx_reg_n_0_[3] ;
  wire \bit_idx_reg_n_0_[4] ;
  wire busy_inv_i_1_n_0;
  wire clk;
  wire [6:0]clkcnt;
  wire \clkcnt[3]_i_1_n_0 ;
  wire \clkcnt[5]_i_2_n_0 ;
  wire \clkcnt[6]_i_2_n_0 ;
  wire \clkcnt[7]_i_2_n_0 ;
  wire \clkcnt[7]_i_3_n_0 ;
  wire clkcnt_0;
  wire \clkcnt_reg_n_0_[0] ;
  wire \clkcnt_reg_n_0_[1] ;
  wire \clkcnt_reg_n_0_[2] ;
  wire \clkcnt_reg_n_0_[3] ;
  wire \clkcnt_reg_n_0_[4] ;
  wire \clkcnt_reg_n_0_[5] ;
  wire \clkcnt_reg_n_0_[6] ;
  wire \clkcnt_reg_n_0_[7] ;
  wire rst;
  wire [15:0]shift_reg;
  wire shift_reg_1;
  wire start;
  wire [2:0]state;

  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    DIO_i_1
       (.I0(DIO_i_2_n_0),
        .I1(\clkcnt_reg_n_0_[7] ),
        .I2(\clkcnt_reg_n_0_[4] ),
        .I3(\clkcnt_reg_n_0_[5] ),
        .I4(DIO_i_3_n_0),
        .I5(DIO),
        .O(DIO_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    DIO_i_2
       (.I0(DIO_i_4_n_0),
        .I1(DIO_i_5_n_0),
        .I2(\bit_idx_reg_n_0_[3] ),
        .I3(shift_reg[4]),
        .I4(\bit_idx_reg_n_0_[2] ),
        .I5(DIO_i_6_n_0),
        .O(DIO_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    DIO_i_3
       (.I0(\clkcnt_reg_n_0_[6] ),
        .I1(state[1]),
        .I2(\clkcnt_reg_n_0_[0] ),
        .I3(\clkcnt_reg_n_0_[1] ),
        .I4(DIO_i_7_n_0),
        .O(DIO_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    DIO_i_4
       (.I0(shift_reg[15]),
        .I1(shift_reg[14]),
        .I2(\bit_idx_reg_n_0_[1] ),
        .I3(shift_reg[13]),
        .I4(\bit_idx_reg_n_0_[0] ),
        .I5(shift_reg[12]),
        .O(DIO_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    DIO_i_5
       (.I0(shift_reg[11]),
        .I1(shift_reg[10]),
        .I2(\bit_idx_reg_n_0_[1] ),
        .I3(shift_reg[9]),
        .I4(\bit_idx_reg_n_0_[0] ),
        .I5(shift_reg[8]),
        .O(DIO_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    DIO_i_6
       (.I0(shift_reg[3]),
        .I1(shift_reg[2]),
        .I2(\bit_idx_reg_n_0_[1] ),
        .I3(shift_reg[1]),
        .I4(\bit_idx_reg_n_0_[0] ),
        .I5(shift_reg[0]),
        .O(DIO_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    DIO_i_7
       (.I0(\clkcnt_reg_n_0_[3] ),
        .I1(\clkcnt_reg_n_0_[2] ),
        .I2(state[2]),
        .I3(state[0]),
        .O(DIO_i_7_n_0));
  FDCE DIO_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(DIO_i_1_n_0),
        .Q(DIO));
  LUT6 #(
    .INIT(64'hFFFF0000000022E2)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(start),
        .I1(state[1]),
        .I2(\FSM_sequential_state[0]_i_2_n_0 ),
        .I3(\FSM_sequential_state[0]_i_3_n_0 ),
        .I4(state[2]),
        .I5(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(\clkcnt_reg_n_0_[0] ),
        .I1(\FSM_sequential_state[0]_i_4_n_0 ),
        .I2(\clkcnt_reg_n_0_[6] ),
        .I3(\clkcnt_reg_n_0_[4] ),
        .I4(\clkcnt_reg_n_0_[1] ),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(\bit_idx_reg_n_0_[4] ),
        .I1(\bit_idx_reg_n_0_[3] ),
        .I2(\bit_idx_reg_n_0_[2] ),
        .I3(\bit_idx_reg_n_0_[1] ),
        .I4(\bit_idx_reg_n_0_[0] ),
        .O(\FSM_sequential_state[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \FSM_sequential_state[0]_i_4 
       (.I0(\clkcnt_reg_n_0_[3] ),
        .I1(\clkcnt_reg_n_0_[2] ),
        .I2(\clkcnt_reg_n_0_[5] ),
        .I3(\clkcnt_reg_n_0_[7] ),
        .O(\FSM_sequential_state[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:000,LOAD:001,SHIFT:010,LATCH:011,DONE:100," *) 
  FDCE \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "IDLE:000,LOAD:001,SHIFT:010,LATCH:011,DONE:100," *) 
  FDCE \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]));
  (* FSM_ENCODED_STATES = "IDLE:000,LOAD:001,SHIFT:010,LATCH:011,DONE:100," *) 
  FDCE \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFC40)) 
    RCLK_i_1
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(RCLK),
        .O(RCLK_i_1_n_0));
  FDCE RCLK_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(RCLK_i_1_n_0),
        .Q(RCLK));
  LUT6 #(
    .INIT(64'hF2FFF2F202000202)) 
    SCLK_i_1
       (.I0(SCLK_i_2_n_0),
        .I1(SCLK_i_3_n_0),
        .I2(state[2]),
        .I3(SCLK_i_4_n_0),
        .I4(state[1]),
        .I5(SCLK),
        .O(SCLK_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    SCLK_i_2
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\clkcnt_reg_n_0_[4] ),
        .I3(\clkcnt_reg_n_0_[1] ),
        .I4(\clkcnt_reg_n_0_[2] ),
        .I5(\clkcnt_reg_n_0_[0] ),
        .O(SCLK_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    SCLK_i_3
       (.I0(\clkcnt_reg_n_0_[6] ),
        .I1(\clkcnt_reg_n_0_[7] ),
        .I2(\clkcnt_reg_n_0_[5] ),
        .I3(\clkcnt_reg_n_0_[3] ),
        .O(SCLK_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000010000000010)) 
    SCLK_i_4
       (.I0(state[0]),
        .I1(SCLK_i_5_n_0),
        .I2(\clkcnt_reg_n_0_[4] ),
        .I3(\clkcnt_reg_n_0_[1] ),
        .I4(SCLK_i_6_n_0),
        .I5(\clkcnt_reg_n_0_[6] ),
        .O(SCLK_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hB)) 
    SCLK_i_5
       (.I0(\clkcnt_reg_n_0_[2] ),
        .I1(\clkcnt_reg_n_0_[0] ),
        .O(SCLK_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    SCLK_i_6
       (.I0(\clkcnt_reg_n_0_[3] ),
        .I1(\clkcnt_reg_n_0_[5] ),
        .I2(\clkcnt_reg_n_0_[7] ),
        .O(SCLK_i_6_n_0));
  FDCE SCLK_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(SCLK_i_1_n_0),
        .Q(SCLK));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \bit_idx[0]_i_1 
       (.I0(\bit_idx_reg_n_0_[0] ),
        .I1(state[1]),
        .O(\bit_idx[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \bit_idx[1]_i_1 
       (.I0(state[1]),
        .I1(\bit_idx_reg_n_0_[0] ),
        .I2(\bit_idx_reg_n_0_[1] ),
        .O(\bit_idx[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hA9FF)) 
    \bit_idx[2]_i_1 
       (.I0(\bit_idx_reg_n_0_[2] ),
        .I1(\bit_idx_reg_n_0_[1] ),
        .I2(\bit_idx_reg_n_0_[0] ),
        .I3(state[1]),
        .O(\bit_idx[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'hAAA9FFFF)) 
    \bit_idx[3]_i_1 
       (.I0(\bit_idx_reg_n_0_[3] ),
        .I1(\bit_idx_reg_n_0_[0] ),
        .I2(\bit_idx_reg_n_0_[1] ),
        .I3(\bit_idx_reg_n_0_[2] ),
        .I4(state[1]),
        .O(\bit_idx[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h11114000)) 
    \bit_idx[4]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(\FSM_sequential_state[0]_i_3_n_0 ),
        .I3(\FSM_sequential_state[0]_i_2_n_0 ),
        .I4(state[0]),
        .O(bit_idx));
  LUT6 #(
    .INIT(64'hFFFE000000010000)) 
    \bit_idx[4]_i_2 
       (.I0(\bit_idx_reg_n_0_[0] ),
        .I1(\bit_idx_reg_n_0_[1] ),
        .I2(\bit_idx_reg_n_0_[2] ),
        .I3(\bit_idx_reg_n_0_[3] ),
        .I4(state[1]),
        .I5(\bit_idx_reg_n_0_[4] ),
        .O(\bit_idx[4]_i_2_n_0 ));
  FDCE \bit_idx_reg[0] 
       (.C(clk),
        .CE(bit_idx),
        .CLR(rst),
        .D(\bit_idx[0]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[0] ));
  FDCE \bit_idx_reg[1] 
       (.C(clk),
        .CE(bit_idx),
        .CLR(rst),
        .D(\bit_idx[1]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[1] ));
  FDCE \bit_idx_reg[2] 
       (.C(clk),
        .CE(bit_idx),
        .CLR(rst),
        .D(\bit_idx[2]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[2] ));
  FDCE \bit_idx_reg[3] 
       (.C(clk),
        .CE(bit_idx),
        .CLR(rst),
        .D(\bit_idx[3]_i_1_n_0 ),
        .Q(\bit_idx_reg_n_0_[3] ));
  FDCE \bit_idx_reg[4] 
       (.C(clk),
        .CE(bit_idx),
        .CLR(rst),
        .D(\bit_idx[4]_i_2_n_0 ),
        .Q(\bit_idx_reg_n_0_[4] ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hEF05)) 
    busy_inv_i_1
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(E),
        .O(busy_inv_i_1_n_0));
  (* inverted = "yes" *) 
  FDPE busy_reg_inv
       (.C(clk),
        .CE(1'b1),
        .D(busy_inv_i_1_n_0),
        .PRE(rst),
        .Q(E));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \clkcnt[0]_i_1 
       (.I0(\clkcnt_reg_n_0_[0] ),
        .I1(state[1]),
        .O(clkcnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \clkcnt[1]_i_1 
       (.I0(\clkcnt_reg_n_0_[0] ),
        .I1(\clkcnt_reg_n_0_[1] ),
        .I2(state[1]),
        .O(clkcnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \clkcnt[2]_i_1 
       (.I0(\clkcnt[6]_i_2_n_0 ),
        .I1(\clkcnt_reg_n_0_[0] ),
        .I2(\clkcnt_reg_n_0_[1] ),
        .I3(\clkcnt_reg_n_0_[2] ),
        .O(clkcnt[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \clkcnt[3]_i_1 
       (.I0(state[1]),
        .I1(\clkcnt_reg_n_0_[3] ),
        .I2(\clkcnt_reg_n_0_[2] ),
        .I3(\clkcnt_reg_n_0_[0] ),
        .I4(\clkcnt_reg_n_0_[1] ),
        .O(\clkcnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \clkcnt[4]_i_1 
       (.I0(\clkcnt[6]_i_2_n_0 ),
        .I1(\clkcnt_reg_n_0_[2] ),
        .I2(\clkcnt_reg_n_0_[0] ),
        .I3(\clkcnt_reg_n_0_[1] ),
        .I4(\clkcnt_reg_n_0_[3] ),
        .I5(\clkcnt_reg_n_0_[4] ),
        .O(clkcnt[4]));
  LUT6 #(
    .INIT(64'hAA6AAAAA00000000)) 
    \clkcnt[5]_i_1 
       (.I0(\clkcnt_reg_n_0_[5] ),
        .I1(\clkcnt_reg_n_0_[4] ),
        .I2(\clkcnt_reg_n_0_[2] ),
        .I3(\clkcnt[5]_i_2_n_0 ),
        .I4(\clkcnt_reg_n_0_[3] ),
        .I5(\clkcnt[6]_i_2_n_0 ),
        .O(clkcnt[5]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \clkcnt[5]_i_2 
       (.I0(\clkcnt_reg_n_0_[0] ),
        .I1(\clkcnt_reg_n_0_[1] ),
        .O(\clkcnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \clkcnt[6]_i_1 
       (.I0(\clkcnt[6]_i_2_n_0 ),
        .I1(\clkcnt[7]_i_3_n_0 ),
        .I2(\clkcnt_reg_n_0_[6] ),
        .O(clkcnt[6]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \clkcnt[6]_i_2 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\FSM_sequential_state[0]_i_2_n_0 ),
        .O(\clkcnt[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h06)) 
    \clkcnt[7]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .O(clkcnt_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h8828)) 
    \clkcnt[7]_i_2 
       (.I0(state[1]),
        .I1(\clkcnt_reg_n_0_[7] ),
        .I2(\clkcnt_reg_n_0_[6] ),
        .I3(\clkcnt[7]_i_3_n_0 ),
        .O(\clkcnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \clkcnt[7]_i_3 
       (.I0(\clkcnt_reg_n_0_[4] ),
        .I1(\clkcnt_reg_n_0_[2] ),
        .I2(\clkcnt_reg_n_0_[0] ),
        .I3(\clkcnt_reg_n_0_[1] ),
        .I4(\clkcnt_reg_n_0_[3] ),
        .I5(\clkcnt_reg_n_0_[5] ),
        .O(\clkcnt[7]_i_3_n_0 ));
  FDCE \clkcnt_reg[0] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(clkcnt[0]),
        .Q(\clkcnt_reg_n_0_[0] ));
  FDCE \clkcnt_reg[1] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(clkcnt[1]),
        .Q(\clkcnt_reg_n_0_[1] ));
  FDCE \clkcnt_reg[2] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(clkcnt[2]),
        .Q(\clkcnt_reg_n_0_[2] ));
  FDCE \clkcnt_reg[3] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(\clkcnt[3]_i_1_n_0 ),
        .Q(\clkcnt_reg_n_0_[3] ));
  FDCE \clkcnt_reg[4] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(clkcnt[4]),
        .Q(\clkcnt_reg_n_0_[4] ));
  FDCE \clkcnt_reg[5] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(clkcnt[5]),
        .Q(\clkcnt_reg_n_0_[5] ));
  FDCE \clkcnt_reg[6] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(clkcnt[6]),
        .Q(\clkcnt_reg_n_0_[6] ));
  FDCE \clkcnt_reg[7] 
       (.C(clk),
        .CE(clkcnt_0),
        .CLR(rst),
        .D(\clkcnt[7]_i_2_n_0 ),
        .Q(\clkcnt_reg_n_0_[7] ));
  LUT3 #(
    .INIT(8'h04)) 
    \shift_reg[15]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(shift_reg_1));
  FDCE \shift_reg_reg[0] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[0]),
        .Q(shift_reg[0]));
  FDCE \shift_reg_reg[10] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[7]),
        .Q(shift_reg[10]));
  FDCE \shift_reg_reg[11] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[8]),
        .Q(shift_reg[11]));
  FDCE \shift_reg_reg[12] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[9]),
        .Q(shift_reg[12]));
  FDCE \shift_reg_reg[13] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[10]),
        .Q(shift_reg[13]));
  FDCE \shift_reg_reg[14] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[11]),
        .Q(shift_reg[14]));
  FDCE \shift_reg_reg[15] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(1'b1),
        .Q(shift_reg[15]));
  FDCE \shift_reg_reg[1] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[1]),
        .Q(shift_reg[1]));
  FDCE \shift_reg_reg[2] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[2]),
        .Q(shift_reg[2]));
  FDCE \shift_reg_reg[3] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[3]),
        .Q(shift_reg[3]));
  FDCE \shift_reg_reg[4] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[4]),
        .Q(shift_reg[4]));
  FDCE \shift_reg_reg[8] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[5]),
        .Q(shift_reg[8]));
  FDCE \shift_reg_reg[9] 
       (.C(clk),
        .CE(shift_reg_1),
        .CLR(rst),
        .D(Q[6]),
        .Q(shift_reg[9]));
endmodule

(* ORIG_REF_NAME = "top_calculator" *) 
module design_1_top_calculator_0_0_top_calculator
   (SCLK,
    RCLK,
    DIO,
    enc_sw,
    clk,
    rst,
    enc_b,
    enc_a);
  output SCLK;
  output RCLK;
  output DIO;
  input enc_sw;
  input clk;
  input rst;
  input enc_b;
  input enc_a;

  wire DIO;
  wire RCLK;
  wire SCLK;
  wire clk;
  wire enc_a;
  wire enc_b;
  wire enc_sw;
  wire press_pulse;
  wire rot_down;
  wire rot_up;
  wire rst;
  wire [1:0]scan_cnt;
  wire [1:0]state;
  wire [6:0]\u_hex7seg/seg ;
  wire u_scan_n_5;

  design_1_top_calculator_0_0_button_debounce bdeb
       (.clk(clk),
        .enc_sw(enc_sw),
        .press_pulse(press_pulse),
        .rst(rst));
  design_1_top_calculator_0_0_fsm_controller fsm_u
       (.D(\u_hex7seg/seg ),
        .Q(scan_cnt),
        .clk(clk),
        .\data16_reg[14] (u_scan_n_5),
        .press_pulse(press_pulse),
        .rot_down(rot_down),
        .rot_up(rot_up),
        .rst(rst),
        .state(state));
  design_1_top_calculator_0_0_rotary_decoder rdec
       (.clk(clk),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .rot_down(rot_down),
        .rot_up(rot_up),
        .rst(rst));
  design_1_top_calculator_0_0_digit_scan u_scan
       (.D(\u_hex7seg/seg ),
        .DIO(DIO),
        .Q(scan_cnt),
        .RCLK(RCLK),
        .SCLK(SCLK),
        .clk(clk),
        .rst(rst),
        .\scan_cnt_reg[1]_0 (u_scan_n_5),
        .state(state));
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
