# Data Analysis and Data Profiling Report
**Sales Dashboard | BIA Mentoring Program — Module 5**
**Prepared by: Stephanie Arredondo | October 2026**

---

## 1. Objective

The objective of this report is to examine the two datasets used to power the Sales Performance Dashboard — `sales_transactions.csv` and `sales_targets.csv` — and identify any data quality issues, gaps, or inconsistencies that could affect the reliability of the dashboard insights provided to James Rodriguez, Regional Sales Manager.

This analysis covers:
- **Business-level profiling** — trends, distributions, business meaning
- **Technical-level profiling** — data types, completeness, formatting, and referential integrity

---

## 2. Data Overview

Two CSV files serve as the data source for the Sales Dashboard:

- **`sales_transactions.csv`** — individual sales transactions made by 8 sales representatives across 3 regions, January–September 2026
- **`sales_targets.csv`** — monthly revenue targets assigned to each sales representative for the same 9-month period

### Summary Statistics

| Dataset | Metric | Value |
|---------|--------|-------|
| sales_transactions.csv | Total records | 209 |
| sales_transactions.csv | Total columns | 12 |
| sales_transactions.csv | Date range | Jan 1 – Sep 29, 2026 |
| sales_transactions.csv | Total revenue | $1,803,274.76 |
| sales_transactions.csv | Avg transaction value | $8,628.11 |
| sales_transactions.csv | Null values | 0 across all fields |
| sales_transactions.csv | Duplicate TransactionIDs | 0 |
| sales_transactions.csv | Unique customers | 20 |
| sales_transactions.csv | Unique sales reps | 8 |
| sales_targets.csv | Total records | 72 (8 reps × 9 months) |
| sales_targets.csv | Total columns | 6 |
| sales_targets.csv | Total quota assigned | $2,026,971.00 |
| sales_targets.csv | Overall attainment | 89.0% |
| sales_targets.csv | Null values | 0 across all fields |

---

## 3. Data Profiling

### 3.1 Business-Level Profiling

**sales_transactions.csv**

- The dataset covers 9 months of sales activity (January 1 – September 29, 2026) with **209 total closed transactions**, generating **$1,803,274.76** in total revenue.
- **West and North regions are the dominant revenue contributors** at 41.5% ($747,962) and 41.3% ($745,638) respectively. The South region significantly underperforms at only 17.2% ($309,675).
- **Services** is the largest product category by revenue (48.4%), followed by **Software** (36.9%) and **Hardware** (14.7%). This suggests the business is primarily service- and software-driven.
- **Ana García** is the top-performing rep at an estimated $336,000, while **Sarah Johnson** is the lowest at $143,400 — a 2.3× performance gap that warrants closer attention.
- Only **20 unique customers** are present across 209 transactions. The top two customers (NovaBridge and Redwood Analytics) each appear in 17 transactions (~16% of all deals) — a **high customer concentration risk**.
- Monthly transaction volume is relatively stable, ranging from 18 (April) to 30 (January), with no clear seasonal spike. January showed the highest revenue month (~$275K).
- Overall quota attainment stands at **89.0%**, meaning the team is collectively 11% below the assigned targets for the year-to-date period.

**sales_targets.csv**

- The targets file is well-structured: 8 reps × 9 months = 72 records, one per rep per month, with no missing periods.
- Monthly targets range from $19,444 (David Chen) to $37,023 (Robert Kim), reflecting differentiated quotas per representative.
- Total target for the Jan–Sep 2026 period is **$2,026,971**, against $1,803,275 in actual revenue — a **$223,696 shortfall**.

---

### 3.2 Technical-Level Profiling

**sales_transactions.csv**

| Attribute | Finding |
|-----------|---------|
| Data types | Consistent: SaleDate → DATE, Amount/Quantity → DECIMAL, all text fields → STRING |
| Completeness | 0 null values across all 12 columns |
| Uniqueness | 0 duplicate TransactionIDs |
| Amount range | $1,335.12 – $36,780.67 (mean: $8,628.11, stdev: $6,508.05) |
| Outliers (3σ) | 4 transactions exceed mean + 3×stdev (~$28,000+) |
| Outliers (IQR) | 19 transactions above the IQR upper fence |
| Quantity values | Only 1, 2, or 3 — possibly oversimplified |
| CustomerName | Free-text; no CustomerID foreign key |

**sales_targets.csv**

| Attribute | Finding |
|-----------|---------|
| Data types | Consistent: PeriodDate → DATE (YYYY-MM-01), TargetAmount → DECIMAL |
| Completeness | 0 null values across all 6 columns |
| Redundancy | `Period` (e.g., "Jan 2026") and `PeriodDate` (e.g., "2026-01-01") both represent the same month |
| Join key | No direct FK to transactions; requires RepID + month-truncated date match |

**Join Complexity:**

