# CD4017B Decade Counter/Divider with 10 Decoded Outputs

**CD4017** là một **IC đếm thập phân (Decade Counter)** kiêm **mạch giải mã 10 đầu ra**, thường được dùng rất nhiều trong các mạch điện tử cơ bản như đèn LED chạy, mạch đếm, đồng hồ, hoặc hiển thị tuần tự.

* **Nhà sản xuất**: Texas Instruments, HCF4017 (ST), HEF4017 (NXP), v.v.
* **Công nghệ**: CMOS logic IC dòng 4000 series.

## ⚙️ Chức năng chính

CD4017 là **mạch đếm modulo-10** (0 → 9) theo xung clock đầu vào.
Mỗi xung clock làm **một trong 10 đầu ra (Q0 → Q9)** được kích lên mức **HIGH**, còn lại sẽ là **LOW**.

| Xung Clock | Đầu ra mức cao |
| ---------- | -------------- |
| 1          | Q0             |
| 2          | Q1             |
| 3          | Q2             |
| ...        | ...            |
| 10         | Q9             |
| 11         | Q0 (lặp lại)   |

## 🔌 Chân của IC CD4017

| Chân | Tên                        | Chức năng                                               |
| ---- | -------------------------- | ------------------------------------------------------- |
| 16   | **VDD**                    | Nguồn dương (3V–15V)                                    |
| 8    | **VSS (GND)**              | Mass                                                    |
| 13   | **ENABLE (Clock Inhibit)** | Khi ở mức HIGH → chặn xung clock (tạm dừng đếm)         |
| 14   | **CLOCK**                  | Nhận xung clock (tác nhân đếm)                          |
| 15   | **RESET**                  | Khi ở mức HIGH → reset về Q0                            |
| 12   | **CARRY OUT**              | Tạo tín hiệu mang ra, dùng để nối cascade nhiều IC 4017 |

## 💡 Ứng dụng phổ biến

* Mạch LED chạy (LED chớp tuần tự)
* Đếm sản phẩm, đếm xung từ cảm biến
* Điều khiển tuần tự (bật tắt relay, thiết bị,...)
* Trò chơi điện tử mini (ví dụ quay đèn chọn số ngẫu nhiên)
* Mạch chia tần số/10 cho tín hiệu xung

### 🧠 Ví dụ: Mạch LED chạy 10 bóng

Gắn 10 LED vào Q0–Q9 qua điện trở 330Ω, nối:

* Clock từ IC555 ở chế độ astable (~1Hz)
* Reset nối GND
* Enable nối GND
    → Mỗi xung clock, LED tiếp theo sáng, tạo hiệu ứng “LED chạy”.
