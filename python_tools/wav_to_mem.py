#!/usr/bin/python3
# Convert a .wav file to a raw .mem file which can be loaded in a vivado testbench.
# Each output line is a signed 16-bit audio sample.

import sys
import common

in_file = sys.argv[1]
out_file = sys.argv[2]

audio = common.open_wave_file(in_file)

f = open(out_file, 'w')
for s in audio.frames:
    f.write(hex(int(s) & 0xffff)[2:])
    f.write("\n")
f.close()
