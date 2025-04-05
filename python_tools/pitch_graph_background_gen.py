#!/usr/bin/python3
#
# Generates background image for verilog image drawer module.

from PIL import Image, ImageDraw, ImageFont
import math

# Constants that should match values in draw_pitch_graph.sv

SCREEN_WIDTH = 640
SCREEN_HEIGHT = 480

MIN_FREQUENCY = 100
MAX_FREQUENCY = 1024

MIN_FREQ_LN = math.log(MIN_FREQUENCY)
MAX_FREQ_LN = math.log(MAX_FREQUENCY)

CHART_START_Y = 0
CHART_END_Y = SCREEN_HEIGHT - 1

BACKGROUND_COLOR = (250, 243, 230)
LINE_COLOR = (180, 180, 180)
TEXT_COLOR = "black"
TEXT_SIZE = 10
TEXT_FONT = ImageFont.truetype("Hack-Bold.ttf", TEXT_SIZE)

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

# Sort the notes by frequency, as a list of tuples
NOTE_FREQS_SORTED = sorted(NOTE_FREQS.items(), key=lambda v: v[1])

# Create a blank white image
img = Image.new("RGB", (640, 480), color="white")

# Create a drawing context
draw = ImageDraw.Draw(img)

# Background color
draw.rectangle([(0, 0), (SCREEN_WIDTH, SCREEN_HEIGHT)], fill=BACKGROUND_COLOR)

notes_to_draw = []
for (note, freq) in NOTE_FREQS_SORTED:
    y = (math.log(freq) - MIN_FREQ_LN) * ((CHART_END_Y - CHART_START_Y) / (MAX_FREQ_LN - MIN_FREQ_LN))
    y = -y + CHART_END_Y
    #print(freq, y)

    if y >= 0 and y < SCREEN_HEIGHT:
        notes_to_draw.append((note, y))

notes_to_draw = sorted(notes_to_draw, key=lambda x: x[1])


# Draw the lines
last_note_y = None
note_dist = notes_to_draw[1][1] - notes_to_draw[0][1]
print(note_dist)
for (note, note_y) in notes_to_draw:
    if not (last_note_y is None):
        line_y = (note_y + last_note_y) / 2
        draw.line([(0, line_y), (SCREEN_WIDTH, line_y)], fill=LINE_COLOR)

    text_height = TEXT_FONT.getbbox("A")[3]
    text_y = (note_y - note_dist / 2)
    draw.text((0, text_y), note, fill=TEXT_COLOR, font=TEXT_FONT)

    last_note_y = note_y



# Save the image to a file
img.save("pitch_graph_background.png")

# Also output individual pixels to .mem file which can be loaded into vivado
f = open("pitch_graph_background.mem", 'w')
for y in range(SCREEN_HEIGHT):
    for x in range(SCREEN_WIDTH):
        (r, g, b) = img.getpixel((x, y))
        s = ''
        for v in (r, g, b):
            s += hex(v)[2:]
        s += '00'
        f.write(s + '\n')

f.close()
