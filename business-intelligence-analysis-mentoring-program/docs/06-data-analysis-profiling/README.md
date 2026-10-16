# Module 06 – Data Analysis & Data Profiling

> **BIA Mentoring Program | EPAM**
> **Track 2 — Module 5 Homework**

---

## Objective

Examine the datasets that power the Sales Performance Dashboard and identify data quality issues, gaps, and inconsistencies that could affect the reliability of the insights delivered to stakeholders.

---

## Deliverables

| File | Description |
|------|-------------|
| [`data-analysis-profiling-report.md`](./data-analysis-profiling-report.md) | Full profiling report in Markdown |
| [`Data_Analysis_Profiling_Report_M5.docx`](./Data_Analysis_Profiling_Report_M5.docx) | Word document submitted for evaluation |

---

## Datasets Analyzed

| Dataset | Records | Columns | Period |
|---------|---------|---------|--------|
| `sales_transactions.csv` | 209 | 12 | Jan–Sep 2026 |
| `sales_targets.csv` | 72 | 6 | Jan–Sep 2026 |

Both files are located in [`/data`](../../data/).

---

## Key Findings at a Glance

- **Total revenue:** $1,803,274.76 against a target of $2,026,971 → **89.0% attainment**
- **Zero null values** in both datasets — completeness is strong
- **4 outlier transactions** exceed 3 standard deviations (max $36,780.67) — require business validation
- **South region underperforms:** only 17.2% of revenue vs. West (41.5%) and North (41.3%)
- **Customer concentration risk:** 20 unique customers across 209 transactions; no CustomerID field
- **Complex join logic** between the two files requires month-level date truncation, not a simple FK — caused data inflation in early Tableau prototypes

---

## DQ Dimensions Assessed

| Dimension | Status |
|-----------|--------|
| Completeness | ✅ No nulls |
| Accuracy | ⚠️ 4 outlier amounts to validate |
| Consistency | ⚠️ Complex join — many-to-many risk |
| Validity | ⚠️ Quantity field (1–3 only) may be oversimplified |
| Integrity | ⚠️ No CustomerID; no referential integrity |
| Timeliness | ⚠️ 9 months only; no historical data |

---

## Top Recommendations

1. Validate 4 high-value outlier transactions with the business stakeholder
2. Use Tableau Relationships (not physical joins) to prevent aggregation errors
3. Add a `CustomerID` field and customer dimension table
4. Source prior-year data to enable year-over-year comparisons
5. Add a transaction status field (Closed Won / Returned / Cancelled)