Connecting the two files requires matching `RepID` **AND** truncating `SaleDate` to month level to align with `PeriodDate`. A physical join in Tableau produced many-to-many rows and inflated revenue figures. The correct approach is to use a **Tableau Relationship** or pre-aggregate monthly actuals before joining.

---

## 4. Data Quality Assessment

| DQ Dimension | Issue Description | Impact | Recommendation |
|--------------|-------------------|--------|----------------|
| **Completeness** | 0 null values in both datasets. All records fully populated. | None | Maintain validation rules at source to prevent future gaps. |
| **Accuracy** | 4 transactions exceed 3σ (max $36,780.67 vs mean $8,628.11). May be data entry errors or legitimate large deals. | Medium — may distort average revenue KPI | Review outlier transactions with James Rodriguez to confirm they represent real deals. |
| **Consistency** | The two CSVs share RepID but not a direct month-level FK. Physical join creates many-to-many rows, inflating aggregates. | High — incorrect join type produces duplicate rows | Use Tableau Relationship (not Join), or pre-aggregate targets before joining. |
| **Validity** | Quantity field only contains values 1, 2, or 3. May oversimplify real deal quantities. | Low — does not affect revenue totals | Confirm whether Quantity reflects actual units or is a simplified proxy. |
| **Integrity** | CustomerName is free-text with no CustomerID. No referential integrity to a customer dimension. | Medium — customer-level trend analysis not possible | Add a CustomerID column or create a customer lookup table. |
| **Timeliness** | Dataset covers only Jan–Sep 2026 (9 of 12 months). No historical data from prior years. | Medium — YoY comparisons and full-year forecasting not possible | Collect Q4 2026 data and prior-year data (2025). |

---

## 5. Gap Analysis

### Gap 1 — No historical data (prior years)
- **Current State:** Data covers January–September 2026 only.
- **Impact:** Year-over-year (YoY) comparisons, seasonality analysis, and full-year forecasting are not possible.
- **Priority:** High
- **Recommendation:** Collect and append 2025 actuals and targets to enable trend comparisons.

### Gap 2 — No CustomerID or customer dimension table
- **Current State:** CustomerName is a free-text field with no unique identifier or segment classification.
- **Impact:** Cannot reliably track repeat purchases, calculate customer lifetime value, or segment by account type.
- **Priority:** High
- **Recommendation:** Add a CustomerID column and create a separate customer dimension table with segment, industry, and account tier.

### Gap 3 — No return/refund or cancellation data
- **Current State:** Only closed-won deals are present.
- **Impact:** Revenue figures represent gross sales, not net revenue. This may overstate actual business performance.
- **Priority:** Medium
- **Recommendation:** Add a transaction status field (Closed Won / Returned / Cancelled) and include credit/reversal records.

### Gap 4 — No pipeline or deal stage data
- **Current State:** The dashboard only shows closed deals. No pipeline visibility (leads, prospects, in-negotiation).
- **Impact:** Cannot forecast future revenue or identify at-risk deals before month-end.
- **Priority:** Medium
- **Recommendation:** Include an opportunities dataset with deal stage, expected close date, and probability.

### Gap 5 — No cost or margin data
- **Current State:** Only revenue amount is tracked. No COGS or margin fields.
- **Impact:** Profitability analysis is not possible. A high-revenue rep may be selling at lower margins.
- **Priority:** Low (initial dashboard) → High (strategic reporting)
- **Recommendation:** Add a margin percentage or cost field per product in a product dimension table.

### Gap 6 — Complex join logic between datasets
- **Current State:** Joining the two files requires RepID + month-truncated date — no simple shared key.
- **Impact:** Incorrect join method caused data duplication in the Tableau prototype.
- **Priority:** High (already mitigated in Tableau via Relationships)
- **Recommendation:** Add a `SalesMonth` calculated column (YYYY-MM) to sales_transactions as a pre-built join key.

---

## 6. Recommendations

### Immediate (before dashboard goes to production)
- Validate the 4 outlier transactions (Amount > $28,000) with James Rodriguez.
- Use Tableau Relationships (not physical Joins) between the two data sources.
- Add a `SalesMonth` column (YYYY-MM) to sales_transactions to simplify future joins.

### Short-term (within 1–2 months)
- Add a CustomerID and basic customer dimension table (segment, industry).
- Collect full Q4 2026 data to complete the annual view before year-end reporting.
- Add a transaction status field to distinguish closed-won from returned or cancelled deals.

### Long-term (strategic improvements)
- Source 2025 historical data to enable year-over-year trend comparison.
- Integrate pipeline/opportunity data to provide forward-looking visibility.
- Include cost/margin data to move from revenue reporting to profitability reporting.
- Establish a formal data dictionary and data governance process.

---

*BIA Mentoring Program | Module 5 (Track 2) | Stephanie Arredondo | October 2026*
