# ------------------------------ Q1.10.10 ➜ 位元字串 / 十六進位 ------------------------------
FRAC_BITS  = 10                 # 小數位數
TOTAL_BITS = 1 + 10 + 10        # = 21 位
FULL_SCALE = 1 << TOTAL_BITS    # 2^21

def float_to_q1_10_10(val: float) -> tuple[str, str]:
    """浮點 ➜ Q1.10.10（二補數）"""
    raw = int(round(val * (1 << FRAC_BITS)))   # 放大
    if raw < 0:                                # 轉二補數
        raw = FULL_SCALE + raw
    raw &= FULL_SCALE - 1                      # 只留 21 位
    return format(raw, f'0{TOTAL_BITS}b'), hex(raw)

# ------------------------------ 範例 ------------------------------
#print(float_to_q1_10_10(25.625))   # ('000000110011010000000', '0x6680')
#print(float_to_q1_10_10(-3.125))   # ('111111111001110000000', '0x1ff380')
print(float_to_q1_10_10(1))
