import wave as wv
import numpy as np
import math
import matplotlib.pyplot as plt

SAMPLE_FREQ = 44100
MAX_VOL = 65535 // 2
MIN_VOL = -65535 // 2

NOTE_FREQS = {
        'C0': 16.35, 'C1': 32.7, 'C2': 65.41, 'C3': 130.81, 'C4': 261.63, 'C5': 523.25, 'C6': 1046.5, 'C7': 2093, 'C8': 4186,
        'C#0': 17.32, 'C#1': 34.65, 'C#2': 69.3, 'C#3': 138.59, 'C#4': 277.18, 'C#5': 554.37, 'C#6': 1108.73, 'C#7': 2217.46, 'C#8': 4434.92,
        'D0': 18.35, 'D1': 36.71, 'D2': 73.42, 'D3': 146.83, 'D4': 293.66, 'D5': 587.33, 'D6': 1174.66, 'D7': 2349.32, 'D8': 4698.63,
        'D#0': 19.45, 'D#1': 38.89, 'D#2': 77.78, 'D#3': 155.56, 'D#4': 311.13, 'D#5': 622.25, 'D#6': 1244.51, 'D#7': 2489, 'D#8': 4978,
        'E0': 20.6, 'E1': 41.2, 'E2': 82.41, 'E3': 164.81, 'E4': 329.63, 'E5': 659.25, 'E6': 1318.51, 'E7': 2637, 'E8': 5274,
        'F0': 21.83, 'F1': 43.65, 'F2': 87.31, 'F3': 174.61, 'F4': 349.23, 'F5': 698.46, 'F6': 1396.91, 'F7': 2793.83, 'F8': 5587.65,
        'F#0': 23.12, 'F#1': 46.25, 'F#2': 92.5, 'F#3': 185, 'F#4': 369.99, 'F#5': 739.99, 'F#6': 1479.98, 'F#7': 2959.96, 'F#8': 5919.91,
        'G0': 24.5, 'G1': 49, 'G2': 98, 'G3': 196, 'G4': 392, 'G5': 783.99, 'G6': 1567.98, 'G7': 3135.96, 'G8': 6271.93,
        'G#0': 25.96, 'G#1': 51.91, 'G#2': 103.83, 'G#3': 207.65, 'G#4': 415.3, 'G#5': 830.61, 'G#6': 1661.22, 'G#7': 3322.44, 'G#8': 6644.88,
        'A0': 27.5, 'A1': 55, 'A2': 110, 'A3': 220, 'A4': 440, 'A5': 880, 'A6': 1760, 'A7': 3520, 'A8': 7040,
        'A#0': 29.14, 'A#1': 58.27, 'A#2': 116.54, 'A#3': 233.08, 'A#4': 466.16, 'A#5': 932.33, 'A#6': 1864.66, 'A#7': 3729.31, 'A#8': 7458.62,
        'B0': 30.87, 'B1': 61.74, 'B2': 123.47, 'B3': 246.94, 'B4': 493.88, 'B5': 987.77, 'B6': 1975.53, 'B7': 3951, 'B8': 7902.13
        }

def create_wavfile(frames):
    wave = wv.open('output.wav', 'wb')

    wave.setnchannels(1)
    wave.setframerate(SAMPLE_FREQ)
    wave.setsampwidth(2)
    wave.setnframes(len(frames))
    to_write = bytearray()
    for b in frames:
        to_write.append(b & 0xff)
        to_write.append((b >> 8) & 0xff)
    wave.writeframesraw(to_write)

    wave.close()

def gen_square_wave(sample_freq, wave_freq, seconds):
    num_frames = int(seconds * SAMPLE_FREQ)
    frames = []

    time = 0
    value = MIN_VOL
    next_flip = 1.0 / wave_freq
    for i in range(num_frames):
        frames.append(value)
        time += 1.0 / SAMPLE_FREQ
        if time >= next_flip:
            if value == MIN_VOL:
                value = MAX_VOL
            else:
                value = MIN_VOL
            next_flip += 1.0 / wave_freq

    return frames


def gen_sine_wave(sample_freq, wave_freq, seconds):
    num_frames = int(seconds * SAMPLE_FREQ)
    frames = []

    for i in range(num_frames):
        value = math.sin(i * math.pi * 2 / SAMPLE_FREQ * wave_freq)
        value *= MAX_VOL
        value = int(value)
        assert(value >= MIN_VOL and value <= MAX_VOL)
        frames.append(value)

    return frames


def write_scale():
    frames = []
    for note in ['C4', 'D4', 'E4', 'F4', 'G4', 'A4', 'B4', 'C5']:
        freq = NOTE_FREQS[note]
        frames.extend(gen_sine_wave(SAMPLE_FREQ, freq, 0.25))

    create_wavfile(frames)

def plot_fourier(frames):
    fourier = np.fft.fft(frames)
    fourier = np.absolute(fourier) # Not considering negative frequencies(?)
    #print(fourier)
    #plt.xlim(-50000, 50000)
    plt.plot(fourier[0:len(fourier)])
    plt.show()


frames = gen_square_wave(SAMPLE_FREQ, NOTE_FREQS['A4'], 10)
plot_fourier(frames)
create_wavfile(frames)

#write_scale()
