# Aramex Drone Delivery Optimization

**Integer Linear Programming model for drone-based bank-document delivery across urban depots**

| | |
|---|---|
| **Course** | Operations Research |
| **Instructor** | Dr. Hamza Adeinat |
| **Institution** | Al-Hussein Technical University (HTU), Jordan |
| **Date** | January 2025 |
| **Team** | Omar Abdaljaleel, Abdel Rahman, Mohammed Darwish, Mohammed Kokash |

---

## The problem

Aramex is exploring drone-based transportation for time-sensitive, low-payload deliveries between bank branches. Drones have limited carrying capacity per trip and a maximum flying range per charge — so requests exceeding capacity require multiple trips. The operational question: **how many drone trips are required for each pickup–delivery request to satisfy all demand at minimum total cost?**

## What I built

A **mixed-integer optimization model** minimizing total transportation cost across all requests, respecting drone capacity and range constraints. Solved in two independent implementations for cross-validation.

### Mathematical formulation

**Sets:** depots (D), bank branches (B), pickup-delivery requests (R), drones (K)

**Decision variables:**
- `x_ijk ∈ {0,1}` — 1 if drone k travels from node i to node j
- `y_rk ∈ {0,1}` — 1 if request r is served by drone k

**Objective:**
```
min Z = Σ_k Σ_i Σ_j (c · d_ij · x_ijk)
```

**Constraints:**
- Each drone starts and ends at a depot
- Flow conservation at every bank branch
- Each request served by exactly one drone
- Total orders per drone ≤ capacity
- Total distance per drone ≤ max range

## Key results

| Metric | Value |
|--------|-------|
| **Optimal total cost** | **104.05 JOD** |
| Pickup–delivery requests | 10 |
| Total orders transported | 62 |
| Drone capacity | 2 orders / trip |
| Max range | 30 km / charge |
| Cost rate | 0.5 JOD / km |

**Insights:**
- Trip count driven by the ratio of demand volume to drone capacity — capacity upgrades or demand consolidation would reduce trips on high-volume routes
- Depot proximity to high-frequency pickup locations dominates operational cost
- Cross-validated with Excel Solver — both implementations converged to the same 104.05 JOD optimum

## Tools & methods

- **Python** — model construction, data structures
- **PuLP** — LP/ILP solver interface, minimization objective, integer variables
- **Pandas** — distance matrix and demand data as DataFrames
- **Excel Solver** — Simplex LP, binary variables, independent cross-validation

## Files in this folder

- `report.pdf` — Full project report (16 pages)
- *(Add:* Python source code (`.py`), Excel model (`.xlsx`), input CSVs *)*

## Read the full report

📄 [**report.pdf**](./report.pdf)
