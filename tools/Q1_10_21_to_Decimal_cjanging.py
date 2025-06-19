def q1_10_21_to_float(raw_val):
    """
    Q1.10.21 ➜ float
      • 接受 32‑bit 二補數：可傳 int、0x... 十六進位字串、或 32 位元二進位字串
      • 回傳 Python float
    """
    # ── 1. 取得整數形式 ──
    if isinstance(raw_val, str):
        raw_val = raw_val.strip()
        if raw_val.startswith(("0x", "0X")):          # 十六進位字串
            raw = int(raw_val, 16)
        elif set(raw_val) <= {"0", "1"}:              # 純二進位字串
            raw = int(raw_val, 2)
        else:
            raise ValueError("字串格式請用 0x.. 或 32‑bit 二進位")
    else:
        raw = int(raw_val)                            # 已是整數

    # ── 2. 還原符號 (32‑bit 二補數) ──
    if raw & (1 << 31):                               # 若最高位 = 1 ➜ 負數
        raw -= 1 << 32

    # ── 3. 除以 2^21 取得真正數值 ──
    return raw / float(1 << 21)

# 使用範例
#print(q1_10_21_to_float(0x3340000))      # 25.625
#print(q1_10_21_to_float("11111111100111000000000000000000"))  # -3.125
#print(q1_10_21_to_float(0xff9c0000))     # -3.125
print(q1_10_21_to_float(0xfec00000))     # -10.0