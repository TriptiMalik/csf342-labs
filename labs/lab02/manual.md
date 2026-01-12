# CS F342 – Computer Architecture
## Lab 2: Sequential Verilog Foundations

---

## 1. Objective

The objective of **Lab 2** is to introduce **state, time, and control** in digital systems using Verilog.

In this lab, you will:

- Understand how **hardware stores state**
- Correctly write **clocked (sequential) Verilog**
- Distinguish clearly between:
  - combinational logic
  - sequential (state-holding) logic
- Learn the role of:
  - clocks
  - resets
  - registers
- Observe and reason about the difference between:
  - blocking assignments (`=`)
  - non-blocking assignments (`<=`)
- Design and reason about **finite state machines (FSMs)**

This lab marks a conceptual shift from:

> “logic that computes”  
to  
> “hardware that remembers and reacts over time”.

---

## 2. Background: Sequential Logic in Verilog

### 2.1 What makes logic sequential?

A circuit is **sequential** if:
- its outputs depend on **past inputs**
- it contains **storage elements** such as flip-flops or registers

In Verilog, state is modeled using:
- `reg` variables
- updated inside **clocked `always` blocks**

---

### 2.2 Clocked always blocks

A typical sequential block looks like:

```verilog
always @(posedge clk) begin
  q <= d;
end
```

Key points:
- The block executes **only on the rising edge of the clock**
- The value of `q` updates **only at the clock edge**
- `<=` (non-blocking assignment) is required for sequential logic

---

### 2.3 Reset behavior

A reset initializes hardware to a known state.

Two common styles:
- **Synchronous reset**: reset is checked inside the clocked block
- **Asynchronous reset**: reset is included in the sensitivity list

You will implement and compare both.

---

### 2.4 Blocking vs non-blocking assignments

- Blocking assignment (`=`):
  - Executes immediately
  - Suitable for combinational logic
- Non-blocking assignment (`<=`):
  - Updates occur together at the clock edge
  - Required for sequential logic

Using blocking assignments incorrectly in sequential logic leads to subtle bugs.
You will observe this directly in Task 3.

---

## 3. Lab Structure

```
labs/lab2/
├── manual.md
├── task1/
│   └── dut.v
├── task2/
│   └── dut.v
├── task3/
│   └── dut.v
├── task4/
│   └── dut.v
├── task5/
│   └── dut.v
├── tb/
│   ├── tb_dff.v
│   ├── tb_register.v
│   ├── tb_shiftreg.v
│   ├── tb_counter.v
│   └── tb_fsm.v
```

Rules:
- Each task has exactly **one top-level module named `dut`**
- Testbenches are provided and must **not** be modified
- Generated files go into `artefacts/lab2/`

---

## 4. Task 1: D Flip-Flop with Reset (Starter)

### Objective
Implement a **positive-edge-triggered D flip-flop**, and study reset behavior.

### What is provided
- Starter code for a D flip-flop **without reset**

### What you must do
1. Add a **synchronous reset**
2. Add an **asynchronous reset**
3. Simulate both versions using the same testbench
4. Compare waveforms

### Concepts reinforced
- Clock edges
- Reset semantics
- Timing of state updates

---

## 5. Task 2: Register (Structural Design)

### Objective
Build a **multi-bit register** by **structurally composing** the D flip-flops from Task 1.

### Requirements
- Do not rewrite flip-flop logic
- Instantiate multiple DFF modules
- Use vector signals at the top level
- Maintain clean hierarchy

---

## 6. Task 3: Shift Register (Blocking vs Non-blocking)

### Objective
Implement a **shift register** and observe the effect of:
- blocking assignments (`=`)
- non-blocking assignments (`<=`)

The provided testbench is designed to **break incorrect implementations**.

---

## 7. Task 4: Counter (Up-Counter Only)

### Objective
Design a **simple up-counter**.

### Requirements
- Increment by 1 on every clock edge
- Include reset
- Purely sequential design
- No bonus variants

---

## 8. Task 5 (Homework): FSM with ROM-Style Control

### Objective
Design an FSM-controlled system integrating registers, arithmetic, and user-driven control.

### Datapath
- Two 2-bit registers: R0 and R1
- Arithmetic: add and subtract
- Write-back to either register

### Control Inputs

Operation buttons `op[1:0]`:

| op | Meaning |
|----|--------|
| 00 | No-op |
| 01 | Add |
| 10 | Subtract |
| 11 | Toggle halt/run |

Destination select `dest`:
- 0 → write to R0
- 1 → write to R1

Buttons are **level-sensitive**.

---

### FSM States (Required)

1. RUN_WAIT  
2. RUN_RESULT_READY  
3. HALTED  

FSM must be implemented **behaviorally using `case(state)` only**.

---

### Reset Behavior
- Reset places FSM in RUN_WAIT
- Registers must be initialized to known values

---

## 9. Verification Expectations

- All designs must compile cleanly
- All testbenches must pass
- Waveforms are for debugging, not grading

---

## 10. Submission

Commit:
- `dut.v` files for completed tasks
- This manual file

Task 5 is graded as homework.

---

## 11. Learning Outcomes

After Lab 2, you should be able to:
- Write correct sequential Verilog
- Reason about clocked behavior
- Debug timing-related bugs
- Design simple FSMs

---

**End of Lab 2 Manual**
