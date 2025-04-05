# Takes a wav file as argv[1], shows a graph of its pitch over time.

# Pick one
#from detect_pitch_fft import get_frequency
#from detect_pitch_amdf import get_frequency
from detect_pitch_cepstrum import get_frequency

import common

import matplotlib.pyplot as plt
import sys


WINDOW_TIME = 0.025 # Seconds

def get_audio_pitches(audio):
    window_size = int(audio.sample_rate * WINDOW_TIME)

    pitch_array = []
    w = 0
    while len(audio.frames) - w >= window_size:
        val = get_frequency(audio, w, window_size)
        pitch_array.append(val)
        w += window_size

    return pitch_array

#plt.subplot(1, 2, 1)
pitches = get_audio_pitches(common.open_wave_file(sys.argv[1]))
plt.plot(pitches)
plt.xlabel("time")
plt.ylabel("frequency")
plt.show()
