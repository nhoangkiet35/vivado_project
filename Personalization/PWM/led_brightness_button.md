# Kết hợp nút nhấn (Button) và PWM (Pulse Width Modulation)

🧩 Mục tiêu

- Mỗi khi nhấn nút (button), LED sẽ sáng hơn một mức.
- Khi đạt đến độ sáng tối đa, nhấn tiếp sẽ quay lại mức sáng thấp nhất.
- Độ sáng LED được điều khiển bằng PWM.

⚙️ 1. Cấu trúc hệ thống

```textplain
+-------------------+
|  button_debounce  |  → Loại nhiễu nút nhấn
+-------------------+
         ↓
+-------------------+
|  brightness_ctrl  |  → Mỗi lần nhấn: tăng duty cycle PWM
+-------------------+
         ↓
+-------------------+
|   pwm_generator   |  → Tạo xung PWM để điều chỉnh độ sáng LED
+-------------------+
         ↓
        LED
```
