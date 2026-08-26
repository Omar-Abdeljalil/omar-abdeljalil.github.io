# Nabil Foods — Manufacturing Systems Analysis of the Chicken Burger Line

**Full production system engineering study of a 350-tons/month batch-food line at Nabil Factory, Jordan**

| | |
|---|---|
| **Course** | Manufacturing Systems Engineering |
| **Institution** | Al-Hussein Technical University (HTU), Jordan |
| **Term** | 2025–2026 |
| **Type** | Individual project |
| **Subject** | Nabil Foods (est. 1945) — retail + restaurant supply (McDonald's, Subway, Hardee's) |

---

## Scope

A complete manufacturing-systems engineering evaluation of one dedicated production line producing the Giant Chicken Burger for both retail (MTS) and restaurant chains (MTO). The system boundary starts at frozen-chicken receiving and ends at final packaging. Nine sequential tasks structured the study.

## Tasks covered

| Task | Content |
|------|---------|
| I | Organization description, product & customer profile, demand pattern, scope, data sources |
| II | MSE principles — TOC, Push vs Pull, P-system vs Q-system, Six Sigma |
| III | Current-state VSM and KPI evaluation |
| IV | Two future-state VSM options + selection |
| V | Production planning — forecasting, capacity, MRP (Odoo), scheduling, resource allocation, cost optimization, manufacturing approach evaluation |
| VI–IX | Aggregate planning strategies (Level, Chase, Mixed), scheduling in MS Project, conclusion & recommendations |

## Key findings

- **System bottleneck identified: freezer** (60 min/batch, 1.2 t batch size, governs cycle time and resource allocation)
- Baseline utilization ~85%, achieved through inventory buffers, overtime, and batch processing
- Raw-material safety stock: 700 t chicken (2-month lead time from Brazil)
- **Recommendation:** shift from buffer-based compensation to constraint-aware, flow-oriented planning
- **Projected improvements** (no capital investment):
  - Lead time: **−15% to −25%**
  - Inventory: **−10% to −15%**
  - Overtime: **−20% to −25%**

## Selected planning framework

**Level workforce strategy** + **bottleneck-driven scheduling** + **rolling MRP in Odoo** + **strategic buffer rebalancing** — chosen as the most suitable, cost-effective approach for this high-volume, batch-based food manufacturing environment.

## Tools & methods

- **Value Stream Mapping** (current + future state)
- **Theory of Constraints** — throughput, inventory, operating expense, utilization
- **Forecasting** — pattern identification, moving averages, seasonal analysis
- **Capacity planning** — utilization, capacity cushion, bottleneck analysis
- **MRP** — Bill of Materials, dependent vs independent demand, Odoo ERP implementation
- **Aggregate planning** — Level, Chase, and Mixed strategy comparison
- **Microsoft Project** — scheduling and resource allocation

## Files in this folder

- `report.pdf` — Full report (118 pages, 9 tasks)
- *(Add:* Odoo BOM/MRP exports, MS Project schedule (`.mpp`), VSM diagrams, capacity spreadsheets *)*

## Read the full report

📄 [**report.pdf**](./report.pdf)
