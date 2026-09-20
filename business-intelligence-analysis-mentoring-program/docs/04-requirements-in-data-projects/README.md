# Sales Dashboard – Requirements Traceability

**BIA Mentoring Program | Module 4**
Prepared by: Stephanie Arredondo

---

## Overview

This deliverable is part of Module 4 of the BIA Mentoring Program. It translates stakeholder needs from the discovery and requirements phases into measurable KPIs and fully traceable dashboard components.

The goal is to prove that every design decision in the Sales Dashboard connects back to a real business need expressed by **James Rodriguez, Regional Sales Manager**.

---

## Contents

### 1. KPI / Dimensions Matrix

Defines the 8 key performance indicators selected for the dashboard. Each KPI includes:

- **Formula** — how the metric is calculated
- **Dimensions** — the angles from which it can be analyzed (region, rep, time, product)
- **Business Value** — why this metric matters specifically to James

| KPI | Formula | Dimensions | Business Value |
|-----|---------|------------|----------------|
| Total Revenue | SUM(Sales Amount) | Region, Rep, Product, Month | Core measure of team growth |
| Deals Closed | COUNT(Deal ID) | Rep, Region, Month | Measures activity, not just revenue |
| Quota Attainment % | (Actual ÷ Target) × 100 | Region, Rep, Quarter | Tracks progress before month-end |
| Average Revenue per Rep | Total Revenue ÷ # Reps | Rep, Region | Identifies coaching opportunities |
| Regional Sales Performance | SUM by Region | Region, Product, Month | Compares the 3 regions |
| Sales Trend | Revenue by Time Period | Day, Week, Month, Quarter | Detects warning signs early |
| Top 5 Sales Representatives | RANK by Revenue | Rep, Region | Supports recognition and coaching |
| Report Automation Adoption | Automated ÷ Total Reports | Time Period | Measures elimination of manual work |

---

### 2. Traceability Matrix

Maps each stakeholder goal to a user story, a KPI, and the dashboard component that delivers it.

| Stakeholder Goal | User Story | KPI | Deliverable |
|-----------------|-----------|-----|-------------|
| Detect underperforming regions before month-end | As a regional manager, I want to filter sales data by region and date range so that I can quickly identify which areas are underperforming. | Regional Sales Performance, Total Revenue | Regional Sales Dashboard with interactive filters |
| Recognize top performers and coach underperformers | As a regional manager, I want to see a ranking of my sales reps by total sales so that I can recognize top performers and support those who are falling behind. | Top 5 Sales Representatives, Average Revenue per Rep | Rep Comparison View with sales ranking |
| Detect performance warning signs early | As a regional manager, I want to view KPI trend lines for the past weeks so that I can detect early warning signs before the end of the month. | Sales Trend | Trend Visualization with weekly/monthly line charts |
| Monitor progress against sales quotas | As a regional manager, I want to see each rep's quota attainment percentage so that I can intervene before a rep misses their target. | Quota Attainment % | Target vs. Actual Dashboard with progress bars |
| Track deal pipeline and team activity | As a regional manager, I want to see the number of deals closed by rep and region so that I can measure activity, not just revenue. | Deals Closed | Sales Activity Dashboard |
| Eliminate manual Excel report consolidation | As a regional manager, I want to download a PDF summary report with one click so that I can share it in my weekly meetings without building it manually in Excel. | Report Automation Adoption | One-click PDF Export |
| Have the weekly overview ready before team meetings | As a regional manager, I want to receive an automated report by email every Monday morning so that I have the weekly overview ready before my team meeting. | Report Automation Adoption | Scheduled automated report delivery |

---

### 3. Business Rationale

James Rodriguez currently spends 3–4 hours every week manually consolidating Excel files from 8 sales reps across 3 regions. He has no real-time visibility into team performance and can only detect problems at month-end, when it is too late to act.

The KPIs in this document address those pain points directly. **Total Revenue** and **Regional Sales Performance** give James an immediate view of where the business stands. **Quota Attainment %** and **Sales Trend** surface problems early — at the rep and region level — before they impact end-of-month results. **Top 5 Sales Representatives** supports his coaching role. **Report Automation Adoption** measures the core project promise: eliminating manual Excel work.

Every user story maps to a KPI, and every KPI maps to a deliverable — ensuring the solution is complete, justified, and aligned with stakeholder expectations.

---

## Related Modules

| Module | Deliverable |
|--------|-------------|
| Module 2 | Sales Dashboard – Discovery Plan |
| Module 3 | Sales Dashboard – Requirements Overview (User Persona, User Journey, User Stories) |
| Module 4 | **Sales Dashboard – Requirements Traceability** ← this document |
