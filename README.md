This repository contains the Verilog RTL code for a simple traffic light controller. The controller manages the traffic lights for a north-south (NS) and west-east (WE) intersection.

**Description**
The traffic light controller cycles through a sequence of states to control the traffic lights for both directions. The states are designed to ensure a safe and orderly flow of traffic, with each light changing in a timed manner.

**File Overview**
traffic_ligth.v: Verilog module for the traffic light controller.
**State Description**
The traffic light controller operates in six distinct states:

S0: NS green, WE red
S1: NS yellow, WE red
S2: NS red, WE red
S3: NS red, WE green
S4: NS red, WE yellow
S5: NS red, WE red
Each state has a specific duration, controlled by a counter.
**Parameters**
clk: Clock signal input.
rst: Reset signal input.
LED_NS: 3-bit output representing the state of the north-south traffic light.
LED_WE: 3-bit output representing the state of the west-east traffic light.
**Internal Registers**
state: Stores the current state of the traffic light system.
count: Counter used to control the timing of state transitions.
**State Transistion logic**
The state transition logic is managed using an always block that triggers on the positive edge of the clock or the reset signal.
always@(posedge clk or posedge rst)
begin
    if (rst) begin
        state <= S0;
        count <= 0;
    end else begin
        case (state)
            // State transition cases...
        endcase
    end
end
**Usage**
To use this module in your project, instantiate the traffic_ligth module and connect the appropriate signals for the clock, reset, and traffic light outputs.
**Contributing**
Contributions are welcome! Please feel free to submit a pull request or open an issue for any bugs or enhancements.
