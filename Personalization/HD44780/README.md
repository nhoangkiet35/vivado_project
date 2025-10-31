# HD44780U — LCD 1602 | Alldatasheet

## HD44780U

### 🧩 **1. HD44780 là gì?**

**HD44780** là **IC điều khiển LCD ký tự** (LCD Character Controller) do hãng **Hitachi** phát triển.

Nó là **“bộ não” điều khiển màn hình LCD ký tự** — ví dụ như loại **LCD 1602** hoặc **LCD 2004** .

👉 Nói dễ hiểu:

> HD44780 giúp bạn **giao tiếp với LCD qua các chân dữ liệu và điều khiển** , thay vì phải tự điều khiển từng điểm ảnh.

### 📟 **2. LCD 1602 là gì?**

**LCD 1602** nghĩa là:

- **16** : mỗi hàng có 16 ký tự
- **02** : có 2 hàng

Mỗi ký tự được hiển thị trong một **ô ma trận 5x8 điểm** (pixel).

=> Tổng cộng LCD 1602 có thể hiển thị **32 ký tự** .

### ⚙️ **3. Cấu tạo LCD 1602 (dùng HD44780)**

| Nhóm chân      | Tên chân     | Chức năng                                              |
| -------------- | ------------ | ------------------------------------------------------ |
| **Nguồn**      | VSS, VDD, V0 | GND, +5V, điều chỉnh độ tương phản                     |
| **Điều khiển** | RS, RW, E    | RS = chọn lệnh/dữ liệu, RW = đọc/ghi, E = chốt dữ liệu |
| **Dữ liệu**    | D0–D7        | Gửi dữ liệu 8-bit hoặc 4-bit                           |
| **Khác**       | LED+, LED−   | Nguồn đèn nền                                          |

### 🧠 **4. Giao tiếp 8-bit vs 4-bit**

HD44780 hỗ trợ **2 chế độ giao tiếp dữ liệu** :

| Chế độ    | Dây dữ liệu | Đặc điểm                                                      |
| --------- | ----------- | ------------------------------------------------------------- |
| **8-bit** | D0 → D7     | Gửi toàn bộ byte (8 bit) trong 1 lần                          |
| **4-bit** | D4 → D7     | Gửi**nửa byte (4 bit)**mỗi lần — tiết kiệm chân vi điều khiển |

👉 **Thường dùng 4-bit mode** vì chỉ cần **6 dây** điều khiển chính:

```plaintext
RS, E, D4, D5, D6, D7  (+ VSS, VDD, V0)
```

### 🔌 **5. Cách truyền dữ liệu 4-bit (ví dụ dễ hiểu)**

Khi bạn muốn gửi 1 byte dữ liệu (ví dụ `0x41 = 'A'`):

- Gửi **4 bit cao (0100)** trước
- Gửi **4 bit thấp (0001)** sau

LCD sẽ ghép lại thành 8-bit (`01000001`) để hiển thị ký tự `'A'`.

#### 📘 **Ví dụ giao tiếp LCD 1602 ở chế độ 4-bit (C code đơn giản)**

```c
#include <reg51.h>   // cho 8051

sbit RS = P2^0;
sbit EN = P2^1;
sbit D4 = P2^4;
sbit D5 = P2^5;
sbit D6 = P2^6;
sbit D7 = P2^7;

void lcd_pulse() {
    EN = 1;
    delay_us(1);   // trễ ngắn tối thiểu 450ns, chu kỳ tối thiểu enable 1µs
    EN = 0;
}

void lcd_send_nibble(unsigned char data) {
    D4 = (data >> 4) & 1;
    D5 = (data >> 5) & 1;
    D6 = (data >> 6) & 1;
    D7 = (data >> 7) & 1;
    lcd_pulse();
}

void lcd_command(unsigned char cmd) {
    RS = 0;
    lcd_send_nibble(cmd);
    lcd_send_nibble(cmd << 4);
    delay_ms(2);    // các lệnh thường (thời gian chờ tối thiểu 37µs hoặc 40µs)
      // lệnh đặc biệt xóa màn hình/con trỏ về đầu dòng (thời gian chờ tối thiểu 1.52ms hoặc 2ms)
}

void lcd_data(unsigned char data) {
    RS = 1;
    lcd_send_nibble(data);
    lcd_send_nibble(data << 4);
    delay_us(40);   // đợi LCD xử lý ký tự >= 37µs
}

void lcd_init() {
    lcd_command(0x28); // 4-bit, 2 dòng, font 5x8
    lcd_command(0x0C); // bật hiển thị, tắt con trỏ
    lcd_command(0x06); // tự động dịch con trỏ sang phải
    lcd_command(0x01); // xóa màn hình
}

void main() {
    lcd_init();
    lcd_data('H');
    lcd_data('e');
    lcd_data('l');
    lcd_data('l');
    lcd_data('o');
}

```

