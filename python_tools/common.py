import wave
import numpy as np
import struct


# Represents a decoded .wav file
class Audio:
    def __init__(self, frames, sample_rate, sample_width):
        self.frames = frames
        self.sample_rate = sample_rate
        self.sample_width = sample_width

        self.max_sample_value = 65535 // 2
        self.min_sample_value = -65535 // 2


def open_wave_file(filename):
    audio = wave.open(filename)
    num_frames = audio.getnframes()
    sample_rate = audio.getframerate()
    sample_width = audio.getsampwidth()
    frames = np.zeros(num_frames)

    assert(sample_width == 2)
    assert(audio.getnchannels() == 1)

    for i in range(num_frames):
        wdata = audio.readframes(1)
        data = struct.unpack("<h", wdata)
        frames[i] = int(data[0])

    return Audio(np.array(frames), sample_rate, sample_width)
