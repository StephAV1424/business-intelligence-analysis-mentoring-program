# Part 2 – Requirements Modeling

> **Course:** BIA Mentoring Program | Business Intelligence & Analytics
> **Topic:** Requirements Modeling — Data Models (CDM, LDM, PDM), Context Diagrams, User Stories, Decision Tables, Data Flow Diagrams

---

## Overview

Requirements modeling transforms written requirements into **visual representations** that are easier to validate, communicate, and build from. Models bridge the gap between business stakeholders (who think in terms of goals) and technical teams (who think in terms of data structures and system behavior).

> **Rule of thumb:** If you can't draw it, you don't fully understand it yet.

---

## 1. Data Models

Data models define the structure of data in a system at different levels of abstraction. There are three main levels: **CDM → LDM → PDM**, each adding more technical detail.

![Data Model Progression](images/data_models_progression.png)

---

### CDM — Conceptual Data Model

The **CDM** is the highest-level representation. It shows the main business **entities** and their **relationships** without any technical detail.

- **Audience:** Business stakeholders, product owners
- **Purpose:** Align on what the business data looks like at a glance
- **Contains:** Entities + relationships only (no attributes, no data types)

**Notation:** Boxes (entities) connected by lines with cardinality labels (one-to-many, many-to-many).

**Example — Sales Dashboard CDM:**

```
Customer ──── places ────> Order
Order    ──── contains ──> Product
Sales Rep ─── achieves ──> Sales Target
Region   ──── groups ────> Sales Rep
```

**Key questions a CDM answers:**
- What are the main "things" in our domain?
- How are they related at a business level?
- What is in scope vs. out of scope?

---

### LDM — Logical Data Model

The **LDM** adds **attributes and data types** to the CDM. It is technology-independent but precise enough for analysts to design reports and developers to plan tables.

- **Audience:** Business Analysts, data architects
- **Purpose:** Specify what data each entity holds, without committing to a database platform
- **Contains:** Entities + attributes + data types + primary keys + relationships

**Example — Sales Dashboard LDM:**

| Entity | Attributes |
|--------|-----------|
| **Sales Transaction** | TransactionID (int, PK), SaleDate (date), Amount (decimal), Quantity (int), RepID (int, FK), ProductID (int, FK), CustomerID (int, FK), RegionID (int, FK) |
| **Sales Rep** | RepID (int, PK), FullName (varchar 100), RegionID (int, FK), Quota (decimal), HireDate (date) |
| **Region** | RegionID (int, PK), RegionName (varchar 50) |
| **Product** | ProductID (int, PK), ProductName (varchar 100), Category (varchar 50), UnitPrice (decimal) |
| **Sales Target** | TargetID (int, PK), RepID (int, FK), RegionID (int, FK), Period (varchar 20), TargetAmount (decimal) |

**Relationship types:**
- `1:N` — One region has many sales reps
- `1:N` — One rep makes many transactions
- `M:N` — Many products appear in many transactions (resolved via a junction table in the PDM)

---

### PDM — Physical Data Model

The **PDM** is the implementation-ready model. It maps directly to actual database tables, with platform-specific data types, indexes, constraints, and stored procedures.

- **Audience:** Database engineers, backend developers
- **Purpose:** Blueprint for actually building the database
- **Contains:** Tables, columns, exact data types, indexes, foreign key constraints, naming conventions

**Example — PDM SQL for Sales Transaction:**

```sql
CREATE TABLE sales_transaction (
    transaction_id   INT           PRIMARY KEY AUTO_INCREMENT,
    sale_date        DATE          NOT NULL,
    amount           DECIMAL(12,2) NOT NULL,
    quantity         INT           DEFAULT 1,
    rep_id           INT           NOT NULL,
    product_id       INT           NOT NULL,
    customer_id      INT           NOT NULL,
    region_id        INT           NOT NULL,
    created_at       TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rep_id)      REFERENCES sales_rep(rep_id),
    FOREIGN KEY (product_id)  REFERENCES product(product_id),
    FOREIGN KEY (region_id)   REFERENCES region(region_id)
);

CREATE INDEX idx_sale_date ON sales_transaction(sale_date);
CREATE INDEX idx_rep_id    ON sales_transaction(rep_id);
```

