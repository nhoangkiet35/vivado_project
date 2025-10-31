//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Sat Oct 25 20:33:33 2025
//Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (DIO_0,
    RCLK_0,
    SCLK_0,
    enc_a_0,
    enc_b_0,
    enc_sw_0,
    rst_0);
  output DIO_0;
  output RCLK_0;
  output SCLK_0;
  input enc_a_0;
  input enc_b_0;
  input enc_sw_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_0;

  wire DIO_0;
  wire RCLK_0;
  wire SCLK_0;
  wire enc_a_0;
  wire enc_b_0;
  wire enc_sw_0;
  wire processing_system7_0_FCLK_CLK0;
  wire rst_0;

  design_1_processing_system7_0_0 processing_system7_0
       (.FCLK_CLK0(processing_system7_0_FCLK_CLK0));
  design_1_top_calculator_0_0 top_calculator_0
       (.DIO(DIO_0),
        .RCLK(RCLK_0),
        .SCLK(SCLK_0),
        .clk(processing_system7_0_FCLK_CLK0),
        .enc_a(enc_a_0),
        .enc_b(enc_b_0),
        .enc_sw(enc_sw_0),
        .rst(rst_0));
endmodule
