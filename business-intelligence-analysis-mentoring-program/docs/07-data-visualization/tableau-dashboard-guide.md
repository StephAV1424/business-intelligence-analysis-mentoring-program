# Tableau – Sales Dashboard Build Guide
**BIA Mentoring Program | Module 10 | Stephanie Arredondo**

---

## Before You Start

Download **Tableau Public** (free): https://public.tableau.com/app/discover

You will need two CSV files:
- `sales_transactions.csv` — 209 transactions (Jan–Sep 2026)
- `sales_targets.csv` — Monthly quotas per sales rep

Both files are available in the [`/data`](../../data/) folder.

---

## Step 1 – Connect the Data

1. Open Tableau Public → **Connect to Data** → **Text File**
2. Select `sales_transactions.csv`
3. In the **Data Source** panel, drag `sales_targets.csv` into the join area
4. Configure the join:
   - Click the join icon between tables → type: **Left Join**
   - Join condition: `RepID = RepID` and `PeriodDate ≈ SaleDate` (month-level match)
   - **Recommended alternative:** keep them as separate data sources and use a Tableau Relationship instead of a physical join to avoid row inflation
5. Verify field types:
   - `SaleDate` → Date
   - `Amount`, `TargetAmount` → Number (decimal)
   - `Region`, `RepName`, `Category` → String

---

## Step 2 – Create Calculated Fields

Before building any views, create the following fields under **Analysis → Create Calculated Field**:

| Field | Formula |
|-------|---------|
| **Quota Attainment %** | `SUM([Amount]) / SUM([TargetAmount])` |
| **Month-Year** | `DATETRUNC('month', [SaleDate])` |
| **Quarter** | `DATEPART('quarter', [SaleDate])` |
| **Performance Flag** | `IF SUM([Amount]) >= SUM([TargetAmount]) THEN "On Target" ELSE "Below Target" END` |

---

## Step 3 – Build the 4 Worksheets

### Sheet 1 – KPI Cards (Total Revenue, Deals Closed, Quota %)
1. New sheet → rename to "KPI Cards"
2. Change chart type to **Text**
3. Create one text mark per KPI:
   - `SUM(Amount)` → format as currency
   - `COUNT(TransactionID)` → format as integer
   - `Quota Attainment %` → format as percentage
4. For the card style: **Format → Shading** → white background, light gray border

### Sheet 2 – Revenue by Region (Bar Chart)
1. New sheet → rename to "Revenue by Region"
2. Drag `Region` to **Columns**
3. Drag `Amount` (SUM) to **Rows**
4. Chart type: **Bar**
5. Drag `Region` to **Color** in Marks:
   - North: Navy `#1B4F8A`
   - South: Medium Blue `#2E86C1`
   - West: Light Blue `#5DADE2`
6. Add `SUM(Amount)` to **Label** → display at top of each bar
7. Sort descending: click the axis → Sort → Descending

### Sheet 3 – Monthly Sales Trend (Line Chart)
1. New sheet → rename to "Sales Trend"
2. Drag `SaleDate` to **Columns** → right-click → **Month (continuous)**
3. Drag `Amount` (SUM) to **Rows**
4. Chart type: **Line**
5. Optional: drag `Region` to **Color** to show separate lines per region
6. Add a **Reference Line**: Analytics pane → Reference Line → Average
7. Line color: `#1B4F8A`, thickness 2px

### Sheet 4 – Top Reps Ranking (Horizontal Bar)
1. New sheet → rename to "Top 5 Reps"
2. Drag `RepName` to **Rows**
3. Drag `Amount` (SUM) to **Columns**
4. Chart type: **Bar** → swap rows/columns to make it horizontal
5. Drag `Performance Flag` to **Color**:
   - "On Target" → Green `#27AE60`
   - "Below Target" → Red `#E74C3C`
6. Sort by SUM(Amount) descending
7. Filter to Top 5: right-click `RepName` → Filter → Top 5 by SUM(Amount)
8. Add `SUM(Amount)` to **Label**

---

## Step 4 – Build the Dashboard

1. Click the Dashboard icon at the bottom → **New Dashboard**
2. Size: **Fixed → 1200 × 800** (or "Automatic")
3. Drag sheets onto the canvas in this layout:

```
┌─────────────────────────────────────────────────────┐
│  FILTERS: Time Period │ Region │ Sales Rep           │
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

4. Set up **global filters**:
   - Click any chart → add a Time Period filter → "Apply to Worksheets → All Using This Data Source"
   - Repeat for Region and RepName

---

## Step 5 – Apply Professional Formatting

| Element | Setting |
|---------|---------|
| General font | Tableau Book or Arial, 11pt |
| Dashboard title | Bold, 16pt, color `#1B4F8A` |
| Sheet backgrounds | White (`#FFFFFF`) |
| Sheet borders | Light gray, 1px |
| Padding between sheets | 8px |
| Tooltips | Enabled — describe data in business language |
| Colors | Navy for "On Target", red for "Below Target" |

**Design rule:** every element on the dashboard must answer a question for James. Before publishing, ask yourself: *"Is this element necessary?"*

---

## Step 6 – Publish and Submit

1. **File → Save to Tableau Public**
2. Sign in with your free account at public.tableau.com
3. The dashboard will be live at a public URL → that URL is your submission
4. Copy the URL and attach it in the module submission form

---

## Evaluation Checklist (Module 10)

- [ ] All KPIs defined in Module 4 are visible
- [ ] Region, Time Period, and Sales Rep filters work
- [ ] Colors communicate status (green = on target, red = below target)
- [ ] No technical jargon in labels — business language only
- [ ] Descriptive tooltips on every chart
- [ ] Layout matches the wireframe
- [ ] Dashboard loads in under 5 seconds

---

*BIA Mentoring Program | Module 10 | Stephanie Arredondo*
