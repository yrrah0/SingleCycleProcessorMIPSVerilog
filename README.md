

# Simple Single-Cycle MIPS Processor in SystemVerilog

## Overview

This project is a learning exercise to design and simulate a simple single-cycle MIPS processor using SystemVerilog. It supports multiple different instructions: ADD, SUB, AND, OR, SLT, LW, SW, BEQ, BNE, and Jump.
Coded in mostly structural modeling.

## Project Details

- **Development Lanuage**: SystemVerilog
- **Simulation Platform**: Altera Cyclone IV DE2 board
- **Development Tool**: Quartus II 13sp.01

## Features
- **Instruction Set**:
  - Add: `000000`
  - Sub: `000001`
  - And: `000010`
  - Or: `000011`
  - Lw: `000100`
  - Sw: `000101`
  - BEQ: `000110`
  - BNE: `000111`
  - Jump: `001000`
  - SLT: `001001`
- **Datapath**:
  - 8-bit operations
  - Instruction memory: 32 bits, 256 words
  - Data memory: 8 bits, 32 words

## Prerequisites

- Quartus II 13sp.01 (or compatible version)

## Getting Started

1. **Add Files to Quartus II**:
   - Create a new project in Quartus II.
   - Add all Verilog source files to the project.
2. **Compile the Project**:
   - Set the top-level entity.
   - Compile the project.
3. **Run the Simulation**:
   - Open the top-level waveform file.
   - Run the simulation to see the results of the simple commands.

## Testing

The top-level waveform runs a set of simple commands to test:
- Loading and storing (Lw, Sw)
- Branching and jumping (BEQ, BNE, Jump)
- R-type operations (Add, Sub, And, Or)

## License

This project is open-source and available for educational and personal use.
