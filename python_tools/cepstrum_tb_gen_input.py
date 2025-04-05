import struct
import numpy as np
import matplotlib.pyplot as plt
import wave

import common

NUM_SAMPLES = 1026

def float_to_ieee754(num):
    return struct.unpack('>I', struct.pack('>f', num))[0]

audio = common.open_wave_file("test_wav/square_a4.wav")

# Input file for simulation
f = open("/home/matthew/tb_input.txt", 'w')

for i in range(NUM_SAMPLES):
    f.write(f'{float_to_ieee754(audio.frames[i])}\n')

f.close()
