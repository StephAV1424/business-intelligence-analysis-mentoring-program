# KPI / Dimensions Matrix

## Overview

This document defines the Key Performance Indicators (KPIs) and Dimensions used in the Sales Dashboard project.

The purpose of this matrix is to ensure that all business requirements can be measured consistently and analyzed from multiple perspectives.

---

# KPI Matrix

| KPI | Formula | Dimensions | Business Value |
|------|---------|------------|----------------|
| Total Revenue | SUM(Sales Amount) | Region, Sales Rep, Product, Month | Measures overall sales performance |
| Deals Closed | COUNT(Deal ID) | Sales Rep, Region, Month | Measures team productivity |
| Quota Attainment % | (Actual Sales / Sales Target) × 100 | Region, Sales Rep, Quarter | Measures achievement against sales goals |
| Average Revenue per Rep | Total Revenue / Number of Sales Reps | Sales Rep, Region | Measures individual effectiveness |
| Regional Sales Performance | SUM(Sales Amount) by Region | Region, Product, Month | Identifies strong and weak performing regions |
| Sales Trend | Revenue by Time Period | Day, Week, Month, Quarter | Tracks sales performance over time |
| Top 5 Sales Representatives | Rank by Total Revenue | Sales Rep, Region | Highlights top-performing representatives |
| Report Automation Adoption | Number of Automated Reports Generated | Time Period | Measures reporting efficiency |

---

# Dimension Definitions

## Region

Represents the geographical territory responsible for sales activities.

### Examples

- North
- South
- East
- West

---

## Sales Representative

Represents the individual seller responsible for customer acquisition and revenue generation.

### Examples

- Representative A
- Representative B
- Representative C

---

## Product

Represents the products or services sold by the organization.

### Examples

- Product A
- Product B
- Product C

---

## Time

Represents the calendar hierarchy used for trend and period analysis.

### Levels

- Day
- Week
- Month
- Quarter
- Year

---

# KPI Example

## Quota Attainment %

### Formula

```text
(Actual Sales / Sales Target) × 100
```

### Example

```text
Actual Sales = $450,000
Sales Target = $500,000

Quota Attainment % = 90%
```

### Interpretation

| Result | Meaning |
|----------|----------|
| Less than 100% | Target not achieved |
| 100% | Target achieved |
| Greater than 100% | Target exceeded |

---

# Business Value

The KPI Matrix provides a clear definition of how business performance will be measured throughout the Sales Dashboard solution.

These KPIs support:

- Regional performance monitoring
- Sales representative evaluation
- Target achievement analysis
- Productivity measurement
- Reporting automation tracking
``