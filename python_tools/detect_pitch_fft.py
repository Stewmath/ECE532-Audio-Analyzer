# Takes the peak of the FFT of the signal as the frequency.
#
# I think this is fundamentally flawed. It works on sine waves, but otherwise there's no guarantee
# that the dominant frequency is the same as the fundamental frequency. IE. We'll get the wrong
# octave often.
#
# But the fundamental frequency should probably also show a peak on the graph, just a lower peak. So
# maybe some heuristics could be used like with AMDF.

import numpy as np
import matplotlib.pyplot as plt

def get_frequency(audio, win_start, win_size):
    fourier = np.fft.fft(audio.frames[win_start : win_start + win_size])
    fourier = np.absolute(fourier) # Not considering negative frequencies(?)

    # Only consider first half (TODO: Something to do with nyquist frequency? Don't really get it)
    fourier = fourier[0 : len(fourier) // 2]

    #xaxis = np.array(range(len(fourier))) * audio.sample_rate / win_size
    #plt.plot(xaxis, fourier)
    #plt.show()

    bestI = None
    best = 0

    for i in range(len(fourier)):
        if fourier[i] > best:
            best = fourier[i]
            bestI = i * (audio.sample_rate / win_size)

    threshold = 0.1 * audio.max_sample_value

    if best < threshold:
        return None

    return bestI
