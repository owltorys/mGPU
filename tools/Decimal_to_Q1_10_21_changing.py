def float_to_q1_10_21(val: float):
    """
    十進位 ➜ Q1.10.21（二補數 32‑bit）
    符號 1 bit、整數 10 bit、⼩數 21 bit
    """
    SCALE = 1 << 21            # 2^21 ＝ 2 097 152
    raw = int(round(val * SCALE))

    # 範圍檢查（可視需要打開）
    min_int, max_int = -1024, 1023 + (SCALE - 1) / SCALE
    if not (min_int <= val <= max_int):
        raise ValueError(f"超出 Q1.10.21 可表達範圍 {min_int}…{max_int}")

    # 若為負數，轉成 32‑bit 二補數
    if raw < 0:
        raw = (1 << 32) + raw

    return format(raw, '032b'), hex(raw)

# ─── 使用範例 ───
print(float_to_q1_10_21(25.625))
# ('00000011001101000000000000000000', '0x3340000')

print(float_to_q1_10_21(-3.125))
# ('11111111100111000000000000000000', '0xff9c0000')

print(float_to_q1_10_21(-10))
# ('11111110110000000000000000000000', '0xfec00000')