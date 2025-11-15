//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Sat Nov  1 21:01:06 2025
//Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (lcd_e_0,
    lcd_rs_0,
    lcd_rw_0,
    sf_d_0,
    vo_pwm_0);
  output lcd_e_0;
  output lcd_rs_0;
  output lcd_rw_0;
  output [11:8]sf_d_0;
  output vo_pwm_0;

  wire lcd_e_0;
  wire lcd_rs_0;
  wire lcd_rw_0;
  wire [11:8]sf_d_0;
  wire vo_pwm_0;

  design_1 design_1_i
       (.lcd_e_0(lcd_e_0),
        .lcd_rs_0(lcd_rs_0),
        .lcd_rw_0(lcd_rw_0),
        .sf_d_0(sf_d_0),
        .vo_pwm_0(vo_pwm_0));
endmodule
