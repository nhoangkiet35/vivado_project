//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Sat Oct 25 20:33:33 2025
//Host        : DESKTOP-APIEEJV running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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
  input rst_0;

  wire DIO_0;
  wire RCLK_0;
  wire SCLK_0;
  wire enc_a_0;
  wire enc_b_0;
  wire enc_sw_0;
  wire rst_0;

  design_1 design_1_i
       (.DIO_0(DIO_0),
        .RCLK_0(RCLK_0),
        .SCLK_0(SCLK_0),
        .enc_a_0(enc_a_0),
        .enc_b_0(enc_b_0),
        .enc_sw_0(enc_sw_0),
        .rst_0(rst_0));
endmodule
