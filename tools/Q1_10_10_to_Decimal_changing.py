def q1_10_10_to_float(raw):
    """
    將 Q1.10.10 格式的數值轉換成浮點數。
    
    支援 int 或 str ('0x...' 或二進位 '1010...') 輸入。
    """
    TOTAL_BITS = 21
    FRAC_BITS = 10

    # 字串轉為整數
    if isinstance(raw, str):
        if raw.startswith('0x'):
            raw = int(raw, 16)
        else:
            raw = int(raw, 2)

    # 二補數轉換
    if raw & (1 << (TOTAL_BITS - 1)):
        raw -= (1 << TOTAL_BITS)

    return raw / (1 << FRAC_BITS)

# 🧪 測試範例
print(q1_10_10_to_float('0x6680'))     # ➜ 25.625
print(q1_10_10_to_float('0x1ff9c0'))   # ➜ -3.125
print(q1_10_10_to_float('000000110011010000000'))  # ➜ 25.625（二進位）