**CDM → LDM → PDM Summary:**

| Aspect | CDM | LDM | PDM |
|--------|-----|-----|-----|
| Audience | Business | Analysts | Engineers |
| Attributes | No | Yes | Yes |
| Data types | No | Logical | Platform-specific |
| Keys | No | Primary keys | PK + FK + indexes |
| SQL ready? | No | No | Yes |

---

## 2. Context Diagram

A **Context Diagram** (also called a Level 0 DFD) shows the system as a single process and identifies all **external entities** that interact with it. It defines the system boundary.

- **Audience:** All stakeholders — business and technical
- **Purpose:** Agree on what is inside and outside the system
- **Contains:** One central process + external entities + data flows (no internal detail)

![Context Diagram – Sales Dashboard](images/context_diagram.png)

**Reading the diagram:**
- The **circle** = the entire system (treated as a black box)
- The **rectangles** = external entities (people, systems, databases)
- The **arrows** = data flows in and out of the system

**Tips for drawing a good Context Diagram:**
- There is always exactly **one process** (the system)
- Show every external entity that either **sends data to** or **receives data from** the system
- Label every arrow with the name of the data flow, not the action
- Keep it simple — no internal processes or data stores

---

## 3. User Stories

A **User Story** is a short, user-centric requirement written from the perspective of an end user. It captures the **who**, **what**, and **why** of a feature.

**Standard format:**
> *"As a [role], I want to [action] so that [outcome/benefit]."*

User stories are accompanied by **Acceptance Criteria** — the specific conditions that must be true for the story to be considered done.

### Structure

| Component | Purpose | Example |
|-----------|---------|---------|
| **Role** | Who benefits from this feature | Regional Sales Manager |
| **Action** | What they want to do | Filter KPIs by region |
| **Outcome** | Why — the business value | Identify underperforming areas quickly |
| **Acceptance Criteria** | How we know it's done | Filter applies to all charts simultaneously |

### Example — Sales Dashboard User Stories

**Epic:** See regional sales performance in real time

| ID | User Story | Acceptance Criteria |
|----|-----------|---------------------|
| US-01 | As a Regional Sales Manager, I want to filter all KPIs by region and date range so that I can identify which areas are underperforming. | All dashboard charts update when a filter is applied. Filter resets to current month by default. |
| US-02 | As a Regional Sales Manager, I want to see a ranking of my sales reps by total revenue so that I can recognize top performers and support those who are falling behind. | Ranking table shows all 8 reps sorted by revenue descending. Highlights top 3 in green. |
| US-03 | As a Regional Sales Manager, I want to view KPI trend lines for the past weeks so that I can detect early warning signs before month-end. | Line chart shows last 4 weeks of daily/weekly revenue. Hovering shows exact value. |

**Epic:** Reduce time spent on manual reports

| ID | User Story | Acceptance Criteria |
|----|-----------|---------------------|
| US-04 | As a Regional Sales Manager, I want to export a PDF summary with one click so that I can share it in my Monday meeting without building it manually. | PDF exports in under 10 seconds. Includes active filters and current KPI values. |
| US-05 | As a Regional Sales Manager, I want to receive an automated report by email every Monday at 7:00 AM so that I have the weekly overview before my team meeting. | Email arrives by 7:05 AM. Contains previous week's summary. |

### Tips for writing good User Stories
- Keep them small enough to complete in one sprint
- Write one story per user need — don't bundle multiple actions
- Acceptance Criteria must be **testable** ("loads in under 5 seconds" not "loads fast")
- Prioritize using **MoSCoW**: Must-have, Should-have, Could-have, Won't-have

---

## 4. Decision Tables

A **Decision Table** maps combinations of conditions to specific actions. It is used when business logic involves multiple rules that can interact — making it easy to spot missing or overlapping cases.

- **Audience:** Business Analysts, QA engineers, developers
- **Purpose:** Document complex conditional logic clearly and completely
- **Contains:** Conditions (rows) + rules (columns) + actions

