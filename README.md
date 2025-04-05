## About

This is an audio analysis multitool that runs on a [Nexys Video](https://digilent.com/shop/nexys-video-artix-7-fpga-trainer-board-for-multimedia-applications/) board, 
supporting live waveform, pitch graph, and spectrogram displays over HDMI. Developed with Vivado
2018.3.

This was our course project for ECE532 - Digital Systems Design.

## Authors

* Matthew Stewart ([Github](https://github.com/Stewmath))
* Daniel Strapp ([Github](https://github.com/Dan2100))
* Adam Pietrewicz ([Github](https://github.com/pietrea2))
* Peishuo Cai ([Github](https://github.com/PeishuoCai))

## Python scripts

There are a number of python scripts in the ***python_tools/*** directory.

* Software pitch detection algorithms:
    * detect\_pitch\_amdf.py: AMDF-based pitch detector.
    * detect\_pitch\_cepstrum.py: Cepstrum-based pitch detector.
    * detect\_pitch\_fft.py: FFT-based pitch detector.
    * pitch\_tester.py: Tries to guess the pitch of a .wav file using one of the above 3 algortihms.
    * pitch\_over\_time.py: Plots the pitch over time of a .wav file using one of the algorithms.
* For cepstrum testbench:
    * cepstrum\_tb\_gen\_input.py: Read a .wav file, generate a file for the cepstrum testbench to
      read as input (default: "/home/matthew/tb\_input.txt")
    * cepstrum\_tb\_plot.py: Plots the output of the cepstrum testbench (default:
      "/home/matthew/tb\_output.txt"), compare against a software-generated calculation.
* .mem file generators:
    * gen\_ln\_table\_mem.py: Generates the ln table used by the pitch graph verilog module.
    * pitch\_graph\_background\_gen.py: Generates the background image used by the pitch graph verilog
      module.
    * wav\_to\_mem.py: Converts a .wav file to a .mem file (16-bit signed samples) that could be
      imported for use in a testbench.
* Misc:
    * common.py: Common stuff used by scripts.
    * filter.py: Script used for testing the effect of filters on a .wav file.
    * sound\_gen.py: Generates .wav files of square or sine waves at a particular pitch.
