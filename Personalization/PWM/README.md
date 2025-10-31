# PWM (Pulse Width Modulation)

PWM (Pulse Width Modulation) — hay Điều chế độ rộng xung — là một kỹ thuật điều khiển điện áp hoặc công suất trung bình bằng cách thay đổi độ rộng của xung (pulse width) trong một tín hiệu vuông có chu kỳ cố định.

## 🔹 1. Nguyên lý cơ bản

Tín hiệu PWM là một chuỗi xung vuông có hai trạng thái:

- **ON (mức cao)** – dòng điện hoặc điện áp được cấp.
- **OFF (mức thấp)** – không có dòng hoặc điện áp.
  Mỗi chu kỳ của tín hiệu PWM có chu kỳ (period) là 𝑇, gồm thời gian bật 𝑇𝑜𝑛 và thời gian tắt 𝑇𝑜𝑓𝑓.

            ```
            𝑇 = 𝑇𝑜𝑛 + 𝑇𝑜𝑓𝑓
            ```

Tần số PWM: `𝑓 = 1 / 𝑇`

## 🔹 2. Hệ số nhiệm vụ (Duty Cycle)

Là tỉ lệ thời gian tín hiệu ở mức cao so với toàn chu kỳ:

`Duty Cycle = (𝑇𝑜𝑛 / 𝑇) ×100%`

Ví dụ:

| Duty Cycle | Mô tả         | Điện áp trung bình (nếu Vmax = 5V) |
| ---------- | ------------- | ---------------------------------- |
| 0%         | Luôn OFF      | 0V                                 |
| 25%        | ON 1/4 chu kỳ | 1.25V                              |
| 50%        | ON nửa chu kỳ | 2.5V                               |
| 75%        | ON 3/4 chu kỳ | 3.75V                              |
| 100%       | Luôn ON       | 5V                                 |

![image](https://www.maxxecu.com/webhelp/images/clip1567.png)

## 🔹 3. Ứng dụng của PWM

PWM rất phổ biến trong điều khiển thiết bị điện tử và nhúng, ví dụ:

- ⚙️ Điều khiển tốc độ động cơ DC (bằng cách thay đổi điện áp trung bình).
- 💡 Điều chỉnh độ sáng LED.
- 🔊 Tạo tín hiệu analog giả lập (DAC).
- 🧠 Điều khiển servo motor (trong robot, cánh tay cơ).
- ⚡ Chuyển đổi nguồn (Switching Power Supply).

## 🔹 4. Hình dạng sóng minh họa

![image](https://docs.lattepanda.com/assets/images/IO%20Playability/fcc8.webp)

→ Cả hai có cùng tần số, nhưng độ rộng xung khác nhau, dẫn đến điện áp trung bình khác nhau.
