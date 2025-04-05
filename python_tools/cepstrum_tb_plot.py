# Reads & graphs output from testbench.
# Note: Cepstrum testbench uses floats, while gfx module testbench uses s16 integers.
# Need to tweak this dependin on the case.

import struct
import numpy as np
import matplotlib.pyplot as plt

import common

_b32 = 1 << 32
_b64 = 1 << 64

#def float_to_ieee754(float_list):
#    ieee754_list = [struct.unpack('>I', struct.pack('>f', num))[0] for num in float_list]
#    return ieee754_list

def ieee754_to_float(v):
    return struct.unpack('>f', struct.pack('>I', v))[0]

def gen_sine_wave(sample_freq, wave_freq, seconds):
    num_frames = int(seconds * sample_freq)
    frames = []

    for i in range(num_frames):
        value = math.sin(i * math.pi * 2 / sample_freq * wave_freq)
        #value *= MAX_VOL
        #value = int(value)
        #assert(value >= MIN_VOL and value <= MAX_VOL)
        frames.append(value)

    return frames

# Read either a .mem file or something output from one of the testbenches into an array of values
# (one per line)
def read_file_array(filename, is_hex=False, is_float=False):
    array = []
    f = open(filename, 'r')
    for line in f.readlines():
        if is_hex:
            num = int(line.strip(), 16)
        else:
            num = int(line.strip())

        # Assuming signed 16-bit numbers
        #if num > 0x8000:
        #    num = 0x8000 - (num & 0x7fff)
        #    #num = -0x10000 + num

        if is_float:
            array.append(ieee754_to_float(num))
        else:
            array.append(num)
    return array


# Output file created by simulation
array = read_file_array("/home/matthew/tb_output.txt")
print([hex(x) for x in array])

# Graph from verilog
plt.subplot(1, 2, 1)
plt.plot(array)

# Graph from our data
#audio = common.open_wave_file("test_wav/pachelbel_canon.wav")
#samples = audio.frames[:1024]
samples = read_file_array("test_wav/pachelbel_canon_fragment.mem", is_hex=True)[:1024]

fourier = np.fft.fft(samples)
fourier = fourier[:len(fourier)]
fourier = np.absolute(fourier)
abslog = np.log(fourier)
abslog = [0 if v == -np.inf else v for v in abslog]
#print(list(abslog))
fft2 = np.absolute(np.fft.fft(abslog))

plt.subplot(1, 2, 2)
plt.plot(fourier)
plt.show()
