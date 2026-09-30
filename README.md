# Attrition Dynamics Lab
A Julia-based simulator for exploring discrete two-force attrition dynamics and parameter sensitivity.
## Overview
**Attrition Dynamics Lab** is a small Julia project for simulating a discrete-time engagement between two opposing forces. It tracks force levels over time, determines the outcome, and makes it easy to compare how the effectiveness multiplier *λ* and weighting factor *w* change the duration and result of a simulation.
## Features
- Runs a step-by-step two-force attrition simulation.
- Stops when either force reaches the configured tolerance.
- Reports elapsed simulation hours, the winning side, and remaining force strength.
- Supports parameter sweeps across multiple *λ* and *w* values.
- Includes a maximum-step safeguard to prevent non-terminating runs.
## Model Parameters
- **R0**: initial strength of the red force; default: 5.0 divisions.
- **B0**: initial strength of the blue force; default: 2.0 divisions.
- **λ**: effectiveness multiplier applied to red-force losses.
- **w**: weighting factor used in both update equations.
- **max_steps**: maximum number of simulated hours.
- **tol**: threshold at which a force is treated as eliminated.
## Requirements
Install Julia 1.x. The current simulation uses only Julia's standard language features and does not require external packages.
## Usage
1. Save the simulation code as `battle_simulation.jl`.
2. Open a terminal in the project directory.
3. Run `julia battle_simulation.jl`.
4. Edit the `lambda_values` and `w_values` arrays to test additional scenarios.
## Interpreting Results
Each run reports the parameter values, elapsed hours, winner, and surviving force level. In the included experiments, outcomes vary substantially as *λ* and *w* change, making the project useful for sensitivity analysis and classroom demonstrations of iterative models.
## Limitations and Responsible Use
This is a simplified mathematical model, not a validated forecasting tool. Its outputs depend entirely on the selected equations, coefficients, time step, and initial conditions. Do not use the results for real-world operational or safety decisions.
