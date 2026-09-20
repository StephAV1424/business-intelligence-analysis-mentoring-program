# Part 1 – Requirements Documentation

> **Course:** BIA Mentoring Program | Business Intelligence & Analytics
> **Topic:** Requirements Documentation — SRS, BRD, BRS, URS, PTP, DMP, DTP

---

## Overview

Requirements documentation is the set of formal artifacts that capture **what a system must do**, **why it must do it**, and **how success will be measured**. These documents act as the contract between business stakeholders and the delivery team throughout the project lifecycle.

Well-written documentation:
- Prevents scope creep and misaligned expectations
- Provides a reference point for testing and validation
- Ensures traceability from business goal → feature → delivery

### Documentation Hierarchy

The diagram below shows how document types relate and feed each other:

![Documentation Hierarchy](images/doc_hierarchy.png)

---

## Document Types

### BRD — Business Requirements Document

The **BRD** is the top-level document. It captures the business problem, objectives, and high-level scope from the sponsor's perspective. It answers: **"Why are we doing this project?"**

| Field | Description |
|-------|-------------|
| **Author** | Business Analyst / Project Sponsor |
| **Audience** | Executives, Project Manager, Stakeholders |
| **When written** | Project initiation phase |
| **Level of detail** | High-level — no technical specs |

**Key sections:**
- Business problem / opportunity
- Project objectives and success criteria
- Scope (in scope / out of scope)
- Assumptions and constraints
- High-level timeline and budget

**Example (Sales Dashboard):**
> "James Rodriguez spends 3–4 hours weekly consolidating Excel reports. The objective is to eliminate that manual work by delivering an automated Sales Dashboard that surfaces KPIs in real time."

---

### BRS — Business Requirements Specification

The **BRS** translates the BRD's high-level goals into specific, measurable business requirements. It answers: **"What exactly does the business need?"**

| Field | Description |
|-------|-------------|
| **Author** | Business Analyst |
| **Audience** | Project team, QA, developers |
| **When written** | Requirements gathering phase |
| **Level of detail** | Medium — business rules, not technical implementation |

**Key sections:**
- Functional business requirements (numbered, e.g., BR-01)
- Business rules and logic
- Reporting requirements
- Priority classification (Must-have / Nice-to-have)

**Example requirement:**
> **BR-03** — The system shall allow the Sales Manager to filter all KPIs by Region, Sales Rep, Product Category, and Time Period.

---

### URS — User Requirements Specification

The **URS** documents requirements from the **end user's perspective**, typically written as user stories or use cases. It answers: **"What does the user need to accomplish?"**

| Field | Description |
|-------|-------------|
| **Author** | Business Analyst / UX Designer |
| **Audience** | Development team, UX team, QA |
| **When written** | After stakeholder interviews |
| **Level of detail** | Medium — user-centric, not technical |

**Format:** User stories follow the pattern:
> *"As a [role], I want to [action] so that [outcome]."*

**Example:**
> *"As a Regional Sales Manager, I want to see each rep's Quota Attainment % so that I can identify who needs coaching before month-end."*

---

### SRS — Software Requirements Specification

The **SRS** is the most technical requirements document. It defines both functional and non-functional requirements that the engineering team will implement. It answers: **"What must the system do, technically?"**

| Field | Description |
|-------|-------------|
| **Author** | Business Analyst + Technical Lead |
| **Audience** | Developers, architects, QA engineers |
| **When written** | After BRS and URS are approved |
| **Level of detail** | High — includes system behavior, APIs, performance specs |

**Key sections:**
- Functional requirements (system-level)
- Non-functional requirements (performance, security, availability)
- System interfaces and integrations
- Error handling and edge cases

**Example non-functional requirement:**
> **NFR-02** — The dashboard must load within 5 seconds for up to 20 concurrent users, measured under normal network conditions.

---

### PTP — Project Transition Plan

The **PTP** defines how the solution will be handed off from the project team to operations / end users. It answers: **"How do we go from delivery to live?"**

| Field | Description |
|-------|-------------|
| **Author** | Project Manager / Business Analyst |
| **Audience** | Operations team, end users, IT support |
| **When written** | Pre-go-live phase |
| **Level of detail** | Medium — logistics and readiness |

**Key sections:**
- Training plan for end users
- Cutover approach (parallel run vs. hard cutover)
- Rollback plan in case of issues
- Support model post-launch
- Go/No-Go criteria

---

### DMP — Data Management Plan

The **DMP** documents how data will be collected, stored, governed, and maintained throughout the project. It answers: **"How is data handled responsibly?"**

| Field | Description |
|-------|-------------|
| **Author** | Data Analyst / Data Engineer |
| **Audience** | Data team, IT, compliance |
| **When written** | Requirements and design phase |
| **Level of detail** | Medium to high |

**Key sections:**
- Data sources and ownership
- Data refresh frequency and ETL schedule
- Data quality rules and validation
- Retention and archiving policy
- Access permissions and security classification

**Example entry:**
> | Data Source | Owner | Refresh | Access |
> |-------------|-------|---------|--------|
> | Salesforce CRM | IT Team | Daily at midnight | Analysts + Manager |
> | Sales Target DB | Finance | Monthly | Manager only |

---

### DTP — Data Test Plan

The **DTP** defines how data quality and accuracy will be validated before go-live. It answers: **"How do we prove the data is correct?"**

| Field | Description |
|-------|-------------|
| **Author** | QA Engineer / Data Analyst |
| **Audience** | QA team, data engineers, business stakeholders |
| **When written** | Testing phase |
| **Level of detail** | High — specific test cases |

**Key sections:**
- Test objectives and scope
- Data validation rules (e.g., no nulls in Amount, dates in range)
- Row count reconciliation (source vs. target)
- KPI calculation verification
- Acceptance criteria

**Example test case:**
> **DT-05** — Verify that Total Revenue in the dashboard matches the SUM of Amount from the Salesforce export for September 2026, with a tolerance of $0.00.

---

## Quick Reference Comparison

| Document | Author | Answers | Phase |
|----------|--------|---------|-------|
| **BRD** | Sponsor / BA | Why are we doing this? | Initiation |
| **BRS** | BA | What does the business need? | Requirements |
| **URS** | BA / UX | What does the user need? | Requirements |
| **SRS** | BA + Tech Lead | What must the system do technically? | Design |
| **PTP** | PM / BA | How do we go live? | Pre-launch |
| **DMP** | Data Analyst | How is data managed? | Design + Ongoing |
| **DTP** | QA / Data Analyst | How do we prove the data is right? | Testing |

---

## Key Takeaways

1. **Start with WHY (BRD)**, then narrow to WHAT (BRS/URS), then HOW (SRS).
2. **DMP and DTP** are critical for data projects — without them, you risk delivering a dashboard with wrong numbers.
3. **PTP** is often forgotten but ensures users can actually adopt the solution.
4. All documents should be **traceable** — every requirement in the SRS should link back to a business need in the BRD.

---

*BIA Mentoring Program | Prepared by: Stephanie Arredondo*
