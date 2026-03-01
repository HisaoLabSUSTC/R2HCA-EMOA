# R2HCA-EMOA

**R2HCA-EMOA** is a hypervolume-driven evolutionary algorithm for many-objective optimization.

This repository provides a MATLAB implementation intended for use with [PlatEMO](https://github.com/BIMK/PlatEMO/):
- Root-level scripts are aligned with **PlatEMO v2.0**.
- The `new/` directory contains an updated implementation compatible with newer PlatEMO versions.

## Repository Structure

- `R2HCAEMOA.m` – Main algorithm entry point.
- `CalR2HVC.m` – R2-based hypervolume contribution calculation.
- `InitializeUtilityTensor.m` – Utility tensor initialization.
- `UpdateUtilityTensor.m` – Utility tensor update logic.
- `Reduce.m` – Population reduction procedure.
- `UniformVector.m` / `getH.m` – Helper utilities for vector generation and related calculations.
- `new/` – Updated counterparts of the core files for recent PlatEMO releases.

## Requirements

- MATLAB
- PlatEMO framework
  - v2.0 for the root implementation
  - Recent PlatEMO versions for the `new/` implementation

## Quick Start

1. Clone this repository.
2. Place the algorithm files in your PlatEMO algorithm directory (or add this repository to MATLAB path).
3. In PlatEMO, select `R2HCAEMOA` as the optimization algorithm.
4. Run experiments on your target many-objective benchmark problems.

## Notes

- If you are using legacy PlatEMO (v2.0), use the root files.
- If you are using a newer PlatEMO release, prefer the files under `new/`.
