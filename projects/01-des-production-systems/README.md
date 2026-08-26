# Push vs. Just-In-Time vs. Just-In-Sequence

**A Discrete-Event Simulation Comparison of Production System Trade-offs in Automotive Mixed-Model Assembly**

| | |
|---|---|
| **Course** | 106490 — Research Project for IE (BTEC Unit J/615/1502) |
| **Supervisor** | Dr. Ruba Alamad |
| **Institution** | Al-Hussein Technical University (HTU), Jordan |
| **Term** | Spring 2026 |
| **Type** | Individual research project |

---

## The problem

Automotive manufacturers face a fundamental strategic choice between Push, Just-In-Time (JIT), and Just-In-Sequence (JIS) production systems. Existing literature examines each system individually — but no published study has compared all three simultaneously under identical, controlled conditions. OEM decision-makers must therefore synthesize results from studies with different parameters, tools, and metrics, making direct comparison impossible.

## What I built

Three AnyLogic discrete-event simulation models built under identical experimental conditions, calibrated exclusively from 11 peer-reviewed publications (every parameter traceable to a specific table, page, and citation). Each model represents a three-station mixed-model automotive assembly line over a 480-minute shift.

- **31 total replications** (10 Push + 10 JIT + 11 JIS Disrupted)
- **5 KPIs measured** — throughput, WIP, lead time, station utilization, sequence accuracy
- **Push baseline validated** against Mahin et al. (2024) benchmark of ~112 cars/shift

## Key results

| KPI | Push | JIT | JIS Disrupted | Push→JIT | JIT→JIS |
|-----|------|-----|---------------|----------|---------|
| Throughput (cars/shift) | 127.5 ± 6.8 | 79.8 ± 50.9 | 36.3 ± 14.1 | −37.4% | −54.5% |
| **WIP (cars)** | **37.1 ± 14.6** | **9.7 ± 2.1** | **11.0 ± 0.0** | **−73.9%** | +13.4% |
| Lead time (min) | 115.4 ± 35.3 | 67.5 ± 53.4 | 193.7 ± 112.2 | −41.5% | +187% |
| Throughput CV | 0.054 | 0.638 | 0.387 | 11.8× | — |

**Key findings:**
- JIT cuts WIP by **74%** and lead time by **42%** — but throughput variability jumps **11.8×** (fragility trade-off)
- JIS without active resequencing collapses to **36 cars/shift** — 30.8 sequence errors × 15-min stoppage = 462 min of dead-time per 480-min shift
- Established the **first quantified Push–JIT–JIS trade-off curve** for OEM production system selection

## Tools & methods

- **AnyLogic PLE** — Process Modeling Library (Source, Queue, Delay, SelectOutput, Sink blocks)
- **Discrete-event simulation** — triangular distributions, stochastic disruption modeling
- **Statistical analysis** — mean ± SD, coefficient of variation, cross-scenario comparison
- **Literature-based calibration** — 11 peer-reviewed sources, page-cited parameters

## Files in this folder

- `report.pdf` — Full research paper (37 pages, IMRaD structure)
- *(Add:* AnyLogic model files (`.alp`), Excel data tables, Python plotting scripts *)*

## Read the full report

📄 [**report.pdf**](./report.pdf)
