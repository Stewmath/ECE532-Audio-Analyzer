# Tests the "get_frequency" function of another .py file

# Pick one
#from detect_pitch_fft import get_frequency
#from detect_pitch_amdf import get_frequency
from detect_pitch_cepstrum import get_frequency

import common

WINDOW_TIME = 0.025 # Seconds


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


# Returns (x, y) as a plottable function:
# x[i]: Sample offset (x[i] / SAMPLE_RATE = time in seconds)
# y[i]: Detected frequency at that time
def get_frequencies(audio):
    x = []
    y = []

    window_size = int(audio.sample_rate * WINDOW_TIME)

    w = 0
    while len(audio.frames) - w >= window_size:
        val = get_frequency(audio, w, window_size)
        print(f'{w/audio.sample_rate}: {val}')

        x.append(w)
        y.append(val)

        w += window_size

    return (x, y)


# Assumes the last characters of the filename are the expected note
def expected_note_from_filename(filename):
    i = filename.rindex('_')
    j = filename.rindex('.')
    note = filename[i+1 : j].upper()
    assert(note in NOTE_FREQS)
    return note


# Input: frequency, output: closest note to that frequency
def closest_note(frequency):
    closestNote = None
    closestDist = 500000

    for note in NOTE_FREQS:
        freq = NOTE_FREQS[note]
        dist = abs(frequency - freq)
        if dist < closestDist:
            closestNote = note
            closestDist = dist
    return closestNote


# Reads a .wav file, checks if at least 80% of detected notes are the expected note
def test_file_note(filename, expected_note):
    audio = common.open_wave_file(filename)

    (x, y) = get_frequencies(audio)

    # Filter out "None" elements (no pitch detected at all)
    y = list(filter(lambda v: v is not None, y))

    # Get the ratio of correct predictions in the wavefile
    correct_ratio = sum((1 if v is not None and closest_note(v) == expected_note else 0 for v in y)) / len(y)
    return correct_ratio >= 0.8

def test_all(files):
    for f in files:
        expected = expected_note_from_filename(f)
        b = test_file_note(f, expected)
        if b:
            print(f'{f}: OK')
        else:
            print(f'{f}: ERR')

if __name__ == "__main__":
    test_all(["test_wav/piano_c4.wav"])
    test_all(["test_wav/piano_c6.wav"])
    #test_all(["test_wav/square_a4.wav"])
    #test_all(["test_wav/sine_a4.wav"])
