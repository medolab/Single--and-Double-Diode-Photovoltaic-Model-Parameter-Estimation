# Photovoltaic (PV) Model Parameter Estimation

This repository contains MATLAB code for estimating the parameters of single-diode and double-diode photovoltaic (PV) models. The provided functions define the parameter search ranges, enforce boundary constraints, and include real measurement data for the RTC France solar cell.

---

## Repository Structure

* **evaluate\_normal\_fitness.m** – Defines the fitness evaluation function for PV parameter optimization.
* **FunRange.m** – Specifies the lower and upper bounds of the parameters for single-diode and double-diode PV models.
* **SpaceBound.m** – Ensures solutions remain within defined parameter boundaries.
* **Data\_RTC\_France\_solar\_cell.txt** – Real measurement data from the RTC France solar cell.

---

## Models

### 1. Single-Diode PV Model

Parameters:

* Photocurrent (I\_ph)
* Diode saturation current (I\_SD)
* Series resistance (R\_s)
* Shunt resistance (R\_sh)
* Ideality factor (n)

### 2. Double-Diode PV Model

Parameters:

* Photocurrent (I\_ph)
* Diode saturation current 1 (I\_SD1)
* Series resistance (R\_s)
* Shunt resistance (R\_sh)
* Ideality factor 1 (n1)
* Diode saturation current 2 (I\_SD2)
* Ideality factor 2 (n2)

---

## Usage

1. Define the objective function pointing to **evaluate\_normal\_fitness**.
2. Select the parameter range using **FunRange(FunIndex)**.

   * `FunIndex = 1` → Single-diode model
   * `FunIndex = 2` → Double-diode model
3. Use **SpaceBound** in your optimization algorithm to ensure valid parameter values.
4. Compare the simulated model output with **Data\_RTC\_France\_solar\_cell.txt**.

This framework can be integrated with any optimization algorithm (e.g., Genetic Algorithm, Particle Swarm Optimization, Differential Evolution).

---

## Reference

This model is compatible with the methodology presented in the following journal article:

> Al-Shamma’a, A.A.; Omotoso, H.O.; Alturki, F.A.; Farh, H.M.H.; Alkuhayli, A.; Alsharabi, K.; Noman, A.M. Parameter Estimation of Photovoltaic Cell/Modules Using Bonobo Optimizer. Energies 2022, 15, 140. https://doi.org/10.3390/en15010140

If you use this repository in your research, please cite the above paper.

---