### 🧾 **6. Tóm tắt hoạt động HD44780**

| Tín hiệu       | Mô tả                                           |
| -------------- | ----------------------------------------------- |
| **RS = 0**     | Gửi lệnh (Command)                              |
| **RS = 1**     | Gửi dữ liệu ký tự                               |
| **E (Enable)** | Khi chuyển từ 1 → 0, LCD "chốt"**lấy dữ liệu**  |
| **RW = 0**     | Ghi (thường RW luôn = 0 trong ứng dụng thực tế) |

Một vài lệnh phổ biến của HD44780:

| Lệnh (hex) | Chức năng                                                             |
| ---------- | --------------------------------------------------------------------- |
| `0x01`     | Xóa màn hình                                                          |
| `0x02`     | Đưa con trỏ về đầu dòng                                               |
| `0x06`     | Entry mode: tăng con trỏ, không dịch màn hình, dịch con trỏ sang phải |
| `0x0C`     | Bật hiển thị, tắt con trỏ                                             |
| `0x0F`     | Display ON, Cursor ON, Blink ON                                       |
| `0x18`     | Shift display left (cuộn trái)                                        |
| `0x1C`     | Shift display right (cuộn phải)                                       |
| `0x28`     | (Function Set) Giao tiếp 4-bit, 2 dòng, font 5x8                      |
| `0x38`     | (Function Set) Giao tiếp 8-bit, 2 dòng, font 5x8                      |

## 🕔 Timing Sequence Characteristics

Hiểu **timing (thời gian truyền dữ liệu)** của **LCD 1602 (IC điều khiển HD44780)** là **rất quan trọng** — vì nếu **gửi lệnh quá nhanh** , LCD **chưa kịp xử lý** → màn hình sẽ **hiển thị sai hoặc không hiển thị gì cả** .

### ⚙️ 1. Tổng quan về **chu kỳ giao tiếp (timing cycle)**

Mỗi khi bạn **gửi lệnh hoặc dữ liệu** , LCD cần:

1. **Ổn định tín hiệu dữ liệu (D4–D7, RS, RW)**
2. **Tạo xung Enable (E)** để LCD “chốt” dữ liệu
3. **Chờ LCD xử lý nội bộ** (gọi là _execution time_ )

### ⏱️ 2. **Tín hiệu chính và vai trò timing**

| Tín hiệu  | Mô tả                            | Timing quan trọng              |
| --------- | -------------------------------- | ------------------------------ |
| **RS**    | Chọn thanh ghi (Register Select) | Ổn định trước khi E = 1        |
| **RW**    | Chọn chế độ đọc/ghi              | Thường = 0 (ghi)               |
| **E**     | Enable – xung chốt dữ liệu       | Là xung 1–0 để LCD đọc dữ liệu |
| **D4–D7** | Dữ liệu truyền                   | Ổn định trước khi E = 1        |

### 🧠 3. **Quy trình truyền dữ liệu 4-bit (1 byte → 2 lần gửi)**

Ví dụ: bạn gửi `0x41` (chữ `'A'` = `8'b0100_0001`)

1️⃣ **Gửi nửa byte cao (0100)**

- Đặt `RS`, `RW`, `D4–D7`
- Đưa **E = 1 → 0** để chốt
- Đợi 1–2 µs

2️⃣ **Gửi nửa byte thấp (0001)**

- Đặt `RS`, `RW`, `D4–D7`
- Đưa **E = 1 → 0**
- Đợi 37 µs hoặc nhiều hơn (LCD xử lý ký tự)

### 📉 4. **Thông số timing quan trọng (theo datasheet HD44780)**

