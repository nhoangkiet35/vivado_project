// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Aug 21 20:28:14 2025
// Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/hkngu/Documents/Vivado/C1.2503.E1/Button_LED_EBAZ205/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_button_led_buzzer_0_0/design_1_button_led_buzzer_0_0_sim_netlist.v
// Design      : design_1_button_led_buzzer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_button_led_buzzer_0_0,button_led_buzzer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "button_led_buzzer,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_button_led_buzzer_0_0
   (clk,
    rst,
    btn,
    led,
    buzzer);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input [4:0]btn;
  output [2:0]led;
  output buzzer;

  wire [4:0]btn;
  wire buzzer;
  wire clk;
  wire [2:0]led;
  wire rst;

  design_1_button_led_buzzer_0_0_button_led_buzzer inst
       (.btn(btn[2]),
        .buzzer(buzzer),
        .clk(clk),
        .led(led),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "button_led_buzzer" *) 
module design_1_button_led_buzzer_0_0_button_led_buzzer
   (led,
    buzzer,
    btn,
    clk,
    rst);
  output [2:0]led;
  output buzzer;
  input [0:0]btn;
  input clk;
  input rst;

  wire blink_state;
  wire blink_state_i_1_n_0;
  wire [0:0]btn;
  wire btn_pressed;
  wire buzzer;
  wire clk;
  wire [23:0]counter;
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
  wire counter0_carry__3_n_0;
  wire counter0_carry__3_n_1;
  wire counter0_carry__3_n_2;
  wire counter0_carry__3_n_3;
  wire counter0_carry__4_n_2;
  wire counter0_carry__4_n_3;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire [23:0]counter_0;
  wire [23:1]data0;
  wire [2:0]led;
  wire \led[0]_i_1_n_0 ;
  wire \led[1]_i_1_n_0 ;
  wire \led[2]_i_1_n_0 ;
  wire \led[2]_i_2_n_0 ;
  wire \led[2]_i_3_n_0 ;
  wire \led[2]_i_4_n_0 ;
  wire \led[2]_i_5_n_0 ;
  wire \led[2]_i_6_n_0 ;
  wire \led[2]_i_7_n_0 ;
  wire \led[2]_i_8_n_0 ;
  wire \led[2]_i_9_n_0 ;
  wire rst;
  wire [3:2]NLW_counter0_carry__4_CO_UNCONNECTED;
  wire [3:3]NLW_counter0_carry__4_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h9)) 
    blink_state_i_1
       (.I0(btn),
        .I1(blink_state),
        .O(blink_state_i_1_n_0));
  FDCE blink_state_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(blink_state_i_1_n_0),
        .Q(blink_state));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    buzzer_i_1
       (.I0(btn),
        .O(btn_pressed));
  FDCE buzzer_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(btn_pressed),
        .Q(buzzer));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({counter0_carry__2_n_0,counter0_carry__2_n_1,counter0_carry__2_n_2,counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__3
       (.CI(counter0_carry__2_n_0),
        .CO({counter0_carry__3_n_0,counter0_carry__3_n_1,counter0_carry__3_n_2,counter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(counter[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__4
       (.CI(counter0_carry__3_n_0),
        .CO({NLW_counter0_carry__4_CO_UNCONNECTED[3:2],counter0_carry__4_n_2,counter0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__4_O_UNCONNECTED[3],data0[23:21]}),
        .S({1'b0,counter[23:21]}));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[0]_i_1 
       (.I0(\led[2]_i_3_n_0 ),
        .I1(counter[0]),
        .O(counter_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[10]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[10]),
        .O(counter_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[11]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[11]),
        .O(counter_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[12]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[12]),
        .O(counter_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[13]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[13]),
        .O(counter_0[13]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[14]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[14]),
        .O(counter_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[15]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[15]),
        .O(counter_0[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[16]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[16]),
        .O(counter_0[16]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[17]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[17]),
        .O(counter_0[17]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[18]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[18]),
        .O(counter_0[18]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[19]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[19]),
        .O(counter_0[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[1]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[1]),
        .O(counter_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[20]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[20]),
        .O(counter_0[20]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[21]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[21]),
        .O(counter_0[21]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[22]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[22]),
        .O(counter_0[22]));
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[23]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[23]),
        .O(counter_0[23]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[2]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[2]),
        .O(counter_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[3]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[3]),
        .O(counter_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[4]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[4]),
        .O(counter_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[5]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[5]),
        .O(counter_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[6]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[6]),
        .O(counter_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[7]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[7]),
        .O(counter_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[8]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[8]),
        .O(counter_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \counter[9]_i_1 
       (.I0(counter[0]),
        .I1(\led[2]_i_3_n_0 ),
        .I2(data0[9]),
        .O(counter_0[9]));
  FDCE \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[0]),
        .Q(counter[0]));
  FDCE \counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[10]),
        .Q(counter[10]));
  FDCE \counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[11]),
        .Q(counter[11]));
  FDCE \counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[12]),
        .Q(counter[12]));
  FDCE \counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[13]),
        .Q(counter[13]));
  FDCE \counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[14]),
        .Q(counter[14]));
  FDCE \counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[15]),
        .Q(counter[15]));
  FDCE \counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[16]),
        .Q(counter[16]));
  FDCE \counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[17]),
        .Q(counter[17]));
  FDCE \counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[18]),
        .Q(counter[18]));
  FDCE \counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[19]),
        .Q(counter[19]));
  FDCE \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[1]),
        .Q(counter[1]));
  FDCE \counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[20]),
        .Q(counter[20]));
  FDCE \counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[21]),
        .Q(counter[21]));
  FDCE \counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[22]),
        .Q(counter[22]));
  FDCE \counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[23]),
        .Q(counter[23]));
  FDCE \counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[2]),
        .Q(counter[2]));
  FDCE \counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[3]),
        .Q(counter[3]));
  FDCE \counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[4]),
        .Q(counter[4]));
  FDCE \counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[5]),
        .Q(counter[5]));
  FDCE \counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[6]),
        .Q(counter[6]));
  FDCE \counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[7]),
        .Q(counter[7]));
  FDCE \counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[8]),
        .Q(counter[8]));
  FDCE \counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(counter_0[9]),
        .Q(counter[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFC02)) 
    \led[0]_i_1 
       (.I0(blink_state),
        .I1(counter[0]),
        .I2(\led[2]_i_3_n_0 ),
        .I3(led[0]),
        .O(\led[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFC02)) 
    \led[1]_i_1 
       (.I0(blink_state),
        .I1(counter[0]),
        .I2(\led[2]_i_3_n_0 ),
        .I3(led[1]),
        .O(\led[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFC02)) 
    \led[2]_i_1 
       (.I0(blink_state),
        .I1(counter[0]),
        .I2(\led[2]_i_3_n_0 ),
        .I3(led[2]),
        .O(\led[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \led[2]_i_2 
       (.I0(rst),
        .O(\led[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[2]_i_3 
       (.I0(\led[2]_i_4_n_0 ),
        .I1(\led[2]_i_5_n_0 ),
        .I2(\led[2]_i_6_n_0 ),
        .I3(\led[2]_i_7_n_0 ),
        .I4(\led[2]_i_8_n_0 ),
        .I5(\led[2]_i_9_n_0 ),
        .O(\led[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \led[2]_i_4 
       (.I0(counter[19]),
        .I1(counter[18]),
        .I2(counter[20]),
        .I3(counter[21]),
        .O(\led[2]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \led[2]_i_5 
       (.I0(counter[23]),
        .I1(counter[22]),
        .I2(counter[1]),
        .O(\led[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \led[2]_i_6 
       (.I0(counter[10]),
        .I1(counter[11]),
        .I2(counter[12]),
        .I3(counter[13]),
        .O(\led[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \led[2]_i_7 
       (.I0(counter[15]),
        .I1(counter[14]),
        .I2(counter[17]),
        .I3(counter[16]),
        .O(\led[2]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \led[2]_i_8 
       (.I0(counter[7]),
        .I1(counter[6]),
        .I2(counter[9]),
        .I3(counter[8]),
        .O(\led[2]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led[2]_i_9 
       (.I0(counter[3]),
        .I1(counter[2]),
        .I2(counter[5]),
        .I3(counter[4]),
        .O(\led[2]_i_9_n_0 ));
  FDCE \led_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(\led[0]_i_1_n_0 ),
        .Q(led[0]));
  FDCE \led_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(\led[1]_i_1_n_0 ),
        .Q(led[1]));
  FDCE \led_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\led[2]_i_2_n_0 ),
        .D(\led[2]_i_1_n_0 ),
        .Q(led[2]));
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
