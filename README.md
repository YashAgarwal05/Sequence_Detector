# Sequence Detector (Verilog)

## Introduction

A **Sequence Detector** is a digital circuit designed to detect a specific pattern of bits in a serial input stream. It is commonly implemented using a **Finite State Machine (FSM)**, where the circuit transitions between states based on the input data.

In this project, a **sequence detector** is implemented using **Verilog HDL**. The design processes a serial input bit stream synchronized to a clock and generates an output signal whenever the desired sequence is detected. A counter is also used to keep track of the number of detected sequences.

---

## Sequence Detection Concept and Timing

The sequence detector operates synchronously with the clock. At every rising edge of the clock, the FSM:

- Samples the input data
- Transitions to the next state based on the current state and input
- Generates an output when the target sequence is detected

The design follows a **Moore/Mealy-style FSM behavior**, where state transitions and output logic are determined by both the current state and input conditions.

---

## Detection Sequence Flow

The FSM consists of four states:

- **State A**: Initial or idle state  
- **State B**: Partial sequence detected  
- **State C**: Extended sequence detected  
- **State D**: Pre-detection state  

### State Transition Behavior

- From **State A**:
  - Input `1` → Move to State B  
  - Input `0` → Stay in State A  

- From **State B**:
  - Input `1` → Move to State C  
  - Input `0` → Return to State A  

- From **State C**:
  - Input `1` → Stay in State C  
  - Input `0` → Move to State D  

- From **State D**:
  - Input `1` → Move to State B (**sequence detected**)  
  - Input `0` → Return to State A  

When the FSM transitions from **State D to State B**, the target sequence is considered detected.

---

## Design Overview

The sequence detector is implemented using the following components:

- **Combinational Next-State Logic**
- **Sequential State Register**
- **Output Detection Logic**
- **Detection Counter**

The design clearly separates combinational and sequential logic, improving readability and correctness.

---

## Sequence Detector Module

### Interface Signals

- **clk**  
  System clock input

- **data**  
  Serial input bit stream

- **state**  
  Current FSM state

- **newstate**  
  Next FSM state

- **out**  
  Asserted when the desired sequence is detected

- **q**  
  4-bit counter indicating the number of detected sequences

---

## FSM Operation

- The next state (`newstate`) is determined using a combinational `case` statement based on the current state and input data.
- On every rising edge of the clock:
  - The current state is updated to the next state.
- The output signal (`out`) is asserted when the FSM transitions from **State D to State B**.
- Each time `out` is asserted, the detection counter (`q`) is incremented.

This approach allows the FSM to detect **overlapping sequences** in the input data stream.

---

## Counter Operation

- The counter increments whenever a valid sequence is detected.
- It provides a running count of how many times the target sequence appears in the input stream.
- The counter width is 4 bits, allowing multiple detections to be tracked during simulation.

---

## Testbench Overview

A Verilog testbench is used to verify the sequence detector functionality.

### Testbench Features

- Generates a periodic clock signal
- Applies a predefined serial input bit sequence
- Monitors FSM states, output signal, and detection counter
- Confirms correct state transitions and sequence detection

The testbench validates both **FSM behavior** and **sequence detection accuracy**.

---

## Overall System Operation

1. The FSM starts in the initial state.
2. Input data bits are applied sequentially on each clock cycle.
3. The FSM transitions between states based on input values.
4. When the target sequence is detected, the output signal is asserted.
5. The detection counter increments for each successful detection.

This confirms the correct operation of the sequence detector.

---

## Summary

This project demonstrates the implementation of a **sequence detector using a Finite State Machine** in Verilog. The design correctly handles state transitions, detects the desired input pattern, and counts the number of detections.

The structured FSM approach and testbench verification make this design suitable for learning FSM concepts, sequence detection, and digital system design.

<img width="1575" height="812" alt="Screenshot 2025-12-17 173708" src="https://github.com/user-attachments/assets/5ca0a690-bd1a-4ee5-9203-259240a59ff8" />
