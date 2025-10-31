# Kiểm Tra và Giải Thích Chi Tiết Code

## 🧩 1️⃣ Mục tiêu hệ thống

Ba file bạn có (`char_mem.v`, `lcd.v`, `top.v`) thường được tổ chức theo kiến trúc phân tầng (**hierarchical design**):

| File             | Vai trò                        | Mô tả                                                                                         |
| ---------------- | ------------------------------ | --------------------------------------------------------------------------------------------- |
| **`char_mem.v`** | Bộ nhớ ký tự                   | Lưu sẵn các ký tự ASCII cần hiển thị lên LCD (ví dụ: “HELLO”, “FPGA”, v.v.)                   |
| **`lcd.v`**      | Bộ điều khiển LCD (LCD Driver) | Xử lý giao tiếp 4-bit với LCD1602: gửi lệnh (command) và dữ liệu theo đúng timing của HD44780 |
| **`top.v`**      | Module cấp cao nhất            | Kết nối tất cả: clock/reset,`char_mem`, `lcd.v` và các tín hiệu I/O thực tế ra LCD            |

## ⚙️ 2️⃣ Sơ đồ tổng quát

```plaintext
                +-----------------------------+
                |          top.v              |
                |                             |
                |   +---------------------+   |
                |   |                     |---|--> lcd_rs
Clock --------> |-->|   LCD Controller    |---|--> lcd_rw
                |   |     (lcd.v)         |---|--> lcd_en
                |   +---------------------+   |
                |             ↓               |
                |   +---------------------+   |
                |   |   Char Memory       |   |
                |   |   (char_mem.v)      |---|--> lcd_d[3:0]
                |   +---------------------+   |
                +-----------------------------+
```

| LCD Pin | FPGA Signal  | Ghi chú                         |
| ------- | ------------ | ------------------------------- |
| D4–D7   | `lcd_d[3:0]` | Bus dữ liệu 4-bit               |
| RS      | `lcd_rs`     | Chọn: 0 = Command, 1 = Data     |
| RW      | `lcd_rw`     | Luôn nối xuống GND (Write only) |
| EN      | `lcd_en`     | Xung kích hoạt (Enable)         |
| VDD     | +5V          | Nguồn                           |

## 🧠 3️⃣ Luồng dữ liệu giữa 3 module

| Module           | Input                | Output                   | Vai trò                                              |
| ---------------- | -------------------- | ------------------------ | ---------------------------------------------------- |
| **`char_mem.v`** | index (vị trí ký tự) | ASCII code (8-bit)       | Giữ nội dung hiển thị                                |
| **`lcd.v`**      | clk, rst, data_in    | lcd_rs, lcd_en, lcd_data | Điều khiển timing và giao tiếp 4-bit                 |
| **`top.v`**      | clk, rst             | lcd\_\*                  | Gọi `char_mem` và `lcd`, tạo FSM hiển thị từng ký tự |

**Luồng dữ liệu:**

```plaintext
top.v FSM → chọn địa chỉ ký tự → char_mem.v → trả về ASCII
                  ↓
                 lcd.v  → tách nibble cao / thấp (1 µs)
                        → phát xung E (1 µs)
                        → truyền RS=1 (data)
                        → gửi ra D7–D4

đợi thời gian xử lý lệnh / ký tự (40 µs – 2 ms) đúng chuẩn HD44780.
```

## 💡 4️⃣ Cách hiển thị trên LCD 1602

1. LCD khởi tạo bằng chuỗi lệnh:
    1. Function Set (`0x28`)
    2. Display On (`0x0C`)
    3. Clear Display (`0x01`)
    4. Entry Mode (`0x06`)
2. Sau đó, `top.v` gửi tuần tự ký tự từ `char_mem.v` qua `lcd.v`.
3. `lcd.v` tách mỗi ký tự 8-bit thành 2 nibble:
    1. Gửi nibble cao trước, nibble thấp sau.
    2. Mỗi nibble có **Enable pulse ≥ 450ns**.
    3. Giữa mỗi lệnh có delay ~40 µs.
4. LCD tự động hiển thị ký tự tại vị trí con trỏ, sau đó tự di chuyển sang phải.

| Bước                                              | Mục đích            | File chịu trách nhiệm |
| ------------------------------------------------- | ------------------- | --------------------- |
| Khởi tạo LCD (Function Set, Display ON, Clear...) | Gửi command         | `lcd.v`               |
| Chọn ký tự hiển thị                               | Lấy từ ROM          | `char_mem.v`          |
| Trình tự toàn hệ thống                            | FSM điều khiển      | `top.v`               |
| Mô phỏng và test                                  | Testbench (bổ sung) | `tb_top.v`            |

## 📘 5️⃣ Hướng dẫn sử dụng trong thực tế

### 🔹 Bước 1: Tổ chức project trong Vivado

- Tạo project mới: `Vivado → Create Project → RTL Project`
- Thêm 3 file:

    ```plaintext
    add sources:
    ├── char_mem.v
    ├── lcd.v
    └── top.v   ← module chính
    ```

- Đặt `top.v` làm **Top Module** .
- Mapping pin constraints (`.xdc`): Gán tín hiệu với chân thật của LCD (ví dụ PYNQ Z2)

    ```xml
    set_property -dict PACKAGE_PIN Y11 [get_ports lcd_rs]
    set_property -dict PACKAGE_PIN Y12 [get_ports lcd_en]
    set_property -dict PACKAGE_PIN W11 [get_ports {lcd_data[0]}]
    set_property -dict PACKAGE_PIN V11 [get_ports {lcd_data[1]}]
    set_property -dict PACKAGE_PIN T5  [get_ports {lcd_data[2]}]
    set_property -dict PACKAGE_PIN U10 [get_ports {lcd_data[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports *]
    ```

### 🔹 Bước 2: Mô phỏng (Simulation)

Nếu bạn muốn **kiểm tra logic và timing** trước khi nạp vào FPGA, hãy tạo file testbench:
Quan sát các tín hiệu:

- lcd_en có các xung đều đặn,
- lcd_rs thay đổi giữa command/data,
- lcd_data truyền từng nibble 4-bit,
- thời gian delay (40 µs – 2 ms) đúng chuẩn HD44780.