![Decision Table – Sales Rep Performance Routing](images/decision_table.png)

### Structure

```
┌─────────────────────────────┬────────┬────────┬────────┐
│ Conditions / Actions        │ Rule 1 │ Rule 2 │ Rule 3 │
├─────────────────────────────┼────────┼────────┼────────┤
│ Condition A is true         │   Y    │   Y    │   N    │
│ Condition B is true         │   Y    │   N    │   Y    │
├─────────────────────────────┼────────┼────────┼────────┤
│ Action 1                    │   ✓    │        │        │
│ Action 2                    │        │   ✓    │   ✓    │
└─────────────────────────────┴────────┴────────┴────────┘
```

### Tips for building Decision Tables
- List **all conditions** first, then all actions below a separator line
- Each column is one **unique combination** of Y/N conditions
- The number of possible rules = 2^(number of conditions) — but many can be consolidated
- Use Decision Tables in QA to ensure all rule combinations have a defined test case

---

## 5. Data Flow Diagrams (DFD)

A **Data Flow Diagram** shows how data moves through a system — from external sources, through processes, to data stores and outputs. DFDs are drawn at different levels of detail.

![Data Flow Diagram – Level 1](images/dfd_level1.png)

### DFD Notation

| Symbol | Name | Meaning |
|--------|------|---------|
| Rectangle | External Entity | A person or system outside the scope that sends or receives data |
| Circle / Rounded box | Process | A transformation that changes or moves data |
| Open rectangle | Data Store | Where data is held at rest (database, file, etc.) |
| Arrow | Data Flow | The movement of data between elements |

### DFD Levels

| Level | Name | Shows |
|-------|------|-------|
| **Level 0** | Context Diagram | The system as one process + all external entities |
| **Level 1** | System DFD | Major internal processes, main data stores, all external flows |
| **Level 2** | Process DFD | One Level 1 process decomposed into sub-processes |

### Example — Sales Dashboard Level 1 Decomposition

```
[CRM Salesforce] ──> (1.0 Ingest Data) ──> [D1 Sales Transactions]
                                                       |
[Sales Target DB] ──> (2.0 Load Targets) ──> [D2 Sales Targets]
                                                       |
                         [D1] + [D2] ──> (3.0 Calculate KPIs) ──> [D3 KPI Results]
                                                                          |
                                           [D3] ──> (4.0 Generate Reports) ──> [Manager James]
```

### When to use DFDs vs. other diagrams

| Diagram | Best for |
|---------|---------|
| Context Diagram | Defining system boundaries |
| Level 1 DFD | Showing major processes and data flow end-to-end |
| ERD / Data Model | Showing data structure and relationships |
| User Story | Capturing a single user need |
| Decision Table | Documenting complex conditional logic |

---

## Quick Reference: Modeling Tools

| Model | Answers | Key Output |
|-------|---------|-----------|
| **CDM** | What are the main business entities? | Entity-relationship overview |
| **LDM** | What data does each entity hold? | Attribute table with data types |
| **PDM** | How is data stored in the database? | SQL DDL / Table definitions |
| **Context Diagram** | What is inside vs. outside the system? | System boundary map |
| **User Story** | What does the user need to accomplish? | Story + Acceptance Criteria |
| **Decision Table** | What action follows from each combination of conditions? | Rules matrix |
| **DFD** | How does data move through the system? | Flow diagram by level |

---

## Key Takeaways

1. **CDM → LDM → PDM** is a progression from business understanding to technical implementation. Never jump straight to the PDM without agreeing on the CDM first.
2. **Context Diagrams** are the single most useful artifact for aligning everyone on scope — draw one early.
3. **User Stories** should drive DFD design — if a story can't be traced to a data flow, something is missing.
4. **Decision Tables** prevent ambiguity in business rules and make QA test case creation straightforward.
5. **DFDs** are essential for data projects because they make data lineage visible to everyone — from the CRM to the dashboard.

---

*BIA Mentoring Program | Prepared by: Stephanie Arredondo*
