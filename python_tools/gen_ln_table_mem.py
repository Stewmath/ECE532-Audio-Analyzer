#!/usr/bin/python3
# Generates ln_table used for gfx stuff. ln_table[i] = ln(i) in 24.8 fixed-point format.
import math

f = open('ln_table.mem', 'w')
f.write("0\n") # ln(0) undefined, just put a placeholder
for i in range(1,10000):
    f.write(hex(int(math.log(i) * 256))[2:])
    f.write("\n")
f.close()
