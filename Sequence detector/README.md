# Sequence Detector (1011) using Verilog

## Overview

This project implements a **Moore Finite State Machine (FSM)** that detects the binary sequence **1011** with overlapping sequence detection.

## Features

- Moore FSM implementation
- Overlapping sequence detection
- Synchronous operation
- Asynchronous reset
- GTKWave simulation support

## Inputs

| Signal | Description |
|--------|-------------|
| clk | Clock |
| reset | Reset |
| x | Serial Input |

## Output

| Signal | Description |
|--------|-------------|
| y | Sequence Detected |

## Detected Sequence

```
1011
```

## State Diagram

| State | Description |
|-------|-------------|
| S0 | Initial State |
| S1 | Received 1 |
| S2 | Received 10 |
| S3 | Received 101 |
| S4 | Sequence 1011 Detected |

## Project Files

- `sequence_detector.v` – Verilog source code
- `sequence_detector_tb.v` – Testbench
- `sequence_detector.vcd` – Waveform file
- `simulation_result.png` – GTKWave screenshot

## Simulation

Compile:

```bash
iverilog -o seq sequence_detector.v sequence_detector_tb.v
```

Run:

```bash
vvp seq
```

Open waveform:

```bash
gtkwave sequence_detector.vcd
```

## Applications

- Digital communication
- Pattern recognition
- Data synchronization
- Network packet detection
- Embedded system 