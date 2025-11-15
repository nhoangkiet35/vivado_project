// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sat Nov  1 21:03:12 2025
// Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/hkngu/Documents/Vivado/Personalization/project_5_fpga_lcd1602_4bit_controller/project_5_fpga_lcd1602_4bit_controller.gen/sources_1/bd/design_1/ip/design_1_top_0_0/design_1_top_0_0_sim_netlist.v
// Design      : design_1_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_top_0_0,top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "top,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_top_0_0
   (clk,
    lcd_rs,
    lcd_rw,
    lcd_e,
    vo_pwm,
    sf_d);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  output lcd_rs;
  output lcd_rw;
  output lcd_e;
  output vo_pwm;
  output [11:8]sf_d;

  wire \<const0> ;
  wire clk;
  wire lcd_e;
  wire lcd_rs;
  wire [11:8]sf_d;
  wire vo_pwm;

  assign lcd_rw = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_top_0_0_top inst
       (.clk(clk),
        .lcd_e(lcd_e),
        .lcd_rs(lcd_rs),
        .sf_d(sf_d),
        .vo_pwm(vo_pwm));
endmodule

(* ORIG_REF_NAME = "lcd" *) 
module design_1_top_0_0_lcd
   (lcd_rs,
    lcd_e,
    sf_d,
    clk);
  output lcd_rs;
  output lcd_e;
  output [11:8]sf_d;
  input clk;

  wire [3:0]char_mem_addr;
  wire clk;
  wire [24:1]count0;
  wire count0_carry__0_n_0;
  wire count0_carry__0_n_1;
  wire count0_carry__0_n_2;
  wire count0_carry__0_n_3;
  wire count0_carry__1_n_0;
  wire count0_carry__1_n_1;
  wire count0_carry__1_n_2;
  wire count0_carry__1_n_3;
  wire count0_carry__2_n_0;
  wire count0_carry__2_n_1;
  wire count0_carry__2_n_2;
  wire count0_carry__2_n_3;
  wire count0_carry__3_n_0;
  wire count0_carry__3_n_1;
  wire count0_carry__3_n_2;
  wire count0_carry__3_n_3;
  wire count0_carry__4_n_1;
  wire count0_carry__4_n_2;
  wire count0_carry__4_n_3;
  wire count0_carry_n_0;
  wire count0_carry_n_1;
  wire count0_carry_n_2;
  wire count0_carry_n_3;
  wire \count[0]_i_1_n_0 ;
  wire \count[10]_i_1_n_0 ;
  wire \count[11]_i_1_n_0 ;
  wire \count[12]_i_1_n_0 ;
  wire \count[13]_i_1_n_0 ;
  wire \count[14]_i_1_n_0 ;
  wire \count[15]_i_1_n_0 ;
  wire \count[16]_i_1_n_0 ;
  wire \count[17]_i_1_n_0 ;
  wire \count[18]_i_1_n_0 ;
  wire \count[19]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[20]_i_1_n_0 ;
  wire \count[21]_i_1_n_0 ;
  wire \count[22]_i_1_n_0 ;
  wire \count[23]_i_1_n_0 ;
  wire \count[24]_i_1_n_0 ;
  wire \count[24]_i_2_n_0 ;
  wire \count[24]_i_3_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count[5]_i_1_n_0 ;
  wire \count[6]_i_1_n_0 ;
  wire \count[7]_i_1_n_0 ;
  wire \count[8]_i_1_n_0 ;
  wire \count[9]_i_1_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[10] ;
  wire \count_reg_n_0_[11] ;
  wire \count_reg_n_0_[12] ;
  wire \count_reg_n_0_[13] ;
  wire \count_reg_n_0_[14] ;
  wire \count_reg_n_0_[15] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[24] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \count_reg_n_0_[4] ;
  wire \count_reg_n_0_[5] ;
  wire \count_reg_n_0_[6] ;
  wire \count_reg_n_0_[7] ;
  wire \count_reg_n_0_[8] ;
  wire \count_reg_n_0_[9] ;
  wire init;
  wire init_i_1_n_0;
  wire init_i_2_n_0;
  wire lcd_e;
  wire lcd_e_i_1_n_0;
  wire lcd_rs;
  wire lcd_state0;
  wire \lcd_state[0]_i_1_n_0 ;
  wire \lcd_state[0]_i_2_n_0 ;
  wire \lcd_state[1]_i_1_n_0 ;
  wire \lcd_state[1]_i_3_n_0 ;
  wire \lcd_state[1]_i_4_n_0 ;
  wire \lcd_state[2]_i_1_n_0 ;
  wire \lcd_state[2]_i_3_n_0 ;
  wire \lcd_state[2]_i_4_n_0 ;
  wire \lcd_state[3]_i_1_n_0 ;
  wire \lcd_state[3]_i_2_n_0 ;
  wire \lcd_state[3]_i_3_n_0 ;
  wire \lcd_state[5]_i_2_n_0 ;
  wire \lcd_state[5]_i_3_n_0 ;
  wire \lcd_state_reg[1]_i_2_n_0 ;
  wire \lcd_state_reg[2]_i_2_n_0 ;
  wire \lcd_state_reg_n_0_[0] ;
  wire \lcd_state_reg_n_0_[1] ;
  wire \lcd_state_reg_n_0_[2] ;
  wire \lcd_state_reg_n_0_[3] ;
  wire [3:2]p_0_in;
  wire p_0_in0;
  wire [1:1]p_0_in_0;
  wire p_0_in__0;
  wire row;
  wire row_i_1_n_0;
  wire row_i_2_n_0;
  wire [11:8]sf_d;
  wire [3:3]NLW_count0_carry__4_CO_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 count0_carry
       (.CI(1'b0),
        .CO({count0_carry_n_0,count0_carry_n_1,count0_carry_n_2,count0_carry_n_3}),
        .CYINIT(\count_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(count0[4:1]),
        .S({\count_reg_n_0_[4] ,\count_reg_n_0_[3] ,\count_reg_n_0_[2] ,\count_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 count0_carry__0
       (.CI(count0_carry_n_0),
        .CO({count0_carry__0_n_0,count0_carry__0_n_1,count0_carry__0_n_2,count0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(count0[8:5]),
        .S({\count_reg_n_0_[8] ,\count_reg_n_0_[7] ,\count_reg_n_0_[6] ,\count_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 count0_carry__1
       (.CI(count0_carry__0_n_0),
        .CO({count0_carry__1_n_0,count0_carry__1_n_1,count0_carry__1_n_2,count0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(count0[12:9]),
        .S({\count_reg_n_0_[12] ,\count_reg_n_0_[11] ,\count_reg_n_0_[10] ,\count_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 count0_carry__2
       (.CI(count0_carry__1_n_0),
        .CO({count0_carry__2_n_0,count0_carry__2_n_1,count0_carry__2_n_2,count0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(count0[16:13]),
        .S({char_mem_addr[0],\count_reg_n_0_[15] ,\count_reg_n_0_[14] ,\count_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 count0_carry__3
       (.CI(count0_carry__2_n_0),
        .CO({count0_carry__3_n_0,count0_carry__3_n_1,count0_carry__3_n_2,count0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(count0[20:17]),
        .S({p_0_in_0,char_mem_addr[3:1]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 count0_carry__4
       (.CI(count0_carry__3_n_0),
        .CO({NLW_count0_carry__4_CO_UNCONNECTED[3],count0_carry__4_n_1,count0_carry__4_n_2,count0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(count0[24:21]),
        .S({\count_reg_n_0_[24] ,p_0_in0,p_0_in}));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \count[0]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(\count_reg_n_0_[0] ),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[10]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[10]),
        .O(\count[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[11]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[11]),
        .O(\count[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[12]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[12]),
        .O(\count[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[13]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[13]),
        .O(\count[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[14]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[14]),
        .O(\count[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[15]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[15]),
        .O(\count[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[16]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[16]),
        .O(\count[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[17]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[17]),
        .O(\count[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[18]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[18]),
        .O(\count[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[19]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[19]),
        .O(\count[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[1]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[1]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[20]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[20]),
        .O(\count[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[21]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[21]),
        .O(\count[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[22]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[22]),
        .O(\count[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[23]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[23]),
        .O(\count[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB800)) 
    \count[24]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[24]),
        .O(\count[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFFFF)) 
    \count[24]_i_2 
       (.I0(p_0_in0),
        .I1(p_0_in[2]),
        .I2(char_mem_addr[3]),
        .I3(p_0_in_0),
        .I4(p_0_in[3]),
        .I5(\count_reg_n_0_[24] ),
        .O(\count[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFDFF)) 
    \count[24]_i_3 
       (.I0(char_mem_addr[0]),
        .I1(char_mem_addr[2]),
        .I2(char_mem_addr[3]),
        .I3(p_0_in_0),
        .I4(char_mem_addr[1]),
        .I5(\count_reg_n_0_[15] ),
        .O(\count[24]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[2]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[2]),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[3]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[3]),
        .O(\count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[4]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[4]),
        .O(\count[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[5]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[5]),
        .O(\count[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[6]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[6]),
        .O(\count[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[7]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[7]),
        .O(\count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[8]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[8]),
        .O(\count[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hB800)) 
    \count[9]_i_1 
       (.I0(\count[24]_i_2_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .I3(count0[9]),
        .O(\count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(\count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[10]_i_1_n_0 ),
        .Q(\count_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[11]_i_1_n_0 ),
        .Q(\count_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[12]_i_1_n_0 ),
        .Q(\count_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[13]_i_1_n_0 ),
        .Q(\count_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[14]_i_1_n_0 ),
        .Q(\count_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[15]_i_1_n_0 ),
        .Q(\count_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[16]_i_1_n_0 ),
        .Q(char_mem_addr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[17]_i_1_n_0 ),
        .Q(char_mem_addr[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[18]_i_1_n_0 ),
        .Q(char_mem_addr[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \count_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[19]_i_1_n_0 ),
        .Q(char_mem_addr[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(\count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \count_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[20]_i_1_n_0 ),
        .Q(p_0_in_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[21]_i_1_n_0 ),
        .Q(p_0_in[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \count_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[22]_i_1_n_0 ),
        .Q(p_0_in[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[23]_i_1_n_0 ),
        .Q(p_0_in0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[24]_i_1_n_0 ),
        .Q(\count_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[3]_i_1_n_0 ),
        .Q(\count_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[4]_i_1_n_0 ),
        .Q(\count_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[5]_i_1_n_0 ),
        .Q(\count_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[6]_i_1_n_0 ),
        .Q(\count_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[7]_i_1_n_0 ),
        .Q(\count_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[8]_i_1_n_0 ),
        .Q(\count_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[9]_i_1_n_0 ),
        .Q(\count_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA8AAAA)) 
    init_i_1
       (.I0(init),
        .I1(p_0_in0),
        .I2(p_0_in[2]),
        .I3(init_i_2_n_0),
        .I4(p_0_in[3]),
        .I5(\count_reg_n_0_[24] ),
        .O(init_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    init_i_2
       (.I0(char_mem_addr[3]),
        .I1(p_0_in_0),
        .O(init_i_2_n_0));
  FDRE #(
    .INIT(1'b1)) 
    init_reg
       (.C(clk),
        .CE(1'b1),
        .D(init_i_1_n_0),
        .Q(init),
        .R(1'b0));
  FDRE \lcd_d_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\lcd_state_reg_n_0_[0] ),
        .Q(sf_d[8]),
        .R(1'b0));
  FDRE \lcd_d_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\lcd_state_reg_n_0_[1] ),
        .Q(sf_d[9]),
        .R(1'b0));
  FDRE \lcd_d_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\lcd_state_reg_n_0_[2] ),
        .Q(sf_d[10]),
        .R(1'b0));
  FDRE \lcd_d_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\lcd_state_reg_n_0_[3] ),
        .Q(sf_d[11]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h606F6F60)) 
    lcd_e_i_1
       (.I0(char_mem_addr[1]),
        .I1(char_mem_addr[2]),
        .I2(init),
        .I3(\count_reg_n_0_[14] ),
        .I4(\count_reg_n_0_[13] ),
        .O(lcd_e_i_1_n_0));
  FDRE lcd_e_reg
       (.C(clk),
        .CE(1'b1),
        .D(lcd_e_i_1_n_0),
        .Q(lcd_e),
        .R(1'b0));
  FDRE lcd_rs_reg
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0),
        .Q(lcd_rs),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h80FF8000)) 
    \lcd_state[0]_i_1 
       (.I0(char_mem_addr[3]),
        .I1(p_0_in_0),
        .I2(p_0_in[2]),
        .I3(init),
        .I4(\lcd_state[0]_i_2_n_0 ),
        .O(\lcd_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h082E259C081B0820)) 
    \lcd_state[0]_i_2 
       (.I0(\count_reg_n_0_[15] ),
        .I1(char_mem_addr[0]),
        .I2(char_mem_addr[1]),
        .I3(char_mem_addr[2]),
        .I4(char_mem_addr[3]),
        .I5(row),
        .O(\lcd_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h06FF0600)) 
    \lcd_state[1]_i_1 
       (.I0(p_0_in_0),
        .I1(char_mem_addr[3]),
        .I2(p_0_in[2]),
        .I3(init),
        .I4(\lcd_state_reg[1]_i_2_n_0 ),
        .O(\lcd_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8FBFFFCC8FBFFFDD)) 
    \lcd_state[1]_i_3 
       (.I0(char_mem_addr[0]),
        .I1(char_mem_addr[1]),
        .I2(row),
        .I3(char_mem_addr[2]),
        .I4(char_mem_addr[3]),
        .I5(p_0_in_0),
        .O(\lcd_state[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h22920720)) 
    \lcd_state[1]_i_4 
       (.I0(char_mem_addr[0]),
        .I1(char_mem_addr[1]),
        .I2(char_mem_addr[2]),
        .I3(char_mem_addr[3]),
        .I4(row),
        .O(\lcd_state[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h3020FFFF30200000)) 
    \lcd_state[2]_i_1 
       (.I0(p_0_in[3]),
        .I1(p_0_in_0),
        .I2(char_mem_addr[3]),
        .I3(p_0_in[2]),
        .I4(init),
        .I5(\lcd_state_reg[2]_i_2_n_0 ),
        .O(\lcd_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7171F3F34F4FEFEE)) 
    \lcd_state[2]_i_3 
       (.I0(char_mem_addr[0]),
        .I1(char_mem_addr[1]),
        .I2(row),
        .I3(p_0_in_0),
        .I4(char_mem_addr[3]),
        .I5(char_mem_addr[2]),
        .O(\lcd_state[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h515BA70C)) 
    \lcd_state[2]_i_4 
       (.I0(char_mem_addr[0]),
        .I1(char_mem_addr[1]),
        .I2(row),
        .I3(char_mem_addr[2]),
        .I4(char_mem_addr[3]),
        .O(\lcd_state[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h60FF6000)) 
    \lcd_state[3]_i_1 
       (.I0(p_0_in[2]),
        .I1(p_0_in_0),
        .I2(char_mem_addr[3]),
        .I3(init),
        .I4(\lcd_state[3]_i_2_n_0 ),
        .O(\lcd_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888888B88)) 
    \lcd_state[3]_i_2 
       (.I0(\lcd_state[3]_i_3_n_0 ),
        .I1(\count_reg_n_0_[15] ),
        .I2(char_mem_addr[2]),
        .I3(p_0_in_0),
        .I4(char_mem_addr[3]),
        .I5(char_mem_addr[1]),
        .O(\lcd_state[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h11800A7A)) 
    \lcd_state[3]_i_3 
       (.I0(char_mem_addr[0]),
        .I1(char_mem_addr[1]),
        .I2(char_mem_addr[2]),
        .I3(char_mem_addr[3]),
        .I4(row),
        .O(\lcd_state[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \lcd_state[5]_i_1 
       (.I0(\lcd_state[5]_i_3_n_0 ),
        .I1(init),
        .I2(\count[24]_i_3_n_0 ),
        .O(lcd_state0));
  LUT6 #(
    .INIT(64'h00000000FFFFFEFF)) 
    \lcd_state[5]_i_2 
       (.I0(char_mem_addr[0]),
        .I1(char_mem_addr[2]),
        .I2(char_mem_addr[3]),
        .I3(p_0_in_0),
        .I4(char_mem_addr[1]),
        .I5(init),
        .O(\lcd_state[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000011111154)) 
    \lcd_state[5]_i_3 
       (.I0(p_0_in0),
        .I1(p_0_in[3]),
        .I2(char_mem_addr[3]),
        .I3(p_0_in_0),
        .I4(p_0_in[2]),
        .I5(\count_reg_n_0_[24] ),
        .O(\lcd_state[5]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \lcd_state_reg[0] 
       (.C(clk),
        .CE(lcd_state0),
        .D(\lcd_state[0]_i_1_n_0 ),
        .Q(\lcd_state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lcd_state_reg[1] 
       (.C(clk),
        .CE(lcd_state0),
        .D(\lcd_state[1]_i_1_n_0 ),
        .Q(\lcd_state_reg_n_0_[1] ),
        .R(1'b0));
  MUXF7 \lcd_state_reg[1]_i_2 
       (.I0(\lcd_state[1]_i_3_n_0 ),
        .I1(\lcd_state[1]_i_4_n_0 ),
        .O(\lcd_state_reg[1]_i_2_n_0 ),
        .S(\count_reg_n_0_[15] ));
  FDRE #(
    .INIT(1'b0)) 
    \lcd_state_reg[2] 
       (.C(clk),
        .CE(lcd_state0),
        .D(\lcd_state[2]_i_1_n_0 ),
        .Q(\lcd_state_reg_n_0_[2] ),
        .R(1'b0));
  MUXF7 \lcd_state_reg[2]_i_2 
       (.I0(\lcd_state[2]_i_3_n_0 ),
        .I1(\lcd_state[2]_i_4_n_0 ),
        .O(\lcd_state_reg[2]_i_2_n_0 ),
        .S(\count_reg_n_0_[15] ));
  FDRE #(
    .INIT(1'b0)) 
    \lcd_state_reg[3] 
       (.C(clk),
        .CE(lcd_state0),
        .D(\lcd_state[3]_i_1_n_0 ),
        .Q(\lcd_state_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lcd_state_reg[5] 
       (.C(clk),
        .CE(lcd_state0),
        .D(\lcd_state[5]_i_2_n_0 ),
        .Q(p_0_in__0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFBF0040)) 
    row_i_1
       (.I0(init),
        .I1(char_mem_addr[0]),
        .I2(row_i_2_n_0),
        .I3(\count_reg_n_0_[15] ),
        .I4(row),
        .O(row_i_1_n_0));
  LUT4 #(
    .INIT(16'h0004)) 
    row_i_2
       (.I0(char_mem_addr[2]),
        .I1(p_0_in_0),
        .I2(char_mem_addr[3]),
        .I3(char_mem_addr[1]),
        .O(row_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    row_reg
       (.C(clk),
        .CE(1'b1),
        .D(row_i_1_n_0),
        .Q(row),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "pwm_1hz" *) 
module design_1_top_0_0_pwm_1hz
   (vo_pwm,
    clk);
  output vo_pwm;
  input clk;

  wire clear;
  wire clk;
  wire \counter[0]_i_3_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire \counter[0]_i_5_n_0 ;
  wire \counter[0]_i_6_n_0 ;
  wire \counter[0]_i_7_n_0 ;
  wire \counter[0]_i_8_n_0 ;
  wire \counter[0]_i_9_n_0 ;
  wire [26:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_1 ;
  wire \counter_reg[0]_i_2_n_2 ;
  wire \counter_reg[0]_i_2_n_3 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire pwm_out_i_1_n_0;
  wire pwm_out_i_2_n_0;
  wire pwm_out_i_3_n_0;
  wire pwm_out_i_4_n_0;
  wire pwm_out_i_5_n_0;
  wire pwm_out_i_6_n_0;
  wire vo_pwm;
  wire [3:2]\NLW_counter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[24]_i_1_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFF800F800F800)) 
    \counter[0]_i_1 
       (.I0(counter_reg[18]),
        .I1(\counter[0]_i_3_n_0 ),
        .I2(counter_reg[19]),
        .I3(\counter[0]_i_4_n_0 ),
        .I4(counter_reg[26]),
        .I5(counter_reg[25]),
        .O(clear));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEA0000)) 
    \counter[0]_i_3 
       (.I0(counter_reg[8]),
        .I1(\counter[0]_i_6_n_0 ),
        .I2(\counter[0]_i_7_n_0 ),
        .I3(\counter[0]_i_8_n_0 ),
        .I4(\counter[0]_i_9_n_0 ),
        .I5(counter_reg[17]),
        .O(\counter[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \counter[0]_i_4 
       (.I0(counter_reg[26]),
        .I1(counter_reg[20]),
        .I2(counter_reg[21]),
        .I3(counter_reg[22]),
        .I4(counter_reg[23]),
        .I5(counter_reg[24]),
        .O(\counter[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_5 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \counter[0]_i_6 
       (.I0(counter_reg[7]),
        .I1(counter_reg[6]),
        .I2(counter_reg[5]),
        .I3(counter_reg[4]),
        .O(\counter[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \counter[0]_i_7 
       (.I0(counter_reg[1]),
        .I1(counter_reg[0]),
        .I2(counter_reg[3]),
        .I3(counter_reg[2]),
        .O(\counter[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[0]_i_8 
       (.I0(counter_reg[10]),
        .I1(counter_reg[11]),
        .I2(counter_reg[12]),
        .I3(counter_reg[9]),
        .O(\counter[0]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \counter[0]_i_9 
       (.I0(counter_reg[14]),
        .I1(counter_reg[13]),
        .I2(counter_reg[16]),
        .I3(counter_reg[15]),
        .O(\counter[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\counter_reg[0]_i_2_n_1 ,\counter_reg[0]_i_2_n_2 ,\counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\NLW_counter_reg[24]_i_1_CO_UNCONNECTED [3:2],\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[24]_i_1_O_UNCONNECTED [3],\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S({1'b0,counter_reg[26:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'hFFFF0000000B0000)) 
    pwm_out_i_1
       (.I0(pwm_out_i_2_n_0),
        .I1(counter_reg[19]),
        .I2(counter_reg[21]),
        .I3(counter_reg[20]),
        .I4(pwm_out_i_3_n_0),
        .I5(pwm_out_i_4_n_0),
        .O(pwm_out_i_1_n_0));
  LUT6 #(
    .INIT(64'h1011101111111011)) 
    pwm_out_i_2
       (.I0(counter_reg[18]),
        .I1(counter_reg[17]),
        .I2(pwm_out_i_5_n_0),
        .I3(counter_reg[14]),
        .I4(pwm_out_i_6_n_0),
        .I5(counter_reg[13]),
        .O(pwm_out_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    pwm_out_i_3
       (.I0(counter_reg[25]),
        .I1(counter_reg[26]),
        .O(pwm_out_i_3_n_0));
  LUT3 #(
    .INIT(8'h7F)) 
    pwm_out_i_4
       (.I0(counter_reg[24]),
        .I1(counter_reg[23]),
        .I2(counter_reg[22]),
        .O(pwm_out_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h7)) 
    pwm_out_i_5
       (.I0(counter_reg[15]),
        .I1(counter_reg[16]),
        .O(pwm_out_i_5_n_0));
  LUT6 #(
    .INIT(64'h000000000000007F)) 
    pwm_out_i_6
       (.I0(counter_reg[7]),
        .I1(counter_reg[8]),
        .I2(counter_reg[9]),
        .I3(counter_reg[12]),
        .I4(counter_reg[11]),
        .I5(counter_reg[10]),
        .O(pwm_out_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pwm_out_reg
       (.C(clk),
        .CE(1'b1),
        .D(pwm_out_i_1_n_0),
        .Q(vo_pwm),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "top" *) 
module design_1_top_0_0_top
   (lcd_rs,
    lcd_e,
    sf_d,
    vo_pwm,
    clk);
  output lcd_rs;
  output lcd_e;
  output [11:8]sf_d;
  output vo_pwm;
  input clk;

  wire clk;
  wire lcd_e;
  wire lcd_rs;
  wire [11:8]sf_d;
  wire vo_pwm;

  design_1_top_0_0_lcd lcd_1602
       (.clk(clk),
        .lcd_e(lcd_e),
        .lcd_rs(lcd_rs),
        .sf_d(sf_d));
  design_1_top_0_0_pwm_1hz nolabel_line37
       (.clk(clk),
        .vo_pwm(vo_pwm));
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