| Thông số                                     | Ký hiệu        | Giá trị điển hình |
| -------------------------------------------- | -------------- | ----------------- |
| Chu kỳ Enable                                | `t_cycE`       | ≥ 1 µs            |
| Enable pulse width (thời gian E = 1)         | `t_pwE`        | ≥ 450 ns          |
| Setup time của RS, RW, D4–D7 trước khi E = 1 | `t_su`         | ≥ 140 ns          |
| Hold time sau khi E xuống 0                  | `t_h`          | ≥ 10 ns           |
| Execution time (thời gian xử lý lệnh)        | `t_exec`       | ≈ 37 µs           |
| Execution time của lệnh “Clear” hoặc “Home”  | `t_exec_clear` | ≈ 1.52 ms         |

📘 **Giải thích** :

- `t_exec = 37 µs`: LCD cần ~37 micro giây để thực thi hầu hết các lệnh (ghi ký tự, set cursor, v.v.)
- `t_exec_clear = 1.52 ms`: xóa màn hình mất lâu hơn vì LCD phải ghi lại toàn bộ bộ nhớ hiển thị.

![image](https://www.exploreembedded.com/wiki/images/0/0b/LCD_CmdWrite.jpg)

- Khi **E chuyển từ 1 → 0** , LCD sẽ **lấy dữ liệu trên D4–D7** (và RS, RW).
- Sau đó, LCD bắt đầu xử lý nội bộ → **cần delay ~37 µs** (hoặc lâu hơn với Clear, Home).

### 📘 5. **Ví dụ thời gian thực cho 1 byte dữ liệu**

Delay thực tế cần chèn trong code:

```c
// sau mỗi xung E, delay ít nhất 40us (lệnh thường)
_delay_us(40);

// nếu là lệnh 0x01 (Clear) hoặc 0x02 (Home)
_delay_ms(2);
```

Truyền 1 byte ở chế độ 4-bit:

| Bước            | Thời gian tối thiểu |
| --------------- | ------------------- |
| Gửi nibble cao  | ~1 µs               |
| Gửi nibble thấp | ~1 µs               |
| Chờ xử lý       | 37 µs               |
| **Tổng**        | ≈**40 µs/byte**     |

Nếu LCD hiển thị 16 ký tự → 16 × 40 µs = **640 µs ≈ 0.64 ms** ⇒ đủ nhanh cho hiển thị text.

### 💡 6. **Cách tối ưu timing**

- Dùng **“busy flag”** (chân D7 ở chế độ đọc RW=1) để kiểm tra LCD đã sẵn sàng chưa, thay vì delay cố định.
- Nhưng trong thực tế, **hầu hết lập trình nhúng dùng delay cố định** vì đơn giản và đủ ổn định.

### 🔚 Tóm tắt dễ nhớ

| Đặc điểm                    | Giá trị  |
| --------------------------- | -------- |
| Giao tiếp 4-bit (2 lần gửi) | D4–D7    |
| Enable Pulse Width          | ≥ 450 ns |
| Setup Time                  | ≥ 140 ns |
| Hold Time                   | ≥ 10 ns  |
| Thời gian thực thi lệnh     | 37 µs    |
| Thời gian xóa màn hình      | 1.52 ms  |
| Delay sau mỗi lệnh          | 40 µs    |
| Delay sau Clear/Home        | 2 ms     |

## 🧭 Function Set trong Timing Sequence của LCD 1602 (HD44780)

![image](https://www.learningaboutelectronics.com/images/Instruction-set-for-HD44780-LCD-module.png)

### 🧩 1️⃣ **“Function Set” là gì?**

**Function Set** là **một lệnh (command)** trong bộ điều khiển **HD44780**

→ dùng để **cấu hình chế độ hoạt động cơ bản của LCD** ngay sau khi khởi tạo.

Nói cách khác:

> Function Set là **bước cấu hình đầu tiên** mà bạn gửi cho LCD để nó biết bạn đang dùng **4-bit hay 8-bit** , có **mấy dòng hiển thị** , và **kiểu font ký tự** . **Mục đích**: Thiết lập giao tiếp (4/8 bit), số dòng, font ký tự

### ⚙️ 2️⃣ **Cú pháp (command code) của Function Set**

Cấu trúc lệnh Function Set gồm **8 bit** :

| Bit | Ký hiệu | Chức năng                     | Ghi chú    |
| --- | ------- | ----------------------------- | ---------- |
| D7  | 0       | –                             | luôn 0     |
| D6  | 0       | –                             | luôn 0     |
| D5  | 1       | xác định là lệnh Function Set |            |
| D4  | DL      | Data Length (8-bit/4-bit)     |            |
| D3  | N       | Number of lines (1 hoặc 2)    |            |
| D2  | F       | Font (5x8 hoặc 5x10)          |            |
| D1  | 0       | –                             | Don't care |
| D0  | 0       | –                             | Don't care |

### 🧠 3️⃣ **Ý nghĩa các bit điều khiển**

| Bit                     | Tên                            | Ý nghĩa |
| ----------------------- | ------------------------------ | ------- |
| **DL (Data Length)**    | 1 = 8-bit mode, 0 = 4-bit mode |         |
| **N (Number of Lines)** | 0 = 1 dòng, 1 = 2 dòng         |         |
| **F (Font)**            | 0 = font 5x8, 1 = font 5x10    |         |

💡 4️⃣ **Ví dụ lệnh Function Set phổ biến**

| Mục tiêu                | Code Hex | Cấu hình    |
| ----------------------- | -------- | ----------- |
| 8-bit, 2 dòng, 5x8 font | `0x38`   | `00111000b` |
| 4-bit, 2 dòng, 5x8 font | `0x28`   | `00101000b` |

=> Khi lập trình ở chế độ **4-bit** , ta thường dùng: `lcd_command(0x28);`

### 📘 5️⃣ **Function Set trong chuỗi khởi tạo (Initialization Sequence)**

Khi LCD bật lên, nó **không biết bạn muốn dùng 4-bit hay 8-bit** , nên cần **chuỗi lệnh Function Set đặc biệt** .

#### 🔹 Trường hợp dùng **4-bit mode**

Theo **datasheet HD44780** , quy trình chuẩn là:

| Bước | Gửi gì                                                          | Ý nghĩa                                 |
| ---- | --------------------------------------------------------------- | --------------------------------------- |
| 1    | Delay >15 ms                                                    | chờ nguồn ổn định                       |
| 2    | `0x30`(8-bit mode giả lập)                                      | báo LCD rằng “chuẩn bị dùng 8-bit”      |
| 3    | Delay >4.1 ms                                                   | chờ                                     |
| 4    | `0x30`                                                          | lặp lại                                 |
| 5    | Delay >100 µs                                                   | chờ                                     |
| 6    | `0x30`                                                          | lần 3 (LCD xác định chắc chắn là 8-bit) |
| 7    | `0x20`                                                          | báo LCD “chuyển sang 4-bit mode”        |
| 8    | Bây giờ gửi lệnh **Function Set = 0x28** để cấu hình hoàn chỉnh |                                         |

### 📈 6️⃣ **Timing sequence của Function Set**

#### 🔹 Khi gửi Function Set (`0x28`) ở 4-bit mode

Cấu trúc lệnh `001(DL)(N)(F)00`

- Gửi nibble cao `0010` (0x2)
- Gửi nibble thấp `1000` (0x8)
- Mỗi nibble có:
    - `E` pulse width ≥ 450 ns
    - `Data setup ≥ 140 ns`
    - `Data hold ≥ 10 ns`
- Sau khi hoàn tất, LCD cần **t_exec = 37 µs** để xử lý.

#### 🔹 Dạng sóng thời gian (Timing Diagram)

```plaintext
Thời gian → →

RS = 0 (command)
RW = 0 (write)
D7–D4 = 0010 (MSB)   ---->  E pulse  ---> LCD nhận nibble cao
Delay ≥ 40 µs
D7–D4 = 1000 (LSB)   ---->  E pulse  ---> LCD nhận nibble thấp
Delay ≥ 40 µs (LCD xử lý lệnh)
```

### 🕒 7️⃣ **Thời gian xử lý của Function Set**

| Lệnh                         | Execution time (t_exec) |
| ---------------------------- | ----------------------- |
| **Function Set (0x20–0x3F)** | ≈**37 µs**              |

(Theo HD44780U datasheet)

Nếu bạn gửi ngay lệnh tiếp theo mà không delay đủ, LCD có thể không phản hồi chính xác.
