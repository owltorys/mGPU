def q1_10_5_to_float(val):
    """
    Convert a 16‑bit Q1.10.5 fixed‑point value to a signed float.
    
    Parameters
    ----------
    val : str | int
        - Binary string  e.g. '0000001100110100'
        - Hex string     e.g. '0x334' or '334'
        - Integer        e.g. 0x334 or 0b1100110100

    Returns
    -------
    float
        The signed decimal value.
    """
    # --- 1. 先轉成整數 ---
    if isinstance(val, str):
        val = val.strip()
        if val.lower().startswith("0x"):              # hex 字串
            raw = int(val, 16)
        elif all(ch in "01" for ch in val):           # binary 字串
            raw = int(val, 2)
        else:                                         # 純數字字串
            raw = int(val)
    else:                                             # 已經是 int
        raw = int(val)

    # --- 2. 判斷符號 (二補數) ---
    if raw & (1 << 15):        # 若最高位 (bit15) 為 1 → 負數
        raw_signed = raw - (1 << 16)
    else:                      # 否則為正數
        raw_signed = raw

    # --- 3. 還原小數部分 ---
    scale = 2 ** 5             # Q1.10.5 → 小數有 5 bits
    return raw_signed / scale

#使用介紹
#print(q1_10_5_to_float('0000001100110100'))  # ➜ 25.625
#print(q1_10_5_to_float('1111111110011100'))  # ➜ -3.125
#print(q1_10_5_to_float(0x334))               # ➜ 25.625
#print(q1_10_5_to_float(0xFF9C))              # ➜ -3.125
print(q1_10_5_to_float(0xFFF5))
