# LAB \& EXAM – ADCA

---

## LAB

Hãy vẽ sơ đồ khối, bảng chân trị,  code Verilog (Design và Testbench), chụp hình dạng sóng Testbench. Tạo từng folder riêng và nộp làm ASM môn ADCA.

1. Half Adder
2. Full adder
3. Half subtract
4. Full subtract
5. 4:1 MUX
6. 1:4 DEMUX
7. Encoder 4 to 2
8. Decoder 2 to 4
9. SR flip-flop
10. JK flip-flop
11. D flip-flop – asynchronous
12. D flip-flop – synchronous
13. T flip flop
14. Counter 4-bit - Ripple Carry (Asynchronous)
15. 4-bit Synchronous Up Counter
16. RAM - asynchronous
17. RAM - synchronous
18. Pipeline CPU
19. ADC

## EXAM

Hãy thiết kế HDL (Verilog Design và Testbench) bộ ALU (Arithmetic Logic Unit) 4 bit, và triển khai trên PYNQ-Z2 hiển thị kết quả số đã tính được trên LED 7 đoạn anode 4 digital (nếu âm thì có dấu trừ, và hiển thị đúng vị trí số như hàng trăm, chục, đơn vị) khi nhập dữ liệu input từ 2 switch 4-bit là toán tử để thực hiện tính toán A và B. ALU thực hiện phép tính toán hạng (cộng - trừ) và phép tính logic (AND - OR) được lựa chọn bởi opcode switch (2-bit).

- Dùng 2 switch 4-bit nhập 2 toán hạng (A, B).
- Dùng thêm switch để chọn phép toán (+, −, AND, OR).
- Kết quả hiển thị trên LED 7-seg (có dấu trừ nếu kết quả âm).

Bạn hãy dựa vào những tài liệu mà tui đã cho bạn đọc hiểu về PYNQ-Z2 đến từ 0 đến 9999, bạn hãy dựa vào nó mà làm theo nó sẽ dễ hơn rất nhiều khi bạn cố gắng tạo logic phức tạp không cần thiết. Bạn hãy thiết kế cơ bản dễ hiểu trước.
