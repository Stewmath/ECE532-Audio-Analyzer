import numpy as np
import matplotlib.pyplot as plt

# Ignore peaks before this sample # in quefrency
MIN_THRESHOLD = 20

# Ignore fourier values above this
# This should be well above the maximum base frequency we want to detect, as we're taking the FFT of
# the FFT, so we need a couple repetitions to detect the harmonics
FOURIER_MAX_FREQ = 5000

def get_frequency(audio, win_start, win_size):
    sample = audio.frames[win_start : win_start + win_size]
    fourier = np.fft.fft(sample)
    fourier = np.absolute(fourier) # Not considering negative frequencies(?)

    # Only consider first half (TODO: Something to do with nyquist frequency? Don't really get it)
    fourier = fourier[0 : FOURIER_MAX_FREQ]

    lf = np.log(fourier)

    # TODO: Filter inf, -inf values? (FFT fails if any of these exist)

    cepstrum = np.fft.fft(lf)
    cepstrum = np.absolute(cepstrum)

    #freq_xaxis = np.array(range(len(fourier))) * audio.sample_rate / win_size
    #plt.plot(sample)
    #plt.show()
    #plt.plot(freq_xaxis, fourier)
    #plt.show()
    #plt.plot(freq_xaxis, lf)
    #plt.show()
    #plt.plot(cepstrum)
    #plt.show()

    period = np.argmax(cepstrum[MIN_THRESHOLD:len(cepstrum)//2]) + MIN_THRESHOLD
    freq = audio.sample_rate / period
    return freq
