def float_to_q1_10_5(val):
    scale = 2 ** 5
    raw = int(round(val * scale))  # 乘上小數精度
    if raw < 0:
        raw = (1 << 16) + raw       # 轉二補數
    return format(raw, '016b'), hex(raw)

# 使用範例
print(float_to_q1_10_5(25.625)) #('0000001100110100', '0x334')
print(float_to_q1_10_5(-3.125)) #('1111111110011100', '0xff9c')
