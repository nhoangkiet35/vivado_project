//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Sat Nov  1 21:01:06 2025
//Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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
  wire processing_system7_0_FCLK_CLK0;
  wire [11:8]sf_d_0;
  wire vo_pwm_0;

  design_1_processing_system7_0_0 processing_system7_0
       (.FCLK_CLK0(processing_system7_0_FCLK_CLK0));
  design_1_top_0_0 top_0
       (.clk(processing_system7_0_FCLK_CLK0),
        .lcd_e(lcd_e_0),
        .lcd_rs(lcd_rs_0),
        .lcd_rw(lcd_rw_0),
        .sf_d(sf_d_0),
        .vo_pwm(vo_pwm_0));
endmodule
