# Portfolio Artifact – Sales Performance Dashboard

> **BIA Mentoring Program | EPAM**
> **Module 07 – Data Visualization & Dashboard Design**

---

## What This Is

A fully functional Sales Performance Dashboard built in Tableau Public for James Rodriguez, Regional Sales Manager, using synthetic but realistic sales data (Jan–Sep 2026).

---

## Files in This Folder

| File | Description |
|------|-------------|
| [`dashboard-wireframes.md`](./dashboard-wireframes.md) | Wireframe and mockup design (pre-build planning artifact) |

For the full build guide and Tableau workbook, see [`docs/07-data-visualization`](../../docs/07-data-visualization/).

---

## Dashboard KPIs

| KPI | Value (Jan–Sep 2026) |
|-----|----------------------|
| Total Revenue | $1,803,274.76 |
| Deals Closed | 209 |
| Quota Attainment | 89.0% |
| Avg Revenue per Rep | ~$225,409 |

---

## Design Highlights

- **Enterprise color palette:** Navy blue primary, green/red for performance status
- **4 KPI cards** with custom PNG icon badges (Revenue $, Deals #, Quota %, Avg Rep $)
- **4 interactive charts:** Revenue by Region, Monthly Trend, Top Reps, Quota by Rep
- **3 global filters:** Time Period, Region, Sales Rep
- **Tableau Relationship** (not physical join) used between transactions and targets to prevent data inflation

---

## Data Sources

Both CSVs are in [`/data`](../../data/):
- `sales_transactions.csv` — 209 rows, 12 columns
- `sales_targets.csv` — 72 rows (8 reps × 9 months), 6 columns
