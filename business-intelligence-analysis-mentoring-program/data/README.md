# Data

Synthetic sales datasets used to build and profile the Sales Performance Dashboard.

| File | Rows | Columns | Description |
|------|------|---------|-------------|
| `sales_transactions.csv` | 209 | 12 | Individual closed deals, Jan–Sep 2026 |
| `sales_targets.csv` | 72 | 6 | Monthly quota per rep (8 reps × 9 months) |

Both files were used in:
- **Module 06** — Data Analysis & Data Profiling (statistical profiling, DQ assessment, gap analysis)
- **Module 07** — Data Visualization & Dashboard Design (Tableau data source)

## Schema

### sales_transactions.csv
| Column | Type | Description |
|--------|------|-------------|
| TransactionID | STRING | Unique identifier (T-001 … T-209) |
| SaleDate | DATE | Transaction date (YYYY-MM-DD) |
| RepID | STRING | Sales rep identifier |
| RepName | STRING | Sales rep full name |
| RegionID | STRING | Region code |
| Region | STRING | North / South / West |
| ProductID | STRING | Product code |
| ProductName | STRING | Product name |
| Category | STRING | Services / Software / Hardware |
| CustomerName | STRING | Customer company name |
| Quantity | INTEGER | Units sold (1–3) |
| Amount | DECIMAL | Revenue in USD |

### sales_targets.csv
| Column | Type | Description |
|--------|------|-------------|
| RepID | STRING | Sales rep identifier (FK to transactions) |
| RepName | STRING | Sales rep full name |
| Region | STRING | North / South / West |
| Period | STRING | Human-readable label (e.g., "Jan 2026") |
| PeriodDate | DATE | Machine-readable date (YYYY-MM-01) |
| TargetAmount | DECIMAL | Monthly quota in USD |
