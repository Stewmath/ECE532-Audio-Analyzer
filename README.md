## About

This is an audio analysis multitool that runs on a [Nexys Video](https://digilent.com/shop/nexys-video-artix-7-fpga-trainer-board-for-multimedia-applications/) board, 
supporting live waveform, pitch graph, and spectrogram displays over HDMI. Developed with Vivado
2018.3.

This was our course project for ECE532 - Digital Systems Design.

See it in action: https://www.youtube.com/watch?v=KJVU2bFoxcI

## Authors

* Matthew Stewart ([Github](https://github.com/Stewmath))
* Daniel Strapp ([Github](https://github.com/Dan2100))
* Adam Pietrewicz ([Github](https://github.com/pietrea2))
* Peishuo Cai ([Github](https://github.com/PeishuoCai))

## Usage

Connect the following peripherals to the Nexys Video board:

* A USB keyboard supporting PS/2 fallback mode (may need an older keyboard)
* An audio input source:
    * A mic (to mic input jack), or
    * (Preferably) A direct connection to the line-in jack
* An audio output device connected to the headphone jack

Keyboard controls:
* 1: Switch to waveform display
* 2: Switch to pitch graph display
* 3: Switch to spectrogram display
* m: Switch to mic input
* l: Switch to line input
* up: Increase audio input amplification
* down: Decrease audio input amplification
* [: Decrease audio output level
* ]: Increase audio output level
* Backspace: Reset pitch graph or spectrogram

In pitch graph mode:
* Enter: Begin or pause pitch recording
* Space: Play back recorded pitch graph in the form of square waves

## Design Tree

```
audio_analyzer
├── 3rd_party_files
│   └── myI2STx_v1_0.v
├── audio_analyzer.sdk
│   ├── design_1_wrapper.hdf
│   ├── design_1_wrapper_hw_platform_1 // Hardware platform
│   ├── hdmi_bsp_2 // Board support package (auto-generated)
│   └── main
│	   ├── Debug
│	   └── src	// C Source files are here
├── audio_analyzer.srcs
│   ├── constrs_1
│   │   └── imports
│   │   	└── new
│   │       	└── hdmi.xdc // Constraints file
│   └── sources_1
│   	├── bd
│   	│   └── design_1 // Top-level block diagram
│   	├── imports
│   	└── ip_repo // Generated files from IP blocks
├── audio_analyzer.xpr
├── examples
│   └── video_testbench.sv
├── ip_repo
│   ├── axis_splitter // AXI Stream splitter module
│   ├── cepstrum_ip   // Cepstrum pitch detector module
│   ├── keyboard_ip   // Keyboard input module
│   ├── myI2STx_1.0   // I2S module
│   └── video_system  // Video module
├── python_tools  // Miscellaneous python scripts
└── README.md
```

Top-level folders:
* 3rd\_party\_files: Contains the original version of the I2S module that we found online.
* audio\_analyzer.sdk: Contains C source files for the microblaze.
* audio\_analyzer.srcs: Contains the vivado project, consisting mostly of one large block design which uses custom IP blocks from the ip\_repo directory.
* examples: Contains a standalone video testbench, based on the one in our “video\_system” submodule, that can be used to help develop verilog-based graphics.
* ip\_repo: Sources for the IP blocks that are imported into the main project. All of our custom verilog code is here, along with the 3rd-party code we used.
* python\_tools: Miscellaneous python scripts used for research and to support development of the verilog modules.
