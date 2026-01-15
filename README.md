# FPGA-Sequential-Logic-7-Segment-Controller
# FPGA Sequential Logic & 7-Segment Display Controller

This project implements a Verilog-based sequential logic design for driving a
4-digit 7-segment display on a Xilinx Spartan-3E FPGA.

## Features
- Clock division from 16 MHz system clock
- Counters and shift registers for digit multiplexing
- Reset synchronization
- Active-low display control signals

## Verification
- RTL testbench used to verify counter behavior, reset logic, and sequencing
- Waveform-based debugging performed before hardware deployment

## Hardware
- FPGA: Xilinx Spartan-3E (xc3s250E)
- Tools: Xilinx ISE, JTAG

## How to Run
1. Open project in Xilinx ISE
2. Simulate using the provided testbench
3. Synthesize and program FPGA via JTAG

## Learning Outcomes
- Synchronous digital design
- RTL simulation and debugging
- FPGA bring-up and timing-aware logic design
