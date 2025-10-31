# 🏗️ TỔNG KẾT KIẾN TRÚC HỆ THỐNG ROTARY-ENCODER FSM CALC — PYNQ Z2 + 74HC595 + KY-040

## 📘 Giới thiệu

Dự án Rotary Encoder FSM Calculator là một mini-project trên FPGA board PYNQ Z2, kết hợp giữa:

* Mạch **KY-040 Rotary Encoder** (nhập dữ liệu và chọn chế độ),
* Mạch **4-digit 7-segment LED sử dụng 74HC595**,
* Và **FSM (Finite State Machine)** điều khiển logic hoạt động như một máy tính mini thực hiện các phép toán đơn giản trên FPGA.

Mục tiêu của dự án là rèn luyện kỹ năng thiết kế hệ thống số bằng Verilog HDL, kết hợp các khối logic, giải mã, đếm, quét hiển thị và giao tiếp tuần tự.

## ⚙️ Cấu trúc hệ thống

### 🔹 Phần cứng

| Thành phần                    | Mô tả                                                         | Ghi chú                           |
| ----------------------------- | ------------------------------------------------------------- | --------------------------------- |
| **PYNQ Z2 FPGA Board**        | Xử lý toàn bộ logic, xung clock 100 MHz                       | Xilinx Zynq-7020                  |
| **KY-040 Rotary Encoder**     | Nhập giá trị (A, B, opcode) và điều hướng giữa các trạng thái | Gồm 3 tín hiệu chính: CLK, DT, SW |
| **74HC595 Shift Register**    | Điều khiển 4-digit 7-seg (0.36 inch) qua giao tiếp 3 dây      | Chân `SCLK`, `RCLK`, `DIO`        |
| **4-Digit 7-Segment Display** | Hiển thị giá trị, ký hiệu phép toán và kết quả                | Common Anode                    |

### 🧩 Sơ đồ khối

```plaintext
                     +---------------------------+
                     |        PYNQ Z2 (FPGA)     |
                     |                           |
+----------------+   |  Rotary Decoder  → A,B,Op |
| Rotary Encoder | → |     FSM Controller        |
+----------------+   |          ↓                |
                     |     Display Driver        |
                     |  (74HC595 Serial Output)  |
                     +---------------------------+
                                ↓
                     +--------------------+
                     |  4-digit 7-seg LED |
                     +--------------------+
```

### 🧠 Mô tả trạng thái (FSM)

| Trạng thái  | Tên         | Mô tả                                       | LED hiển thị     |
| ----------- | ----------- | ------------------------------------------- | ---------------- |
| **STATE 0** | Input_A     | Quay Encoder để nhập giá trị `A` (0–9)      | Hiển thị “A:x”   |
| **STATE 1** | Input_B     | Quay Encoder để nhập giá trị `B` (0–9)      | Hiển thị “B:y”   |
| **STATE 2** | Select_Op   | Quay Encoder để chọn phép toán (+, –, ×, ÷) | Hiển thị ký hiệu |
| **STATE 3** | Show_Result | Tính toán và hiển thị kết quả `A ⊗ B`       | Hiển thị “=z”    |

> Nhấn nút SW để chuyển sang trạng thái tiếp theo hoặc reset về STATE 0.

### 🔌 Mapping tín hiệu

#### KY-040 Rotary Encoder

| KY-040 Pin | FPGA Pin | Mô tả                    |
| ---------- | -------- | ------------------------ |
| +          | 3.3V     | Nguồn                    |
| GND        | GND      | Nguồn âm                 |
| CLK        | `Y14`     | Phase A                  |
| DT         | `T11`     | Phase B                  |
| SW         | `T10`     | Nút nhấn (opcode select) |

#### 74HC595 + 7-Seg

| Chân  | FPGA Pin | Mô tả        |
| ----- | -------- | ------------ |
| DS    | `Y19`     | DIO (data)   |
| SH_CP | `Y16`     | SCLK (shift) |
| ST_CP | `Y17`     | RCLK (latch) |

### 🧩 Cấu trúc mã nguồn

```
├── src/
│   ├── top_calculator.v     // Module top-level: kết nối toàn hệ thống
│   ├── rotary_decoder.v     // Giải mã KY-040 (A/B)
|   ├── button_debounce      // Chống dội nút nhấn (SW)
│   ├── fsm_controller.v     // FSM 4 trạng thái (A, B, Op, Result)
│   ├── alu_calc.v           // Tính toán A ⊗ B
│   ├── shift_74hc595.v      // Xuất dữ liệu serial ra LED 7-seg
│   ├── digit_driver.v       // Điều khiển hiển thị quét 4-digit
│   ├── hex_to_7seg.v        // Giải mã số → dạng 7-segment
│   └── Divided_1Hz.v        // Clock divider từ 100 MHz → 1 Hz hoặc tần số quét
```

## 🧮 Nguyên lý hoạt động

* **Khởi động**: Hệ thống reset về `STATE 0`, giá trị A = 0, B = 0.
* **Nhập A**: Quay encoder, giá trị A thay đổi 0–9 → hiển thị “A:x”.
* **Nhấn SW**: Sang `STATE 1`, nhập B → hiển thị “B:y”.
* **Nhấn SW**: Sang `STATE 2`, chọn phép toán (`+, -, and, or`).
* **Nhấn SW**: Sang `STATE 3`, hiển thị kết quả `=z`.
* **Nhấn SW lần nữa**: Reset toàn bộ và trở về `STATE 0`.

## 💡 Mở rộng

* Hiển thị giá trị âm hoặc số nhiều chữ số.
* Lưu A/B vào BRAM hoặc giao tiếp UART để debug.
* Tích hợp module ALU từ bài học VLSI/FPGA design.
* Tăng số phép toán (AND, OR, XOR).
* Giao tiếp với màn hình OLED thay cho LED 7-seg.

## 👨‍💻 Tác giả

```
Nguyễn Hữu Hoàng Kiệt —
Sinh viên chương trình Thiết Kế Vi Mạch Bán Dẫn Quốc Tế FPT Jetking.
Mục tiêu: phát triển kỹ năng thiết kế hệ thống nhúng và FPGA SoC (Zynq).
```
