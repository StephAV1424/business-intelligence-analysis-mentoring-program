# Module 07 – Data Visualization & Dashboard Design

> **BIA Mentoring Program | EPAM**
> **Course Module 10 — Tableau Sales Performance Dashboard**

---

## Objective

Design and build a production-ready Sales Performance Dashboard in Tableau Public using real sales data, applying professional color palettes, KPI card design, interactive filters, and best practices for BI dashboard layout and communication.

---

## Deliverables

| File | Description |
|------|-------------|
| [`tableau-dashboard-guide.md`](./tableau-dashboard-guide.md) | Step-by-step Tableau build guide (Modules 1–6) |
| [`Sales Performance Dashboard.twb`](./Sales%20Performance%20Dashboard.twb) | Tableau workbook source file |
| [`dashboard-mockup.md`](../portfolio-artifacts/dashboard-design/dashboard-wireframes.md) | Original wireframe and mockup design |

**KPI Icons** (used in the dashboard) are in [`/assets/icons/`](../../assets/icons/).
**Data files** used to build the dashboard are in [`/data/`](../../data/).

---

## Dashboard Overview

The dashboard answers the following business questions for James Rodriguez, Regional Sales Manager:

| Question | Visualization |
|----------|--------------|
| How much revenue did we generate? | Total Revenue KPI card |
| How many deals did we close? | Deals Closed KPI card |
| Are we hitting our quota? | Quota Attainment % KPI card |
| What is the average revenue per rep? | Avg Revenue per Rep KPI card |
| Which regions drive the most revenue? | Revenue by Region bar chart |
| Is revenue trending up or down? | Monthly Sales Trend line chart |
| Who are the top performers? | Top Reps Ranking horizontal bar |
| How does each rep compare to their target? | Quota Attainment by Rep bar chart |

---

## Dashboard Layout

```
┌─────────────────────────────────────────────────────┐
│  FILTROS: Time Period │ Region │ Sales Rep           │
├───────────┬───────────┬───────────┬─────────────────┤
│ Total     │ Deals     │ Quota     │ Avg Revenue     │
│ Revenue   │ Closed    │ Attain %  │ per Rep         │
├───────────────────────┬─────────────────────────────┤
│  Revenue by Region    │   Monthly Sales Trend       │
│  (Bar Chart)          │   (Line Chart)              │
├───────────────────────┴─────────────────────────────┤
│          Top 5 Reps Ranking (Horizontal Bar)        │
└─────────────────────────────────────────────────────┘
```

---

## Color Palette

| Element | Color | Hex |
|---------|-------|-----|
| Primary / Headers | Navy Blue | `#1B4F8A` |
| On Target | Green | `#27AE60` |
| Below Target | Red | `#E74C3C` |
| North Region | Navy | `#1B4F8A` |
| South Region | Medium Blue | `#2E86C1` |
| West Region | Light Blue | `#5DADE2` |
| KPI Icon - Revenue | Blue | `#1E40AF` |
| KPI Icon - Deals | Green | `#065F46` |
| KPI Icon - Quota | Purple | `#4C1D95` |
| KPI Icon - Avg Rep | Orange | `#D97706` |

---

## Key Calculated Fields

| Field | Formula |
|-------|---------|
| Quota Attainment % | `SUM([Amount]) / SUM([TargetAmount])` |
| Month-Year | `DATETRUNC('month', [SaleDate])` |
| Performance Flag | `IF SUM([Amount]) >= SUM([TargetAmount]) THEN "On Target" ELSE "Below Target" END` |

---

## Key Design Decisions

- **Tableau Relationship (not Join)** used between `sales_transactions` and `sales_targets` to avoid many-to-many row duplication
- **Enterprise color palette** applied after mentor feedback — moved from bright colors to professional navy/teal scheme
- **Custom PNG icons** generated (SVG → PNG via cairosvg) for each KPI card to match the polished dashboard reference design
- **Global filters** applied across all sheets using "Apply to Worksheets → All Using This Data Source"
