# Pitch detection candidate: Using AMDF (average magnitude difference function)
#
# This brute-forces a range of periods (P) and calculates the average difference between samples at
# sample[i] and sample[i + P]. If the period is correct this value should be very low.
#
# Taking the lowest point of the AMDF seems to reliably detect the correct note, but the octave is
# sometimes too low (doubled/quadrupled period). Some heuristics are needed to correct that.
#
# Doesn't seem to work well with square waves. That's fine, those are highly artificial anyway.

import sys
import numpy as np
import math
import matplotlib.pyplot as plt

import common

# Min/max frequencies to detect (large ranges degrade performance)
MIN_FREQ = 100
MAX_FREQ = 5000

SAMPLE_MAX = 65535 // 2

# AMDF values below this are accepted as the correct period/frequency
HARMONIC_THRESHOLD = SAMPLE_MAX * 0.05

# Average AMDF (among all period choices) should be at least this much to consider any note as being
# played. (Basically a volume check. Probably not the best way to do this.)
# If we're detecting the wrong octaves at low volumes, increase this to make it less permissive
# (will ignore the note instead).
DETECT_THRESHOLD = SAMPLE_MAX * 0.05

# N = window size
def amdf(frames, N):
    assert(len(frames) >= N * 2)

    retval = np.array(N)

    total = 0
    for i in range(N):
        total += math.fabs(frames[i] - frames[i + N])

    return total / N

def plot_amdf(frames, start, end):
    x = range(start, end)
    y = [amdf(frames, v) for v in x]
    plt.plot(x, y)
    plt.show()


# Calculate fundamental frequency along given samples
def get_frequency(audio, win_start, win_size):
    # Range of period values to check
    max_period = int(audio.sample_rate / MIN_FREQ)
    min_period = int(audio.sample_rate / MAX_FREQ)

    frames = audio.frames[win_start : win_start + max_period * 2]

    if len(frames) < max_period * 2:
        # Need at least 2 full cycles to calculate the AMDF
        print('AMDF: WARN: get_frequency called without 2 cycles of data')
        return None

    #print((min_period, max_period))

    bestP = 0
    bestPVal = 100000
    avg_amdf = 0

    #plot_amdf(frames, min_period, max_period)

    for p in range(min_period, max_period):
        val = amdf(frames, p)
        #print(val)
        if val < bestPVal:
            bestP = p
            bestPVal = val
        avg_amdf += val

    avg_amdf /= len(range(min_period, max_period))

    if avg_amdf < DETECT_THRESHOLD:
        return None

    if bestP == 0:
        print('Failed to get frequency')
        assert(False)

    #print((bestP, bestPVal))

    # Simply picking the lowest value from amdf doesn't appear to be enough. If the actual period is
    # P, it might instead pick up 2P, 4P, etc. Check if there's any lower period that works.
    while bestP // 2 > min_period:
        val = amdf(frames, bestP // 2)
        if abs(val - bestPVal) < HARMONIC_THRESHOLD:
            bestP //= 2
        else:
            break

    return audio.sample_rate / bestP


if __name__ == "__main__":
    if len(sys.argv) >= 2:
        audio_in_file = sys.argv[1]
    else:
        audio_in_file = 'output.wav'

    audio = common.open_wave_file(audio_in_file)

    print(get_frequency(audio))

    #w = 0
    #plot_amdf(frames[w : w + max_period * 2], min_period, max_period)
